---
layout: lab
title: Connecting to the Lab
permalink: /lab/connect/
module: Introduction
---

#### Connect

Connect to the bastion node for the lab environment using SSH. Make sure to
replace `labXX` with your actual lab number (for example: `lab01`).

```
ssh lab@f5networks-labXX-bastion.coreostrain.me
password: coreostrainme
```

Verify connectivity to the Kubernetes lab environment

```
kubectl get nodes
```
