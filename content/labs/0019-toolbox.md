---
layout: lab
title: Using Toolbox
permalink: /lab/troubleshooting/toolbox/
module: Troubleshooting
---

You can use common debugging tools like `tcpdump` or `strace` with Toolbox.

Using the filesystem of a specified Docker container, Toolbox will launch a
container with full system privileges, including access to system PIDs, network
interfaces and other global information. Inside of the toolbox, the machine's
filesystem is mounted to /media/root.

By default, Toolbox uses the stock Fedora Docker container. To start using it,
simply run:

```
/usr/bin/toolbox
```

You're now in the namespace of Fedora and can install any software you'd like
via dnf.

For example, if you'd like to use tcpdump:

```
[root@srv-3qy0p ~]# dnf -y install tcpdump
[root@srv-3qy0p ~]# tcpdump -i ens3
```

{: .console-output}
```
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ens3, link-type EN10MB (Ethernet), capture size 65535 bytes
```

###### Custom Docker Images

Create a `.toolboxrc` in the user's home folder to use a specific Docker image:

```
cat ~/.toolboxrc
```

{: .console-output}
```
TOOLBOX_DOCKER_IMAGE=index.example.com/debug
TOOLBOX_USER=root
```

```
/usr/bin/toolbox
```

{: .console-output}
```
Pulling repository index.example.com/debug
...
```

machinectl list

machinectl status .host
