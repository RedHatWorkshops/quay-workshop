---
layout: lab
title: Using Docker
permalink: /lab/docker/usingdocker/
module: Docker
---


systemctl status docker

systemctl start docker


docker pull centos7

docker images

docker run -it --rm centos7 cat /etc/hosts

docker run -it centos7 bash

echo hello > /tmp/testfile
exit

docker ps -a


docker start -ai <container-name>

cat /tmp/testfile
exit


docker run -i centos7 bash -c "yum install -y httpd; yum clean alll"

docker ps -l

docker commit -m "Centos7 + httpd" <container-name> centos7_httpd

docker images

docker run -p 8080:80 -d centos7_httpd /usr/sbin/httpd -DFOREGROUND

curl http://localhost:8080


docker tag centos7_httpd quay.io/coreostrainme/centos7_httpd:latest

docker images

docker push quay.io/coreostrainme/centos7_httpd:latest

docker save --output=rhel_httpd-latest.tar centos7_httpd