---
layout: lab
title: Deploy a Relational Database
permalink: /lab/install/postgres
module: Installation
---

List all namespaces in your Kubernetes lab environment.

```
kubectl get namespaces
```

Create a new namespace for Quay Enterprise.

```
kubectl create namespace quay-enterprise
```

Create a StorageClass for Amazon Web Service's Elastic Block Storage

```
kubectl create -f - <<EOF
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: default
provisioner: kubernetes.io/aws-ebs
reclaimPolicy: Delete
parameters:
  type: gp2
EOF
```

Create a Postgres superuser password.

```
kubectl -n quay-enterprise create secret generic postgres-superuser-pass --from-literal=password=coreostrainme
```

Create a Postgres StatefulSet and Service.

```
kubectl create -f - <<\EOF
apiVersion: v1
kind: Service
metadata:
  namespace: quay-enterprise
  name: quay-postgres-service
  labels:
    quay-enterprise-component: postgres
spec:
  selector:
    quay-enterprise-component: postgres
  ports:
  - name: postgres
    protocol: TCP
    port: 5432
  clusterIP: None
---
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  namespace: quay-enterprise
  name: quay-postgres
spec:
  serviceName: "quay-postgres-service"
  replicas: 1
  template:
    metadata:
      labels:
        quay-enterprise-component: postgres
    spec:
      terminationGracePeriodSeconds: 10
      containers:
      - image: postgres:10
        name: postgres
        env:
        - name: POSTGRES_PASSWORD
          valueFrom:
            secretKeyRef:
              name: postgres-superuser-pass
              key: password
        - name: POSTGRES_USER
          value: coreosuser
        - name: POSTGRES_DB
          value: enterpriseregistrydb
        ports:
        - containerPort: 5432
          name: postgres
        imagePullPolicy: Always
        volumeMounts:
        - name: postgres-vol
          mountPath: /var/lib/postgresql
          subPath: data
        readinessProbe:
          exec:
            command:
            - /bin/sh
            - -c
            - '/usr/bin/psql -U$POSTGRES_USER -d$POSTGRES_DB -c"SELECT 1"'
          initialDelaySeconds: 5
          periodSeconds: 10
        livenessProbe:
          exec:
            command:
            - /usr/bin/pg_isready
          initialDelaySeconds: 15
          periodSeconds: 20
  volumeClaimTemplates:
  - metadata:
      name: postgres-vol
    spec:
      storageClassName: default
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
EOF
```

Confirm the statefulset and its pod have been successfully created.

```
kubectl -n quay-enterprise get statefulset
kubectl -n quay-enterprise get pods
```

Confirm you can successfully connect to the database. Enter password `coreostrainme`

```
kubectl -n quay-enterprise run -it --rm --image=postgres:10 --restart=Never psql -- psql -h quay-postgres-service -U coreosuser -d enterpriseregistrydb
```

To list databases run `\l`.

To exit, `\quit`.