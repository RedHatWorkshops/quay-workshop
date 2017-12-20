---
layout: lab
title: Key Versions
permalink: /lab/etcd/keyversions/
module: etcd
---

#### Key Versions

Applications may want to read superseded versions of a key. For example, an
application may wish to roll back to an old configuration by accessing an
earlier version of a key.

Alternatively, an application may want a consistent view over multiple keys
through multiple requests by accessing key history.

Since every modification to the etcd cluster key-value store increments the
global revision of an etcd cluster, an application can read superseded keys by
providing an older etcd revision.

First, create  several keys:

```
etcdctl put foo bar
etcdctl put foo1 bar1
```

Next, update the keys to create a new revision:

```
etcdctl put foo bar_new
etcdctl put foo1 bar1_new
```

As we have already seen, we can access the most recent version for a key using
the `get` subcommand.

```
etcdctl get --prefix foo
```

{:.console-output}
```
foo
bar_new
foo1
bar1_new
```

Access the versions of keys at revision `4`:

```
etcdctl get --prefix --rev=4 foo
```

{:.console-output}
```
foo
bar_new
foo1
bar1
```

Access the versions of keys at revision `3`, etc...

```
etcdctl get --prefix --rev=3 foo
etcdctl get --prefix --rev=2 foo
etcdctl get --prefix --rev=1 foo
```

{:.console-output}
```
foo
bar
foo1
bar1
...
foo
bar
...
```