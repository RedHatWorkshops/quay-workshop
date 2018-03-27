---
layout: lab
title: Configure Docker for an Insecure Registry
permalink: /lab/configure-docker/
module: Configure Docker
---

Fetch the URL of your AWS Elastic Load Balancer that's currently exposing Quay Enterprise to the public.

```
QUAY=`kubectl -n quay-enterprise get svc quay-enterprise -o jsonpath={.status.loadBalancer.ingress[0].hostname}`
```

Verify the variable was properly set.

```
echo $QUAY
```

Attempt to pull down an image from the admin user namespace. It will not work because the server is using a self-signed cert.

```
docker pull $QUAY/admin/mypublicrepo
```

Configure docker to use our self-signed CA cert.

```
sudo mkdir -p /etc/docker/certs.d/$QUAY
sudo cp rootCA.pem /etc/docker/certs.d/$QUAY/ca.crt
```

Attempt to pull down an image from the admin user namespace. It will not work because we need to provide docker with our authentication credentials to access our private user namespace.

```
docker pull $QUAY/admin/mypublicrepo
```

From the Quay Enterprise dashboard, navigate to Account Settings and `Generate Encrypted Password` under Docker CLI Password.  Copy and paste your Encrypted Password.

Use the `docker login` command to automatically populate your docker config file at `/home/lab/.docker/config.json`.

```
docker login -u="admin" -p="YOUR_ENCRYPTED_PASSWORD" $QUAY
```

Attempt to pull down an image from the admin user namespace. Although we did not create the repo yet Docker communication to our Quay Enterprise deployment should be successful.

```
docker pull $QUAY/admin/mypublicrepo
```