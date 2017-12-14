---
layout: lab
title: Creating Systemd Units
permalink: /lab/systemd/creatingunits/
module: Systemd
---

Let's begin by creating a new systemd unit definition file

```
cat > /etc/systemd/system/hello.service <<EOF
[Unit]
Description=MyApp
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker kill %p
ExecStartPre=-/usr/bin/docker rm %p
ExecStartPre=/usr/bin/docker pull busybox
ExecStart=/usr/bin/docker run --name %p busybox /bin/sh -c "while true; do echo Hello World; sleep 1; done"
EOF
```

After creating the unit, enable the unit so that it starts at bootup.

```
sudo systemctl enable /etc/systemd/system/hello.service
```

Start the unit.

```
sudo systemctl start hello.service
```

We should now be able to confirm the unit is running.

```
sudo systemctl status hello.service
```

Investigate the Main PID shown in the unit.

```
ps -p xxx
```

We can view standard out of the container by using journalctl.

```
journcalctl -u hello.service
```

Remove the pager and follow the logs.

```
journcalctl -u hello.service -f --no-pager
```

Change the message to the output.

```
sed /etc/systemd/system/hello.service       World ---> Everyone
```

To pickup the changes, we will need to reload

```
sudo systemctl daemon-reload
```

Restart the service

```
sudo systemctl restart hello.service
```

Verify the new message is being output.

```
journalctl -f -u hello.server
```

List all the units.

```
sudo systemctl list-units
```

```
sudo systemctl list-units hello.service
```
