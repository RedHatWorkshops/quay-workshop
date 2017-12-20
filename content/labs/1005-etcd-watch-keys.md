---
layout: lab
title: Watching Keys
permalink: /lab/etcd/watchingkeys/
module: etcd
---

#### Watch Key Changes

Applications can watch on a key or a range of keys to monitor for any updates.

Watch on key foo:

```
etcdctl watch foo
```

__In another terminal window__:

```
etcdctl put foo bar
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
foo
bar
```

We can do the same thing, only this time in hex format.

```
etcdctl watch foo --hex
```

__In another terminal window__:

```
etcdctl put foo bar
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
\x66\x6f\x6f          # Key
\x62\x61\x72          # Value
```

We can watch on a range key, for example from `foo` to `foo9`:

```
etcdctl watch foo foo9
```

__In another terminal window__:

```
etcdctl put foo bar
etcdctl put foo1 bar1
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
foo
bar
...
PUT
foo1
bar1
```

Watch on keys having prefix `foo`:

```
etcdctl watch --prefix foo
```

__In another terminal window__:

```
etcdctl put foo bar
etcdctl put fooz1 barz1
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
foo
bar
...
PUT
fooz1
barz1
```

Finally, we can watch on multiple keys. For example, `foo` and `zoo`:

```
etcdctl watch -i
watch foo
watch zoo
```

__In another terminal window__:

```
etcdctl put foo bar
etcdctl put zoo val
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
foo
bar
...
PUT
zoo
val
```

#### Watch Key Change History

Applications may want to watch for historical changes of keys in etcd.

For example, an application may wish to receive all the modifications of a key;
if the application stays connected to etcd, then watch is good enough. However,
if the application or etcd fails, a change may happen during the failure, and
the application will not receive the update in real time. To guarantee the
update is delivered, the application must be able to watch for historical
changes to keys. To do this, an application can specify a historical revision on
a watch, just like reading past version of keys.

First, add some key/values for later use...

```
etcdctl put foo bar
etcdctl put foo1 bar1
etcdctl put foo bar_new
etcdctl put foo1 bar1_new
```

{:.console-output}
```
OK    # revision = 2
OK    # revision = 3
OK    # revision = 4
OK    # revision = 5
```

Now we can watch the historical changes. For example, watch for changes on key
`foo` since revision 2:

```
etcdctl watch --rev=2 foo
```

{:.console-output}
```
PUT
foo
bar
PUT
foo
bar_new
```

Watch for changes on key `foo` since revision 3:

```
etcdctl watch --rev=3 foo
```

{:.console-output}
```
PUT
foo
bar_new
```

Watch only from the last historical change:

```
etcdctl watch --prev-kv foo
```

__In another terminal window__:

```
etcdctl put foo bar_latest
```

In the first terminal window, you should see the updates.

{:.console-output}
```
PUT
foo         # key
bar_new     # last value of foo key before modification
foo         # key
bar_latest  # value of foo key after modification
```