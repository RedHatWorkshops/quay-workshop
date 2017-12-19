---
layout: lab
title: Interacting with etcd
permalink: /lab/etcd/interacting/
module: etcd
---

#### Overview

Users mostly interact with etcd by putting or getting the value of a key using
the `etcdctl` command-line utility.

#### Version

By default, `etcdctl` talks to the etcd server with the __v2__ API for backward
compatibility. For `etcdctl` to speak to etcd using the __v3__ API, the API
version can be set to version 3 via the `ETCDCTL_API` environment variable.

```
export ETCDCTL_API=3
```

First, use the `version` subcommand to get both the version of the etcd API, as
well as the `etcdctl` utility itself.

```
etcdctl version
```

The correct versions should be displayed to indicate the `v3` API.

{:.console-output}
```
etcdctl version: 3.1.0-alpha.0+git
API version: 3.1
```

#### Writing Keys

Set the value for the key `foo` to `bar`:

```
etcdctl put foo bar
```

{:.console-output}
```
OK
```

Set a few more key/values that we will use later...

```
etcdctl put foo1 bar1
etcdctl put foo2 bar2
etcdctl put foo3 bar3
etcdctl put zoo val
etcdctl put zoo1 val1
etcdctl put zoo2 val2
```

{:.console-output}
```
OK
OK
OK
OK
OK
OK
```
#### Reading Keys

Once the key exists, we can read the value:

```
etcdctl get foo
```

{:.console-output}
```
foo
bar
```

The value can also be returned in hex format:

```
etcdctl get foo --hex
```

{:.console-output}
```
\x66\x6f\x6f          # Key
\x62\x61\x72          # Value
```

We can use the `--print-value-only` flag to omit the key in the returned output.

```
etcdctl get foo --print-value-only
```

{:.console-output}
```
bar
```

We can also range over the keys. For example, from `foo` to `foo3`:

```
etcdctl get foo foo3
```

Notice that `foo3` is excluded since the range is over the half-open interval
[foo, foo3), thus excluding `foo3`.

{:.console-output}
```
foo
bar
foo1
bar1
foo2
bar2
```

Range over all keys prefixed with `foo`:

```
etcdctl get --prefix foo
```

{:.console-output}
```
foo
bar
foo1
bar1
foo2
bar2
foo3
bar3
```

Finally, we can limit the number of results. For example, 2 in this case:

```
etcdctl get --prefix --limit=2 foo
```

{:.console-output}
```
foo
bar
foo1
bar1
```

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

#### Compacted Revisions

etcd keeps revisions so that applications can read past versions of keys.
However, to avoid accumulating an unbounded amount of history, it is important
to compact past revisions.

After compacting, etcd removes historical revisions, releasing resources for
future use. All superseded data with revisions before the compacted revision
will be unavailable.

Compact the revisions:

```
etcdctl compact 5
```

{:.console-output}
```
compacted revision 5
```

Any revisions before the compacted one are not accessible:

```
etcdctl get --rev=4 foo
```

{:.console-output}
```
Error:  rpc error: code = 11 desc = etcdserver: mvcc: required revision has been compacted
```

__Note__: The current revision of etcd server can be found using `get`
subcommand on any key (existent or non-existent) in json format.

For example, `mykey` which does not exist in etcd server:

```
etcdctl get mykey -w=json
```

{:.console-output}
```
{"header":{"cluster_id":14841639068965178418,"member_id":10276657743932975437,"revision":15,"raft_term":4}}
```

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
