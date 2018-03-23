---
layout: lab
title: Configure Docker for an Insecure Registry
permalink: /lab/configure-docker/
module: Configure Docker
---

Fetch the URL of your AWS Elastic Load Balancer that's currently exposing Quay Enterprise to the public.

```
HOSTNAME=`kubectl get svc quay-enterprise -o jsonpath={.status.loadBalancer.ingress[0].hostname}`
```

Verify the variable was properly set.

```
echo $HOSTNAME
```
Configure docker to use our insecure registry. In a production Quay Enterprise environment, always ensure TLS is configured and enabled.

sudo bash -c "cat > /etc/docker/daemon.json" <<EOF
{
    "insecure-registries" : ["$HOSTNAME:80"]
  }
EOF


Restart Docker so that the newly created configuation changes are picked up.

```
sudo systemctl restart docker
```