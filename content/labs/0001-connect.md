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
ssh -i labXX-key lab@cl-labXX-bastion.coreostrain.me
```

The bastion node is a standard Ubuntu Linux machine and the `lab` user has full
sudoers access to install any needed utilities.

{: .console-output}
```
$ whoami
lab

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

$ sudo ls -la /root
total 20
drwx------  3 root root 4096 Oct 15 00:06 .
drwxr-xr-x 23 root root 4096 Oct 15 00:06 ..
-rw-r--r--  1 root root 3106 Oct 22  2015 .bashrc
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwx------  2 root root 4096 Oct 15 00:06 .ssh
```
Verify connectivity to the Kubernetes lab environment

```
kubectl get nodes
```
