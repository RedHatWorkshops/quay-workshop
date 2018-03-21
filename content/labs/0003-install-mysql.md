---
layout: lab
title: Deploy a Relational Database
permalink: /lab/install/mysql
module: Installation
---

List all namespaces in your Kubernetes lab environmnet

```
kubectl get namespaces
```

Create a new namespace for Quay Enterprise

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

Create a MySQL root password

```
kubectl create secret generic mysql-root-pass --from-literal=password=coreostrainme
```

Create a MySQL password for our user that will be accessing MySQL on Quay's behalf.

```
kubectl create secret generic mysql-user-pass --from-literal=password=coreostrainme
```

Create a MySQL StatefulSet and Service

```
kubectl create -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: quay-mysql-service
  namespace: quay-enterprise
  labels:
    app: quay
    tier: backend
    environment: dev
spec:
  selector:
    app: quay
    tier: backend
    environment: dev
  ports:
  - name: mysql
    protocol: TCP
    port: 3306
  clusterIP: None
---
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  name: quay-sql
spec:
  serviceName: "quay-mysql-service"
  replicas: 1
  template:
    metadata:
      labels:
        app: quay
        tier: backend
        environment: dev
    spec:
      terminationGracePeriodSeconds: 10
      containers:
      - image: mysql:5.7
        name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_USER
          value: coreosuser
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        - name: MYSQL_DATABASE
          value: enterpriseregistrydb
        ports:
        - containerPort: 3306
          name: mysql
        imagePullPolicy: Always
        volumeMounts:
        - name: mysql-vol
          mountPath: /var/lib/mysql
          subPath: mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-vol
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
kubectl get statefulset -n quay-enterprise
kubectl get pods -n quay-enterprise
```

Confirm you can successfully connect to the database
```
kubectl run -it --rm --image=mysql:5.7 --restart=Never mysql-client -- mysql -h coreosuser -pcoreostrainme enterpriseregistrydb
```
