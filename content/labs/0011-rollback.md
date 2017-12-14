---
layout: lab
title: Peforming a Manual Rollback
permalink: /lab/updates/performingrollback/
module: Updates
---

So, now that we understand what happens when the machine updates, we can tweak the process so that it boots an older image (assuming it's still intact on the passive partition). The first command we'll use is `cgpt find -t coreos-usr`. This will give us a list of all of the USR partitions available on the disk.

```
cgpt find -t coreos-usr
```

To figure out which partition is currently active, we can use `rootdev`.

```
rootdev -s /usr
```

So now we know that /dev/xxx# is the active partition on our system. We can compose the previous two commands to dynamically figure out the passive partition.

$ cgpt find -t coreos-usr | grep --invert-match "$(rootdev -s /usr)"

In order to rollback, we need to mark that partition as active using `cgpt prioritize`.

```
cgpt prioritize /dev/xxx#
```

If we take another look at the GPT tables, we'll see that the priorities have been updated.

```
sudo cgpt show /dev/xvda
```

We can now reboot the machine to restore to the previous version.