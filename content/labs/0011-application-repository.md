---
layout: lab
title: Installing the Helm Registry Plugin
permalink: /lab/helm/helmregistryplugin/
module: Helm
---

Fetch the URL of your AWS Elastic Load Balancer that's currently exposing Quay Enterprise to the public.

```
QUAY=`kubectl -n quay-enterprise get svc quay-enterprise -o jsonpath={.status.loadBalancer.ingress[0].hostname}`
```

Verify the variable was properly set.

```
echo $QUAY
```

Install Helm, the Kubernetes Package Manager.

```
curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.0-rc.1-linux-amd64.tar.gz
tar xzvf helm-v2.8.0-rc.1-linux-amd64.tar.gz
chmod +x ./linux-amd64/helm
sudo mv ./linux-amd64/helm /usr/local/bin/helm
```

Verify it was successfully installed.

```
helm help
```

The Helm Registry Plugin allows users to push Helm charts to a hosted registry. We will use Quay Enterprise as our hosted registry target.

Install the Helm Registry Plugin.

```
mkdir -p ~/.helm/plugins/
cd ~/.helm/plugins/ && git clone https://github.com/app-registry/appr-helm-plugin.git registry
```

To initiate the new plugin, download required assets.

```
helm registry --help
```

Verify the plugin was successfully installed and can contact quay.io

```
helm registry version $QUAY
```

Initialize Helm on both client and server

```
helm init
```

List all available repos with helm charts from Quay Enterprise. This should be empty in a fresh installation. Also try quay.io, i.e. `helm registry list quay.io`

```
helm registry list $QUAY
```