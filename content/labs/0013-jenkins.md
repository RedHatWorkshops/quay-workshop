---
layout: lab
title: Integrating Quay, Jenkins, and Kubernetes
permalink: /lab/dockerfiles/jenkins/
module: Dockerfiles
---

First, create a namespace to deploy our canary and production deployments.

```
kubectl create namespace monitoring-demo
```


Install Helm, the Kubernetes Package Manager.

```
curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.0-rc.1-linux-amd64.tar.gz
tar xzvf helm-v2.8.0-rc.1-linux-amd64.tar.gz
chmod +x ./linux-amd64/helm
sudo mv ./linux-amd64/helm /usr/local/bin/helm
```

Verify it was successfully installed.

````
helm help
```

Initialize Helm on both client and server

```
helm init
```

Before installing Jenkins, create a values YAML file.

```
cat >> jenkins-values.yaml <<EOF
Master:
  Name: jenkins-master-example
  AdminUser: admin
  AdminPassword: coreostrainme
  ImageTag: "2.93"
  Memory: "512Mi"
  ServicePort: 8080
  ServiceType: LoadBalancer
  # Master Service annotations
  InstallPlugins:
      - kubernetes
      - workflow-aggregator
      - credentials-binding
      - git
      - pipeline-github-lib
      - ghprb
      - blueocean
Agent:
  Enabled: true
  Image: jenkins/jnlp-slave
  Memory: "512Mi"
Persistence:
  Enabled: false
rbac:
  install: true
EOF

Install Jenkins via Helm chart hosted on quay.io

```
helm --namespace jenkins --name jenkins -f jenkins-values.yaml install stable/jenkins
```

Once Jenkins has been installed, fetch the load balancer URL from the helm output.

```
export SERVICE_IP=$(kubectl get svc --namespace jenkins jenkins-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
echo http://$SERVICE_IP:8080/login
```

Navigate to the Jenkins UI and enter the username and password.

We can automate the creation of quay.io robot credentials by going to Jenkins-->Credentials-->System-->Global credentials (unrestricted).

For the purpose of this lab, we will add credentials manually by exploring the Kubernetes plugin for Jenkins.

On the main Jenkins dashboard, go to Manage Jenkins-->Configure System and scroll down to the Cloud section.

In the credentials section, select Add. Change the Kind to Kubernetes Service Account. Enter `jenkins-jenkins` for the ID. This was the service account created within the jenkins namespace during the Jenkins Helm chart installation.

After adding the credentials, select Test Connection to verify the Jenkins pod (within the Jenkins namespace) can successfully authenticate against the Kubernetes API.

Our Jenkins master can create a multiple jenkins agent slaves based off a variety of docker images. For the sake of simplicity, we will modify our default pod template slave to also have `kubectl` installed.

Modify the Docker image to be `radumatei/jenkins-slave-docker:kubectl`.

We will add two environment variables to be set inside our pod: `quay_username` and `quay_password`. These should be the username and password for our quay.io robot account with access to our repository (hello-world-instrumented).

Mount the host's Docker socket via a host-path volume for `/var/run/docker.sock`.

Max number of instances should be set to 3 and Service Account should be set to `jenkins-jenkins`. This is the account responsible for deploying the newly built images.

The Jenkins Blue plugin makes it easy to create a Jenkins pipeline. Go to Jenkins Blue from the main Jenkins dashboard and select Create Pipeline.