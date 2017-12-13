---
layout: lab
title: Drop-Ins
permalink: /lab/systemd/dropins/
module: Systemd
---

Using systemd drop-in units

There are two methods of overriding default Container Linux settings in unit files: copying the unit file from /usr/lib64/systemd/system to /etc/systemd/system and modifying the chosen settings. Alternatively, one can create a directory named unit.d within /etc/systemd/system and place a drop-in file name.conf there that only changes the specific settings one is interested in. Note that multiple such drop-in files are read if present.

The advantage of the first method is that one easily overrides the complete unit, the default Container Linux unit is not parsed at all anymore. It has the disadvantage that improvements to the unit file supplied by Container Linux are not automatically incorporated on updates.

The advantage of the second method is that one only overrides the settings one specifically wants, where updates to the original Container Linux unit automatically apply. This has the disadvantage that some future Container Linux updates might be incompatible with the local changes, but the risk is much lower.

Note that for drop-in files, if one wants to remove entries from a setting that is parsed as a list (and is not a dependency), such as ConditionPathExists= (or e.g. ExecStart= in service units), one needs to first clear the list before re-adding all entries except the one that is to be removed. See below for an example.

This also applies for user instances of systemd, but with different locations for the unit files. See the section on unit load paths in official systemd doc for further details.

Example: customizing fleet.service

Let's review /usr/lib64/systemd/system/fleet.service unit (you can find it using this command: systemctl list-units | grep fleet) with the following contents:

[Unit]
Description=fleet daemon

After=etcd.service
After=etcd2.service

Wants=fleet.socket
After=fleet.socket

[Service]
ExecStart=/usr/bin/fleetd
Restart=always
RestartSec=10s
Let's walk through increasing the RestartSec parameter via both methods:

Override only specific option
You can create a drop-in file /etc/systemd/system/fleet.service.d/10-restart_60s.conf with the following contents:

[Service]
RestartSec=60s
Then reload systemd, scanning for new or changed units:

systemctl daemon-reload

And restart modified service if necessary (in our example we have changed only RestartSec option, but if you want to change environment variables, ExecStart or other run options you have to restart service):

systemctl restart fleet.service
Here is how that could be implemented within a Container Linux Config:

systemd:
  units:
    - name: fleet.service
      enable: true
      dropins:
        - name: 10-restart_60s.conf
          contents: |
            [Service]
            RestartSec=60s
This change is small and targeted. It is the easiest way to tweak unit's parameters.

Override the whole unit file
Another way is to override whole systemd unit. Copy default unit file /usr/lib64/systemd/system/fleet.service to /etc/systemd/system/fleet.service and change the chosen settings:

[Unit]
Description=fleet daemon

After=etcd.service
After=etcd2.service

Wants=fleet.socket
After=fleet.socket

[Service]
ExecStart=/usr/bin/fleetd
Restart=always
RestartSec=60s
Container Linux Config example:

Container Linux Config
Ignition Config
This is the raw machine configuration, which is not intended for editing. Learn more. Validate the config here.
{
  "ignition": {
    "version": "2.0.0",
    "config": {}
  },
  "storage": {},
  "systemd": {
    "units": [
      {
        "name": "fleet.service",
        "enable": true,
        "contents": "[Unit]\nDescription=fleet daemon\n\nAfter=etcd.service\nAfter=etcd2.service\n\nWants=fleet.socket\nAfter=fleet.socket\n\n[Service]\nExecStart=/usr/bin/fleetd\nRestart=always\nRestartSec=60s"
      }
    ]
  },
  "networkd": {},
  "passwd": {}
}
List drop-ins
To see all runtime drop-in changes for system units run the command below:

systemd-delta --type=extended
Other systemd examples

For another real systemd examples, check out these documents:

Customizing Docker Customizing the SSH Daemon Using Environment Variables In systemd Units