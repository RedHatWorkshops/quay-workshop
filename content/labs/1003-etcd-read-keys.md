---
layout: lab
title: Reading Keys Based On Other Keys
permalink: /lab/etcd/readkeys/
module: etcd
---

#### Read Keys Based On Another Key

Applications may want to read keys which are greater than or equal to the byte
value of a specified key.

Create several keys to demonstrate.

```
etcdctl put a 123
etcdctl put b 456
etcdctl put z 789
```

Read keys which are greater than or equal to the byte value of key `b`:

```
etcdctl get --from-key b
```

{:.console-output}
```
b
456
z
789
```