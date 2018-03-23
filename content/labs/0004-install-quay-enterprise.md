---
layout: lab
title: Deploy Quay Enterprise
permalink: /lab/install/quay-enterprise
module: Installation
---

Begin the Quay Enterprise deployment by creating a brand new role that allows retrieving and writing Kubernetes secrets via the Kubernetes API.

```
kubectl create -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: Role
metadata:  
  namespace: quay-enterprise
  name: quay-enterprise-serviceaccount
rules:
- apiGroups:
  - ""
  resources:
  - secrets
  verbs:
  - get
  - put
  - patch
  - update
- apiGroups:
  - ""
  resources:
  - namespaces
  verbs:
  - get
EOF
```

Bind the new role to the default service account within the `quay-enterprise` namespace.

```
kubectl create -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: RoleBinding
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-secret-writer
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: quay-enterprise-serviceaccount
subjects:
- kind: ServiceAccount
  name: default
```

A container image of the Quay Enterprise software resides in a private coreos repository (quay.io/coreos/quay).  To retrieve the image, we will need a pull secret.

```
cat >> config.json <<EOF
{
  "auths": {
    "quay.io": {
      "auth": "Y29yZW9zK3RlYzJfaWZidWdsanJpaTJ0b25icmlyY2Myb2tmaTo1OExGU1pDUlczUzFYNkdaSlhBMFFJRkhOTllaWjlDNjFZMDQxOU9WVkE5TVZJSzRUM1hFN0xJR0g3M1M3STNa",
      "email": ""
    }
  }
}
EOF
```

Add the pull secret to Kubernetes by creating a Kubernetes secret.

```
kubectl create secret generic coreos-pull-secret --from-file=".dockerconfigjson=config.json" --type='kubernetes.io/dockerconfigjson' --namespace=quay-enterprise
```

Add an empty Quay Enterprise secret. The Quay Enterprise software `/config/stack/config.yaml` will be written to this secret after initial setup.

```
kubectl create -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-config-secret
EOF
```

Create the Redis in-memory data structure store for caching of real-time events. It is not necessary to make Redis highly available in a production environment.


```
kubectl create -f - <<EOF
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-redis
  labels:
    quay-enterprise-component: redis
spec:
  replicas: 1
  selector:
    matchLabels:  
      quay-enterprise-component: redis
  template:
    metadata:
      namespace: quay-enterprise
      labels:
        quay-enterprise-component: redis
    spec:
      containers:
      - name: redis-master
        image: quay.io/quay/redis
        ports:
        - containerPort: 6379
---
apiVersion: v1
kind: Service
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-redis
  labels:
    quay-enterprise-component: redis
spec:
  ports:
    - port: 6379
  selector:
    quay-enterprise-component: redis
EOF
```

And finally, deploy the Quay Enterprise application and expose it as a Load Balancer service. This will automatically create a, Cluster IP, Node Port, and Amazon Elastic Load Balancer.

```
kubectl create -f - <<EOF
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-app
  labels:
    quay-enterprise-component: app
spec:
  replicas: 1
  selector:
    matchLabels:
      quay-enterprise-component: app
  template:
    metadata:
      namespace: quay-enterprise
      labels:
        quay-enterprise-component: app
    spec:
      volumes:
        - name: configvolume
          secret:
            secretName: quay-enterprise-config-secret
      containers:
      - name: quay-enterprise-app
        image: quay.io/coreos/quay:v2.8.0
        ports:
        - containerPort: 80
        volumeMounts:
        - name: configvolume
          readOnly: false
          mountPath: /conf/stack
      imagePullSecrets:
        - name: coreos-pull-secret
---
apiVersion: v1
kind: Service
metadata:
  namespace: quay-enterprise
  name: quay-enterprise
spec:
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      name: http
  selector:
    quay-enterprise-component: app
EOF
```

After deploying, find the AWS Elastic Load Balancer URL and open in your browser.

kubectl -n quay-enterprise get services quay-enterprise -o wide

You will be prompted for your Tectonic license:

```
eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJzY2hlbWFWZXJzaW9uIjoidjIiLCJ2ZXJzaW9uIjoiNCIsImNyZWF0aW9uRGF0ZSI6IjIwMTgtMDMtMTlUMjM6MDI6MjVaIiwiZXhwaXJhdGlvbkRhdGUiOiIyMDE5LTAzLTI2VDIzOjAxOjMwWiIsImxpY2Vuc2UiOiJ7XCJzY2hlbWFWZXJzaW9uXCI6XCJ2MlwiLFwidmVyc2lvblwiOlwiNFwiLFwiYWNjb3VudElEXCI6XCJBQ0MtMUI1NzQxREQtOUVBNi00Q0Y0LThEOTktMkQzNDdDNDRcIixcImFjY291bnRTZWNyZXRcIjpcImI5NmY2NDJkLTlkYjktNDIyMC1hMGU2LTU0OWQ2YmQ0Zjk0YVwiLFwiY3JlYXRpb25EYXRlXCI6XCIyMDE4LTAzLTE5VDIzOjAyOjI1LjgxNTQzMVpcIixcImV4cGlyYXRpb25EYXRlXCI6XCIyMDE5LTAzLTI2VDIzOjAxOjMwWlwiLFwic3Vic2NyaXB0aW9uc1wiOntcIlNVQi0yRUIyMjI3RC0yQjI0LTRCMkMtQUExRC03Rjc4QzdGMFwiOntcInBsYW5OYW1lXCI6XCJxdWF5LWVudGVycHJpc2UtdHJpYWwtMzAtZGF5c1wiLFwicHVibGljUGxhbk5hbWVcIjpcIlF1YXkgRW50ZXJwcmlzZSBUcmlhbFwiLFwicGxhbklEXCI6XCJQUlAtRkZEMTdCMUYtODZDMC00OTU4LTk5QTgtNEZGMUVGNkJcIixcInByb2R1Y3ROYW1lXCI6XCJxdWF5LWVudGVycHJpc2VcIixcInB1YmxpY1Byb2R1Y3ROYW1lXCI6XCJRdWF5IEVudGVycHJpc2VcIixcInByb2R1Y3RJRFwiOlwiUFJPLTQzRTREOEE2LThENTEtNDQ2RS1CMjYzLUQwQTY1QzlGXCIsXCJzZXJ2aWNlU3RhcnRcIjpcIjIwMTgtMDMtMTlUMjM6MDI6MTlaXCIsXCJzZXJ2aWNlRW5kXCI6XCIyMDE4LTA0LTI1VDIzOjAyOjE5WlwiLFwidHJpYWxFbmRcIjpcIjIwMTgtMDQtMThUMjM6MDI6MTlaXCIsXCJpblRyaWFsXCI6dHJ1ZSxcInRyaWFsT25seVwiOnRydWUsXCJkdXJhdGlvblwiOjMwLFwiZHVyYXRpb25QZXJpb2RcIjpcImRheXNcIixcImVudGl0bGVtZW50c1wiOntcImNvc3RcIjoxLFwic29mdHdhcmUucXVheVwiOjEsXCJzb2Z0d2FyZS5xdWF5LmRlcGxveW1lbnRzXCI6MX19LFwiU1VCLUZDQTUwNTM1LUFFMEQtNEQxQi05RThCLTZGMEY2MjZDXCI6e1wicGxhbk5hbWVcIjpcInRlY3RvbmljLTIwMTYtMTItZnJlZS12MVwiLFwicHVibGljUGxhbk5hbWVcIjpcIkNvcmVPUyBUZWN0b25pYyBGcmVlXCIsXCJwbGFuSURcIjpcIlBSUC1GQTBFRTdCQy1GRTI5LTRBNkMtOUU5Qy03QkI5NDA0RFwiLFwicHJvZHVjdE5hbWVcIjpcInRlY3RvbmljLTIwMTYtMTJcIixcInB1YmxpY1Byb2R1Y3ROYW1lXCI6XCJDb3JlT1MgVGVjdG9uaWNcIixcInByb2R1Y3RJRFwiOlwiUFJPLThFRDRBMjE1LTJGNkEtNEQxNy04RkJDLUM2QjBBRDUwXCIsXCJzZXJ2aWNlU3RhcnRcIjpcIjIwMTgtMDMtMTlUMjM6MDE6MzBaXCIsXCJzZXJ2aWNlRW5kXCI6XCIyMDE5LTAzLTI2VDIzOjAxOjMwWlwiLFwiaW5UcmlhbFwiOmZhbHNlLFwidHJpYWxPbmx5XCI6ZmFsc2UsXCJkdXJhdGlvblwiOjEsXCJkdXJhdGlvblBlcmlvZFwiOlwieWVhcnNcIixcImVudGl0bGVtZW50c1wiOntcImNvc3RcIjoxLFwic29mdHdhcmUudGVjdG9uaWMtMjAxNi0xMlwiOjEsXCJzb2Z0d2FyZS50ZWN0b25pYy0yMDE2LTEyLmZyZWUtbm9kZS1jb3VudFwiOjEwfX19fSJ9.RiD-XTPMbNSpkYdkT0Fg2OZtMLkypwvFnZlBOYwpIGGoe9KvEBKO6soZGCsDaBNVDnkmlcIh9El6l2RGiSb0jjLerXqyEFH20ia2qY6WpItE1x9GtuEdKXo6DA8wJx3fix7kI4jTwGMnswAMRAdWZZuR4LYKHZGsrg5S8jxbRJB-qxOYsGabb_54GWfk9o9ZyJnAbUywwnix4VjVsR_1W6G1DwXbn1F3QjuWztzrXKwqa95TukCb9gaZmXi_Z7Vn_8eTfQ6xpEDXnH7EwpUuJ36ZKEJUOPAjhHcEy4BxxIaoH50rGHJWtWQCh8C_Syi03NX-TexOrkPXMmjWYdb4Lw```

Enter the following information:

Database Type: `postgres`
Database Server: `quay-postgres-service`
Username: `coreosuser`
Password: `coreostrainme`
Database Name: `enterpriseregistrydb`

When prompted, select `Restart Container`.

Create your Quay Enterprise SuperUser (Admin) account. Only SuperUsers can edit configuration settings.

Username: `admin`
Email address: `admin@coreostrain.me`
Password: `coreostrainme`

Once you arrive on the primary configuration screen, we will only provide the Redis instance information.

Redis Hostname: 'quay-enterprise-redis'
Redis Port: '6379'

Select `Save Configuration` and `Restart Container`.

After the container starts back up, verify all Quay Enterprise services are up and you get back a status code 200.

```
curl http://<YOUR-AMAZON-ELB>/health/endtoend
```