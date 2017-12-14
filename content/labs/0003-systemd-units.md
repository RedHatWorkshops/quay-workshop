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

List the active state of all loaded units. Optionally, limit the type of unit. The --all option will add inactive units.

```
sudo systemctl list-units --type=service
sudo systemctl list-units --type=service --all
```

View enabled and disabled settings for all units.

```
sudo systemctl list-unit-files --type=service
```

View only failed services

```
sudo systemctl --failed --type=service
```

Investigate the status of the Random Number Generator Daemon. The `-l` option shows full output.

```
sudo systemctl status rngd.service -l
```

Show whether the `sshd` unit is active or enabled.

```
sudo systemctl is-active sshd
sudo systemctl is-enabled sshd
```

View the status of the sshd socket unit.

```
sudo systemctl status sshd.socket
```

View the contents of the sshd socket unit file.

```
sudo systemctl cat sshd.socket
sudo cat /usr/lib/systemd/system/sshd.socket
```

Verify the sshd socket is listening on port 22.

```
sudo ss -ntlp
```

View the status of the sshd service unit.

```
sudo systemctl status sshd.service
```

View the contents of the sshd service unit.

```
sudo systemctl cat sshd.service
cat /usr/lib/systemd/system/sshd.service
```

Find your instantiated sshd service.

```
sudo systemctl --full | grep sshd
```

By default, Container Linux machines keep time in the Coordinated Universal Time (UTC) zone and synchronize their clocks with the Network Time Protocol (NTP).

View the status of the systemd-timesyncd unit. Use the `no-pager` option to turn off pagination. The `-l` will show full log output.

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

Start the systemd-timesyncd unit.

```
sudo systemctl start systemd-timesyncd
```

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