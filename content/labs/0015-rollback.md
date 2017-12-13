---
layout: lab
title: Peforming a Manual Rollback
permalink: /lab/updates/updates/
module: Updates
---

https://update.release.core-os.net/amd64-usr/1576.4.0/update.gz



$ cp /usr/share/coreos/release /tmp
$ sudo mount -o bind /tmp/release /usr/share/coreos/release
The file is now writable, but the bind mount will not survive the reboot, so that the default read-only system release file will be restored after this procedure is complete. Edit /usr/share/coreos/release to replace the value of COREOS_RELEASE_VERSION with 0.0.0:

COREOS_RELEASE_VERSION=0.0.0
Restart the update service so that it rescans the edited configuration, then initiate an update. The system will reboot into the selected lower channel after downloading the release:

$ sudo systemctl restart update-engine
$ update_engine_client -update




https://github.com/coreos/seismograph

/usr/share/coreos
cgpt

A partitioning tool.

rootdev

Performs operations to discover and annotate the root block device



cgpt find -t coreos-usr
/dev/sda3
/dev/sda4



 rootdev -s /usr
/dev/sda4


cgpt find -t coreos-usr | grep --invert-match "$(rootdev -s /usr)"
/dev/sda3


flips priority


cgpt prioritize /dev/sda3  
Each machine should check in about 10 minutes after boot and roughly every hour after that. If you'd like to see it sooner, you can force an update check, which will skip any rate-limiting settings that are configured in CoreUpdate.



update_engine_client -check_for_update



The system's GPT tables are used to encode which partition is currently active and which is passive. This can be seen using `cgpt`. `cgpt` is a utility for ChromeOS-specific GPT partitions.

```
sudo cgpt show /dev/xvda
```

Observe `USR-A` and `USR-B`. When the system boots, GRUB (the bootloader) looks at the priorities, tries, and successful flags to determine which partition to use.


Performing a manual rollback

So, now that we understand what happens when the machine updates, we can tweak the process so that it boots an older image (assuming it's still intact on the passive partition). The first command we'll use is cgpt find -t coreos-usr. This will give us a list of all of the USR partitions available on the disk.

$ cgpt find -t coreos-usr
/dev/sda3
/dev/sda4
To figure out which partition is currently active, we can use rootdev.

$ rootdev -s /usr
/dev/sda4
So now we know that /dev/sda3 is the passive partition on our system. We can compose the previous two commands to dynamically figure out the passive partition.

$ cgpt find -t coreos-usr | grep --invert-match "$(rootdev -s /usr)"
/dev/sda3
In order to rollback, we need to mark that partition as active using cgpt prioritize.

$ cgpt prioritize /dev/sda3
If we take another look at the GPT tables, we'll see that the priorities have been updated.

      270336     2097152       3  Label: "USR-A"
                                  Type: Alias for coreos-rootfs
                                  UUID: 7130C94A-213A-4E5A-8E26-6CCE9662F132
                                  Attr: priority=2 tries=0 successful=1
     2367488     2097152       4  Label: "USR-B"
                                  Type: Alias for coreos-rootfs
                                  UUID: E03DD35C-7C2D-4A47-B3FE-27F15780A57C
                                  Attr: priority=1 tries=0 successful=1

Composing the previous two commands produces the following command to set the currently passive partition to be active on the next boot:

$ cgpt prioritize "$(cgpt find -t coreos-usr | grep --invert-match "$(rootdev -s /usr)")"
Forcing a Channel Downgrade

The procedure above restores the last known good Container Linux version from immediately before an upgrade reboot. The system remains on the same Container Linux channel after rebooting with the previous USR partition. It is also possible, though not recommended, to switch a Container Linux installation to an older release channel, for example to make a system running an Alpha release downgrade to the Stable channel. Root privileges are required for this procedure, noted by sudo in the commands below.

First, edit /etc/coreos/update.conf to set GROUP to the name of the target channel, one of stable or beta:

GROUP=stable
Next, clear the current version number from the release file so that the target channel will be certain to have a higher version number, triggering the "upgrade," in this case a downgrade to the lower channel. Since release is on a read-only file system, it is convenient to temporarily override it with a bind mount. To do this, copy the original to a writable location, then bind the copy over the system release file:

$ cp /usr/share/coreos/release /tmp
$ sudo mount -o bind /tmp/release /usr/share/coreos/release
The file is now writable, but the bind mount will not survive the reboot, so that the default read-only system release file will be restored after this procedure is complete. Edit /usr/share/coreos/release to replace the value of COREOS_RELEASE_VERSION with 0.0.0:

COREOS_RELEASE_VERSION=0.0.0
Restart the update service so that it rescans the edited configuration, then initiate an update. The system will reboot into the selected lower channel after downloading the release:

$ sudo systemctl restart update-engine
$ update_engine_client -update