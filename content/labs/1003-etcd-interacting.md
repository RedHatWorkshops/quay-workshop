---
layout: lab
title: Interacting with etcd
permalink: /lab/etcd/interacting/
module: etcd
published: false
---

Users mostly interact with etcd by putting or getting the value of a key.

By default, etcdctl talks to the etcd server with the v2 API for backward
compatibility. For etcdctl to speak to etcd using the v3 API, the API version
must be set to version 3 via the `ETCDCTL_API` environment variable.

```
export ETCDCTL_API=3
```

## Find versions

Get the version of etcd.

```
etcdctl version
```

The version should be displayed.

{.console-output}
```
etcdctl version: 3.1.0-alpha.0+git
API version: 3.1
```

## Write a key

Here is the command to set the value of key `foo` to `bar`:

```
etcdctl put foo bar
```

## Read keys

Here is the command to read the value of key `foo`:

```
etcdctl get foo
```

## Read past version of keys

## Read keys which are greater than or equal to the byte value of the specified key

## Delete keys

## Watch key changes

## Watch historical changes of keys

## Compacted revisions

## Grant leases

## Revoke leases

## Keep leases alive

## Get lease information
