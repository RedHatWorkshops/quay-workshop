---
layout: lab
title: Bootstrapping etcd
permalink: /lab/etcd/bootstrapping/
module: etcd
---

From `host1` fetch the latest etcd tarball and untar contents.

```
wget https://github.com/coreos/etcd/releases/download/v3.1.4/etcd-v3.1.4-linux-amd64.tar.gz
tar -xvf etcd-v3.1.4-linux-amd64.tar.gz
```

Create the `/opt/bin` directory and move the etcd binaries to it.

```
sudo mkdir -p /opt/bin/
sudo mv etcd-v3.1.4-linux-amd64/etcd* /opt/bin/
```

Set the following variables prior to bootstrapping `host1`.

```
TOKEN=token-01
CLUSTER_STATE=new
NAME_1=machine-1
NAME_2=machine-2
NAME_3=machine-3
HOST_1=<host1_ip>
HOST_2=<host2_ip>
HOST_3=<host3_ip>
CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380
```

Run the following on `host1`.

```
THIS_NAME=${NAME_1}
THIS_IP=${HOST_1}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN} &
```

Open up a new terminal window and ssh into `host2`.

From `host2` fetch the latest etcd tarball and untar contents.

```
wget https://github.com/coreos/etcd/releases/download/v3.1.4/etcd-v3.1.4-linux-amd64.tar.gz
tar -xvf etcd-v3.1.4-linux-amd64.tar.gz
```

Create the `/opt/bin` directory and move the etcd binaries to it.

```
sudo mkdir -p /opt/bin/
sudo mv etcd-v3.1.4-linux-amd64/etcd* /opt/bin/
```

Set the following variables prior to bootstrapping `host2`.

```
TOKEN=token-01
CLUSTER_STATE=new
NAME_1=machine-1
NAME_2=machine-2
NAME_3=machine-3
HOST_1=<host1_ip>
HOST_2=<host2_ip>
HOST_3=<host3_ip>
CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380
```

Run the following on `host2`.

```
THIS_NAME=${NAME_2}
THIS_IP=${HOST_2}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN} &
```

Open up a new terminal window and ssh into `host3`.

From `host3` fetch the latest etcd tarball and untar contents.

```
wget https://github.com/coreos/etcd/releases/download/v3.1.4/etcd-v3.1.4-linux-amd64.tar.gz
tar -xvf etcd-v3.1.4-linux-amd64.tar.gz
```

Create the `/opt/bin` directory and move the etcd binaries to it.

```
sudo mkdir -p /opt/bin/
sudo mv etcd-v3.1.4-linux-amd64/etcd* /opt/bin/
```

Set the following variables prior to bootstrapping `host3`.

```
TOKEN=token-01
CLUSTER_STATE=new
NAME_1=machine-1
NAME_2=machine-2
NAME_3=machine-3
HOST_1=<host1_ip>
HOST_2=<host2_ip>
HOST_3=<host3_ip>
CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380
```

Run the following on `host3`.

```
THIS_NAME=${NAME_3}
THIS_IP=${HOST_3}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}
```

When first started, etcd stores its configuration into a data directory specified by the data-dir configuration parameter. Configuration is stored in the WAL and includes:

* the local member ID
* cluster ID
* initial cluster configuration

The write ahead log and snapshot files are used during member operation and to recover after a restart.

From `host1`, run the following to list all members.

```
export ETCDCTL_API=3
HOST_1=<host1_ip>
HOST_2=<host2_ip>
HOST_3=<host3_ip>
ENDPOINTS=$HOST_1:2379,$HOST_2:2379,$HOST_3:2379

etcdctl --endpoints=$ENDPOINTS member list
```

Test writing a key to the cluster.

```
etcdctl --endpoints=$ENDPOINTS put foo "Hello World!"
```

Read the value from the cluster.

```
etcdctl --endpoints=$ENDPOINTS --write-out="json" get foo
```