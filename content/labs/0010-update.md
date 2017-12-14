---
layout: lab
title: Disk Layout / Performing Updates
permalink: /lab/updates/performing-updates/
module: Updates
---

Container Linux is designed to be updated automatically with different schedules
per channel. CoreOS is responsible for managing all updates and schedules.

Updates are always turned on by default. The `update-engine` systemd unit is
responsible for observing the current `COREOS_RELEASE_VERSION` at
`/usr/share/coreos/release` and determining whether an update is required. It
detects new updates 10 minutes after boot and roughly every hour after that.

Here is an example of a package: [https://update.release.core-os.net/amd64-usr/1576.4.0/update.gz](https://update.release.core-os.net/amd64-usr/1576.4.0/update.gz)

###### Channels

There are currently three channels: `alpha`, `beta`, and `stable`.

__Alpha__: The Alpha channel closely tracks current development work and is released frequently. The newest versions of the Linux kernel, systemd, and other components will be available for testing.

__Beta__: The Beta channel consists of promoted Alpha releases.

__Stable__: The Stable channel should be used by production clusters. Versions of CoreOS Container Linux are battle-tested within the Beta and Alpha channels before being promoted.

The channel your operating system is set to on inital deployment/installation depends on the container image downloaded or deployed.

You can think of each release on a lower channel as a release-candidate for the next channel. Once a release is considered bug-free, it is promoted to the next channel.

###### Filesystems

Container Linux is divided into two main filesystems:

`/usr`: read-only - manipulated by the update process.

`/`: read/write - *not* manipulated by the update process.

If one performs a `rm -rf /`, it is equivalent to a factory reset.

Let's begin my observing the system's GPT table.

```
sudo cgpt show /dev/xvda
```

The system's GPT tables are used to encode which partition is currently active and which is passive. This can be seen using `cgpt`. `cgpt` is a utility for ChromeOS-specific GPT partitions.

Observe `USR-A` and `USR-B`. When the system boots, GRUB (the bootloader) looks at the priorities, tries, and successful flags to determine which partition to use.

The partition with the highest priority is booted first. *Successful* indicates

Container Linux ships with `USR-B` completely empty.  The first Container Linux update will populate it and start the normal active/passive scheme.

To lookup the associated partition UUIDs, we can use `blkid`.

```
sudo blkid
```

We can also run the following `cgpt` command to find the `USR-A` and `USR-B` partitions.

```
sudo cgpt find -t coreos-usr
```

Let's now observe the systemd `update-engine.service` unit.

```
sudo systemctl status update-engine --no-pager -l
```

We can manually force an update attempt by running the `upate_engine_client -update` command.

```
sudo update_engine_client -update
```

__Hint__: keep the `update-engine.service` logs open to see output in real-time.

```
sudo journalctl -u update-engine --no-pager -f
```

We are already up to date so we need to trick Container Linux into thinking it needs to be updated.
Although we cannot edit the /usr/share/coreos/release file directly (because it resides on the read-only `/usr`) we can copy the file to our read/write root `/` and bind mount it to the original location.

```
sudo cp /usr/share/coreos/release /tmp
sudo mount -o bind /tmp/release /usr/share/coreos/release
```

The file is now writable, but the bind mount will not survive the reboot, so that the default read-only system release file will be restored after this procedure is complete. Edit /usr/share/coreos/release to replace the value of COREOS_RELEASE_VERSION with `0.0.0`.

```
cat >>
COREOS_RELEASE_VERSION=0.0.0
channel=stable
EOF
```

Restart the update service so that it rescans the edited configuration.

```
sudo systemctl restart update-engine
```

Initiate a manual update.

```
sudo update_engine_client -update
```

Notice how the priority will switch.

```
sudo cgpt show /dev/xvda
```

We can now reboot the node.
