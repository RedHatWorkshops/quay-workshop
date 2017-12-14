---
layout: lab
title: Building etcd
permalink: /lab/etcd/building/
module: etcd
published: false
---

#### Build the latest version

Build `etcd` from the `master` branch without a `GOPATH` using the official
build script:

```
git clone https://github.com/coreos/etcd.git
cd etcd
./build
```

### Test the installation

Start etcd:

```
./bin/etcd
```

Set a key:

```
ETCDCTL_API=3 ./bin/etcdctl put foo bar
```
