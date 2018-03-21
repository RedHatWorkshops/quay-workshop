---
layout: lab
title: Deploy a Relational Database
permalink: /lab/install/
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
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: default
provisioner: kubernetes.io/aws-ebs
reclaimPolicy: Delete
parameters:
  type: gp2
```


Create a MySQL root password

```
kubectl create secret generic --from-literal=mysql-root-pass=coreostrainme
```

Create a MySQL password for our user that will be accessing MySQL on Quay's behalf.

```
kubectl create secret generic --from-literal=mysql-user-pass=coreostrainme
```






Output information about the Container Linux operating system.

```
cat /etc/os-release
```

Confirm the current Linux kernel version.

```
uname -a
```

Output current users on the system.

```
cat /etc/passwd
```
