---
layout: lab
title: Install Docker
permalink: /lab/docker/install/
module: Docker
---

Install Docker on your bastion host. Beware of installing via docker.io. This will give you an older version of Docker.

```
# sudo apt-get install -y docker.io
```

Uninstall old versions of Docker

```
sudo apt-get remove docker docker-engine docker.io
```

Update the `apt` package index.

```
sudo apt-get update
```

Install packages to allow `apt` to use a repository over HTTPS.

```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Add Docker's official GPG key.

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Add the Docker repository.

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

Update the `apt` package index again.

```
sudo apt-get update
```

Install the latest version of Docker CE.

```
sudo apt-get install docker-ce
```

Check the status of the docker daemon.

```
sudo systemctl status docker
```

Add your `lab` user to the `docker` group.

```
sudo gpasswd -a $USER docker
```

Activate the new group change.

```
newgrp docker
```