---
layout: lab
title: Systemd Units Overview
permalink: /lab/systemd/unitsoverview
module: Systemd
---

Query the state of all units to verify system startup.

```
sudo systemctl --type=service
```

Investigate any unites which are in a failed or maintenace state. -l option shows full output.

```
systemctl status rngd.service -l
```

Show whether a particular unit is active or enabled

```
systemctl is-active sshd
systemctl is-enabled sshd
```

List the active state of all loaded units. Optionally, limit the type of unit. The --all option will add inactive units.

```
systemctl list-units --type=service
systemctl list-units --type=service --all
```

View enabled and siabled settings for alll units

```
systemctl list-unit-files --type=service

View only failed services

```
systemctl --failed --type=service
```


Verify the status of the service

```
systemctl status sshd.service


systemctl list-units | grep fleet



The status of a service can be viewed with `systemctl status`.

```
sudo systemctl status sshd.socket
```

View the socket unit file.

```
sudo systemctl cat sshd.socket
cat /usr/lib/systemd/system/sshd.socket
```

Verify the socket is listening on port 22.

```
sudo ss -ntlp
```

View the status of the sshd service.

```
sudo systemctl status sshd.service
```

View the `sshd.service` unit.

```
sudo systemctl cat sshd.service
cat /usr/lib/systemd/system/sshd.service
```

Find your instantiated sshd service.

```
sudo systemctl --full | grep sshd
```

View the status of the systemd-timesyncd unit.

```
sudo systemctl status systemd-timesyncd --no-pager -l
```

Stop the systemd-timesyncd unit.

```
sudo systemctl stop systemd-timesyncd
```

View the status of the systemd-timesyncd unit.

```
sudo systemctl status systemd-timesyncd --no-pager -l
```

Start the systemd-timesyncd unit back up.

```
sudo systemctl start systemd-timesyncd
```

By default, Container Linux machines keep time in the Coordinated Universal Time (UTC) zone and synchronize their clocks with the Network Time Protocol (NTP).

The `timedatectl` command displays and sets the date, time, and time zone.

```
timedatectl status
```

List all available timezones.

```
timedatectl list-timezones
```

Pick a time zone from the list and set it.

```
sudo timedatectl set-timezone America/Los_Angeles
```

Confirm the date is properly set.

```
timedatectl status
date
```