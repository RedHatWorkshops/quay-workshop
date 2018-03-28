---
layout: lab
title: Deploy the Quay Enterprise Application
permalink: /lab/install/quay-enterprise
module: Quay Enterprise Installation
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
EOF
```

A container image of the Quay Enterprise software resides in a private CoreOS repository (quay.io/coreos/quay).  To retrieve the image, we will need a pull secret.

```
cat > config.json <<EOF
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
kubectl -n quay-enterprise create secret generic coreos-pull-secret --from-file=".dockerconfigjson=config.json" --type='kubernetes.io/dockerconfigjson'
```

Add an empty Quay Enterprise secret. The Quay Enterprise application will write its configuration information to this secret via the Kubernetes API. The configuration file will be available at   `/config/stack/config.yaml` within the Quay Enterprise application pod.

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

We will now deploy the Quay Enterprise application and expose it to the outside world via an AWS Elastic LoadBalancer.

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
    - protocol: TCP
      port: 443
      targetPort: 443
      name: https
  selector:
    quay-enterprise-component: app
EOF
```
After deploying, find the AWS Elastic Load Balancer URL and open in your browser.

```
kubectl -n quay-enterprise get services quay-enterprise -o wide
```

You will be prompted for your Tectonic license:

```
eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJzY2hlbWFWZXJzaW9uIjoidjIiLCJ2ZXJzaW9uIjoiNyIsImNyZWF0aW9uRGF0ZSI6IjIwMTgtMDMtMjZUMDU6Mzc6MzJaIiwiZXhwaXJhdGlvbkRhdGUiOiIyMDE5LTAzLTI4VDIzOjM2OjQ0WiIsImxpY2Vuc2UiOiJ7XCJzY2hlbWFWZXJzaW9uXCI6XCJ2MlwiLFwidmVyc2lvblwiOlwiN1wiLFwiYWNjb3VudElEXCI6XCJBQ0MtNTc1ODA0MTMtMkQzQy00Mjg2LTkyOUQtQzRFRkI0RjBcIixcImFjY291bnRTZWNyZXRcIjpcIjMyMzg2ZWE2LWIzYzgtNDg3My05MmE1LTczNTRmZGQ5NTA3N1wiLFwiY3JlYXRpb25EYXRlXCI6XCIyMDE4LTAzLTI2VDA1OjM3OjMyLjQ5NTY0OVpcIixcImV4cGlyYXRpb25EYXRlXCI6XCIyMDE5LTAzLTI4VDIzOjM2OjQ0WlwiLFwic3Vic2NyaXB0aW9uc1wiOntcIlNVQi0xMDhBNDExQy00OEI2LTQ1RjgtOUZDMS04QjlGRDhBOVwiOntcInBsYW5OYW1lXCI6XCJ0ZWN0b25pYy0yMDE2LTEyLWZyZWUtdjFcIixcInB1YmxpY1BsYW5OYW1lXCI6XCJDb3JlT1MgVGVjdG9uaWMgRnJlZVwiLFwicGxhbklEXCI6XCJQUlAtRkEwRUU3QkMtRkUyOS00QTZDLTlFOUMtN0JCOTQwNERcIixcInByb2R1Y3ROYW1lXCI6XCJ0ZWN0b25pYy0yMDE2LTEyXCIsXCJwdWJsaWNQcm9kdWN0TmFtZVwiOlwiQ29yZU9TIFRlY3RvbmljXCIsXCJwcm9kdWN0SURcIjpcIlBSTy04RUQ0QTIxNS0yRjZBLTREMTctOEZCQy1DNkIwQUQ1MFwiLFwic2VydmljZVN0YXJ0XCI6XCIyMDE4LTAzLTIxVDIzOjM2OjQ0WlwiLFwic2VydmljZUVuZFwiOlwiMjAxOS0wMy0yOFQyMzozNjo0NFpcIixcImluVHJpYWxcIjpmYWxzZSxcInRyaWFsT25seVwiOmZhbHNlLFwiZHVyYXRpb25cIjoxLFwiZHVyYXRpb25QZXJpb2RcIjpcInllYXJzXCIsXCJlbnRpdGxlbWVudHNcIjp7XCJjb3N0XCI6MSxcInNvZnR3YXJlLnRlY3RvbmljLTIwMTYtMTJcIjoxLFwic29mdHdhcmUudGVjdG9uaWMtMjAxNi0xMi5mcmVlLW5vZGUtY291bnRcIjoxMH19LFwiU1VCLUZCRTk3N0NELTExMDUtNDQ0OS1CQ0E2LTFBOUUzQTdBXCI6e1wicGxhbk5hbWVcIjpcInF1YXktZW50ZXJwcmlzZS10cmlhbC0zMC1kYXlzXCIsXCJwdWJsaWNQbGFuTmFtZVwiOlwiUXVheSBFbnRlcnByaXNlIFRyaWFsXCIsXCJwbGFuSURcIjpcIlBSUC1GRkQxN0IxRi04NkMwLTQ5NTgtOTlBOC00RkYxRUY2QlwiLFwicHJvZHVjdE5hbWVcIjpcInF1YXktZW50ZXJwcmlzZVwiLFwicHVibGljUHJvZHVjdE5hbWVcIjpcIlF1YXkgRW50ZXJwcmlzZVwiLFwicHJvZHVjdElEXCI6XCJQUk8tNDNFNEQ4QTYtOEQ1MS00NDZFLUIyNjMtRDBBNjVDOUZcIixcInNlcnZpY2VTdGFydFwiOlwiMjAxOC0wMy0yNlQwNTozNzoyNFpcIixcInNlcnZpY2VFbmRcIjpcIjIwMTgtMDUtMDJUMDU6Mzc6MjRaXCIsXCJ0cmlhbEVuZFwiOlwiMjAxOC0wNC0yNVQwNTozNzoyNFpcIixcImluVHJpYWxcIjp0cnVlLFwidHJpYWxPbmx5XCI6dHJ1ZSxcImR1cmF0aW9uXCI6MzAsXCJkdXJhdGlvblBlcmlvZFwiOlwiZGF5c1wiLFwiZW50aXRsZW1lbnRzXCI6e1wiY29zdFwiOjEsXCJzb2Z0d2FyZS5xdWF5XCI6MSxcInNvZnR3YXJlLnF1YXkuZGVwbG95bWVudHNcIjoxfX19fSJ9.c5ky-5uQ57ba_TttWpazVK_2TX-xxouuxp7eUFEp59yMHS5oO7xlXvEqXbfdsqBgZ8_iwhxw0I4-OBVpntz5h9fjpniD_yHTk_5HQIEsRtQXnZK9xZtVCwrSYFBLTlm_N_YSlgGFzOaxxYFhVUeG5n20AsSJJOMWymJKv7rVdBCH9wCknpLMBibrRsJupC9oVZ6In1vcfZmTNZFRcswsAP1_1FEnESKJrU8P4hEZK99JkMFtuAsLXhqf5sLW5bc0Gw7x7dJaob4ycIDlVNz07ZO_-7SnDNz_pSGZAGKQouruzCYZpjmOLAy8okWNl4XHuYDo7f28THnBqo1knpAXmg
```

Enter the following information:

Choose *Postgres* from the dropdown.
Database Server: `quay-postgres-service`
Username: `coreosuser`
Password: `coreostrainme`
Database Name: `enterpriseregistrydb`

When prompted, select `Restart Container`.

Create your Quay Enterprise SuperUser (Admin) account. Only SuperUsers can edit configuration settings.

Username: `admin`
Email address: `admin@coreostrain.me`
Password: `coreostrainme`

Before changing any SuperUser settings, let's create self-signed certificates and copy them to the Quay Enterprise pod.

Set a variable for your ELB URL.

```
QUAY=`kubectl -n quay-enterprise get svc quay-enterprise -o jsonpath={.status.loadBalancer.ingress[0].hostname}`
echo $QUAY
```

Generate the self-signed root CA. Hit 'Enter' if prompted for fields.

```
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem
```

Create the openssl.cnf file.

```
cat > openssl.cnf <<EOF
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $QUAY
DNS.2 = quay-enterprise
EOF
```

Generate a private key.

```
openssl genrsa -out ssl.key 2048
```

Generate the csr.

```
openssl req -new -key ssl.key -out ssl.csr -subj "/CN=quay-enterprise" -config openssl.cnf
```

Generate the cert.

```
openssl x509 -req -in ssl.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out ssl.cert -days 356 -extensions v3_req -extfile openssl.cnf
```

Copy the `ssl.key` and `ss.cert` into the Quay Enterprise config directory.
Note: See https://github.com/kubernetes/kubernetes/issues/58719. Skip this these commands for now.

```
#APP_POD=`kubectl -n quay-enterprise get pods -l quay-enterprise-component=app -o jsonpath={$.items[*].metadata.name}`
#echo $APP_POD
#kubectl cp ssl.cert $APP_POD:/conf/stack/ssl.cert
#kubectl cp ssl.key $APP_POD:/conf/stack/ssl.key
```

First, find your public IP address.

```
curl icanhazip.com
```

Now, stand up a simple http server and navigate to the above IP address in your browser. Download the `ssl.cert` and `ssl.key` to your local machine.

```
sudo python3 -m http.server 80
```

Open the **Super User Admin Panel** and go to **Registry Settings**.

Go to **Server Configuration** and set TLS to `Quay Enterprise Handles TLS`.

Upload your certificate and private key.

Scroll down and set the Redis hostname:

Redis Hostname: `quay-enterprise-redis`
Redis Port: `6379`

Select **Save Configuration** and **Restart Container**.

After the pod starts back up, verify all Quay Enterprise services are up and and running. You should get back a `200` status code.

```
sudo apt-get install jq
curl --insecure https://$QUAY/health/endtoend | jq
```

Be sure to verify you can successfully access the Quay UI in your web browser and bypass the **Not Secure** screen.