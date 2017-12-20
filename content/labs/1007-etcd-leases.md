---
layout: lab
title: Leases
permalink: /lab/etcd/leases/
module: etcd
---

#### Leases

Applications can grant leases for keys from an etcd cluster. When a key is
attached to a lease, its lifetime is bound to the lease's lifetime which in turn
is governed by a time-to-live (TTL).

Each lease has a minimum time-to-live (TTL) value specified by the application
at grant time. The lease's actual TTL value is at least the minimum TTL and is
chosen by the etcd cluster. Once a lease's TTL elapses, the lease expires and
all attached keys are deleted.

###### Granting Leases

Grant a lease:

```
etcdctl lease grant 10
```

{:.console-output}
```
lease 32695410dcc0ca06 granted with TTL(10s)
```

Attach key `foo` to the lease:

```
etcdctl put --lease=32695410dcc0ca06 foo bar
```

{:.console-output}
```
OK
```

###### Revoking Leases

Applications revoke leases by lease ID. Revoking a lease deletes all of its
attached keys.

Revoke the lease created earlier:

```
etcdctl lease revoke 32695410dcc0ca06
```

{:.console-output}
```
lease 32695410dcc0ca06 revoked
```

Attempting to fetch the key results in an empty response since `foo` is deleted
due to lease revocation.

```
etcdctl get foo
```

###### Lease Keep-Alive

Applications can keep a lease alive by refreshing its TTL so it does not expire.

First, create a new lease:

```
etcdctl lease grant 10
```

{:.console-output}
```
lease 32695410dcc0ca06 granted with TTL(10s)
```

Keep the same lease alive:

```
etcdctl lease keep-alive 32695410dcc0ca06
```

{:.console-output}
```
lease 32695410dcc0ca06 keepalived with TTL(100)
lease 32695410dcc0ca06 keepalived with TTL(100)
lease 32695410dcc0ca06 keepalived with TTL(100)
```

###### Lease Information

Applications may want to know about lease information, so that they can be
renewed or to check if the lease still exists or it has expired. Applications
may also want to know the keys to which a particular lease is attached.


First, create a lease and add some keys:

```
etcdctl lease grant 500
etcdctl put zoo1 val1 --lease=694d5765fc71500b
etcdctl put zoo2 val2 --lease=694d5765fc71500b
```

{:.console-output}
```
lease 694d5765fc71500b granted with TTL(500s)
OK
OK
```

Get information about the lease:

```
etcdctl lease timetolive 694d5765fc71500b
```

{:.console-output}
```
lease 694d5765fc71500b granted with TTL(500s), remaining(258s)
```

Get information about the lease along with the keys attached with the lease:

```
etcdctl lease timetolive --keys 694d5765fc71500b
```

{:.console-output}
```
lease 694d5765fc71500b granted with TTL(500s), remaining(132s), attached keys([zoo2 zoo1])
```

If the lease has expired or does not exist it will give the below response:

{:.console-output}
```
Error:  etcdserver: requested lease not found
```