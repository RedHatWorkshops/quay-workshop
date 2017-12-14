---
layout: lab
title: Drop-Ins
permalink: /lab/systemd/dropins/
module: Systemd
---

A "drop-in" directory is a way to append or overwrite existing unit files. This is extremely useful because it allows system administrators to modify systemd unit behavior without destroying the default units located in `/usr/lib/systemd/network`. 

To create a drop-in, one creates a drop-in directory with the naming convention `foo.network.d` with a file or files containing the `.conf` suffix. For example, `/etc/systemd/system/foo.network.d/logging.conf`.

Let's create a drop-in for the the `systemd-networkd.service` residing at `/usr/lib/systemd/system/systemd-networkd.service`

```
sudo mkdir /etc/systemd/system/systemd-networkd.service.d/
sudo bash -c cat > /etc/systemd/system/systemd-networkd.service.d/10-debug.conf <<EOF
[Service]
Environment=SYSTEMD_LOG_LEVEL=debug
EOF
```
Run `systemctl daemon-reload` to pick up the new drop-in unit.

```
sudo systemctl daemon-reload
```

Restart networkd.

```
sudo systemctl restart systemd-networkd
```

Observe debugging.

```
journalctl -u systemd-networkd --no-pager
```
