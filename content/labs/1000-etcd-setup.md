---
layout: lab
title: Setting up etcd
permalink: /lab/etcd/settingupetcd/
module: etcd
published: false
---


wget https://github.com/coreos/etcd/releases/download/v3.1.4/etcd-v3.1.4-linux-amd64.tar.gz
tar -xvf etcd-v3.1.4-linux-amd64.tar.gz
sudo mkdir -p /opt/bin/
sudo mv etcd-v3.1.4-linux-amd64/etcd* /opt/bin/
rm -rf etc*

sudo mkdir -p /var/lib/etcd



When first started, etcd stores its configuration into a data directory specified by the data-dir configuration parameter. Configuration is stored in the WAL and includes:

-the local member ID
-cluster ID
-initial cluster configuration

he write ahead log and snapshot files are used during member operation and to recover after a restart.

Having a dedicated disk to store wal files can improve the throughput and stabilize the cluster. It is highly recommended to dedicate a wal disk and set --wal-dir to point to a directory on that device for a production cluster deployment.


A user should avoid restarting an etcd member with a data directory from an out-of-date backup. Using an out-of-date data directory can lead to inconsistency as the member had agreed to store information via raft then re-joins saying it needs that information again. For maximum safety, if an etcd member suffers any sort of data corruption or loss, it must be removed from the cluster. Once removed the member can be re-added with an empty data directory.



cluster 4f258d9b7c1cf424
------------------------------------
131bd3a37451d475 - machine-1   - became follower first -- becomes leader when machine 2 is added.
67a931f123e0e0ed - machine-2 -
54990a9b703f66f5 - machine-3








TOKEN=token-01
CLUSTER_STATE=new
NAME_1=machine-1
NAME_2=machine-2
NAME_3=machine-3
HOST_1=172.31.15.201
HOST_2=172.31.39.223
HOST_3=172.31.40.165
CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380




Run this on each machine:

# For machine 1
THIS_NAME=${NAME_1}
THIS_IP=${HOST_1}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}

# For machine 2
THIS_NAME=${NAME_2}
THIS_IP=${HOST_2}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}

# For machine 3
THIS_NAME=${NAME_3}
THIS_IP=${HOST_3}
etcd --data-dir=data.etcd --name ${THIS_NAME} \
	--initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://${THIS_IP}:2380 \
	--advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://${THIS_IP}:2379 \
	--initial-cluster ${CLUSTER} \
	--initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}




-ALSO SHOW DISCOVERY URL.



2017-12-12 14:30:21.645200 I | etcdmain: etcd Version: 3.1.4
2017-12-12 14:30:21.645339 I | etcdmain: Git SHA: 41e52eb
2017-12-12 14:30:21.645407 I | etcdmain: Go Version: go1.7.5
2017-12-12 14:30:21.645474 I | etcdmain: Go OS/Arch: linux/amd64
2017-12-12 14:30:21.645523 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2017-12-12 14:30:21.645696 I | embed: listening for peers on http://172.31.15.201:2380
2017-12-12 14:30:21.645775 I | embed: listening for client requests on 172.31.15.201:2379




etcd peers (server) :2380


etcd clients (server) :2379



2017-12-12 14:30:23.648960 I | etcdserver: name = machine-1
2017-12-12 14:30:23.649136 I | etcdserver: data dir = data.etcd
2017-12-12 14:30:23.649194 I | etcdserver: member dir = data.etcd/member
2017-12-12 14:30:23.649269 I | etcdserver: heartbeat = 100ms
2017-12-12 14:30:23.649323 I | etcdserver: election = 1000ms
2017-12-12 14:30:23.649376 I | etcdserver: snapshot count = 10000
2017-12-12 14:30:23.649430 I | etcdserver: advertise client URLs = http://172.31.15.201:2379
2017-12-12 14:30:23.649527 I | etcdserver: initial advertise peer URLs = http://172.31.15.201:2380
2017-12-12 14:30:23.649627 I | etcdserver: initial cluster = machine-1=http://172.31.15.201:2380,machine-2=http://172.31.39.223:2380,machine-3=http://172.31.40.165:2380




2017-12-12 14:30:23.653390 I | etcdserver: starting member 131bd3a37451d475 in cluster 4f258d9b7c1cf424



export ETCDCTL_API=3
HOST_1=172.31.15.201
HOST_2=172.31.39.223
HOST_3=172.31.40.165
ENDPOINTS=$HOST_1:2379,$HOST_2:2379,$HOST_3:2379

etcdctl --endpoints=$ENDPOINTS member list

put command to write:

etcdctl --endpoints=$ENDPOINTS put foo "Hello World!"
get to read from etcd:

etcdctl --endpoints=$ENDPOINTS get foo
etcdctl --endpoints=$ENDPOINTS --write-out="json" get foo





cluster 4f258d9b7c1cf424
------------------------------------
131bd3a37451d475 - machine-1   - became follower first -- becomes leader when machine 2 is added.
67a931f123e0e0ed - machine-2 -
54990a9b703f66f5 - machine-3




when leader fails (machine-1)

-machine-2 receives a MsgTimeoutNow from 131bd3a37451d475 and starts an election to get leadership.
-becomes candidate.
-receies msgvoteresp from itself
-sends msfvote request to 131
-sends msgvote request to 549
          -549 receives msgvote.
           -becomes follower
           -cast msgvote for 67.
           -elects leader
-realizes lost leader 131
-recees msgvoteresponse from 549
-received 2 msgvoteresponses (quorom=2)
-becomes leader.


 etcdctl --endpoints=$ENDPOINTS --write-out="protobuf" get matt > me.bin



 protoc --decode_raw < me.bin

  etcdctl --endpoints=$ENDPOINTS --write-out="fields" endpoint status


  etcdctl --endpoints=$ENDPOINTS --write-out="fields" endpoint health


   etcdctl --endpoints=$ENDPOINTS --write-out="fields" get /

   http://172.31.15.201:2379,http://172.31.39.223:2379,http://172.31.40.165:2379
