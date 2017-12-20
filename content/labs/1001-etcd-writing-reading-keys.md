---
layout: lab
title: Writing and Reading Keys
permalink: /lab/etcd/writingreading/
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