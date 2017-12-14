---
layout: lab
title: Exploring Container Linux
permalink: /lab/explore/
module: Exploration
---

Confirm you are, in fact, on `HOST_1` that is defined on the bastion.

```
ip a show eth0
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
