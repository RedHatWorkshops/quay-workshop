---
layout: lab
title: Deleting Keys
permalink: /lab/etcd/deletingkeys/
module: etcd
---

#### Delete Keys

Applications can delete a key or a range of keys from an etcd cluster.

We can delete a single key quite easily.

```
etcdctl del foo
```

We will see the number of keys that were deleted.

{:.console-output}
```
1 # one key is deleted
```

We can also delete using a range.

```
etcdctl del foo foo9
```

We will see the number of keys that were deleted.

{:.console-output}
```
2 # two keys are deleted
```

We can delete a key, with the deleted key value pair returned:

```
etcdctl del --prev-kv zoo
```

{:.console-output}
```
1   # one key is deleted
zoo # deleted key
val # the value of the deleted key
```

Delete keys having prefix `zoo`:

```
etcdctl del --prefix zoo
```

{:.console-output}
```
2 # two keys are deleted
```

Finally, we can delete keys which are greater than or equal to the byte value
of key `b`:

```
etcdctl del --from-key b
```

{:.console-output}
```
2 # two keys are deleted
```