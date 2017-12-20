---
layout: lab
title: Compacted Revisions
permalink: /lab/etcd/compactedrevisions/
module: etcd
---

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