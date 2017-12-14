---
layout: lab
title: Systemd Targets Overview
permalink: /lab/systemd/targetsoverview/
module: Systemd
---

A systemd target is a set of systemd units that should be started to reach a desired state.

View the dependencies of the multi-user target.

```
sudo systemctl list-dependencies multi-user.target --no-pager
```

Get an overview of all available targets.

```
sudo systemctl list-units --type=target --all --no-pager
```

Get an overview of all targets installed on disk

```
sudo systemctl list-unit-files --type=target --all --no-pager
```

When the system starts and control is passed over to systemd from the initramfs, systemd will try to activate the default.target. default.target is a sym link from `/etc/systemd/system/default.target` to `multi-user.target.`

Check the current default target using `systemctl`.

```
sudo systemctl get-default
```

You can set the the default target by using the `set-default` command.

```
sudo systemctl set-default <target-name>
```
