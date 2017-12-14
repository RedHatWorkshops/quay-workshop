---
layout: lab
title: Setting up etcd
permalink: /lab/provisioning/coreosmetadataservice/
module: Provisioning
---

/usr/bin/coreos-metadata --provider=ec2 --attributes=/run/metadata/coreos

plus ignition





systemc












---
layout: lab
title: Dynamic Data
permalink: /lab/systemd/dynamicdata/
module: Systemd
---



Using environment variables in systemd units

Environment directive

systemd has an Environment directive which sets environment variables for executed processes. It takes a space-separated list of variable assignments. This option may be specified more than once in which case all listed variables will be set. If the same variable is set twice, the later setting will override the earlier setting. If the empty string is assigned to this option, the list of environment variables is reset, all prior assignments have no effect. Environments directives are used in built-in Container Linux systemd units, for example in etcd2 and flannel.

With the example below, you can configure your etcd2 daemon to use encryption. Just create /etc/systemd/system/etcd2.service.d/30-certificates.conf drop-in for etcd2.service:

[Service]
# Client Env Vars
Environment=ETCD_CA_FILE=/path/to/CA.pem
Environment=ETCD_CERT_FILE=/path/to/server.crt
Environment=ETCD_KEY_FILE=/path/to/server.key
# Peer Env Vars
Environment=ETCD_PEER_CA_FILE=/path/to/CA.pem
Environment=ETCD_PEER_CERT_FILE=/path/to/peers.crt
Environment=ETCD_PEER_KEY_FILE=/path/to/peers.key
Then run sudo systemctl daemon-reload and sudo systemctl restart etcd2.service to apply new environments to etcd2 daemon. You can read more about etcd2 certificates here.

EnvironmentFile directive

EnvironmentFile similar to Environment directive but reads the environment variables from a text file. The text file should contain new-line-separated variable assignments.

For example, in Container Linux, the coreos-metadata.service service creates /run/metadata/coreos. This environment file can be included by other services in order to inject dynamic configuration. Here's an example of the environment file when run on DigitalOcean (the IP addresses have been removed):

COREOS_DIGITALOCEAN_IPV4_ANCHOR_0=X.X.X.X
COREOS_DIGITALOCEAN_IPV4_PRIVATE_0=X.X.X.X
COREOS_DIGITALOCEAN_HOSTNAME=test.example.com
COREOS_DIGITALOCEAN_IPV4_PUBLIC_0=X.X.X.X
COREOS_DIGITALOCEAN_IPV6_PUBLIC_0=X:X:X:X:X:X:X:X
This environment file can then be sourced and its variables used. Here is an example drop-in for etcd-member.service which starts coreos-metadata.service and then uses the generated results:

[Unit]
Requires=coreos-metadata.service
After=coreos-metadata.service

[Service]
EnvironmentFile=/run/metadata/coreos
ExecStart=
ExecStart=/usr/bin/etcd2 \
  --advertise-client-urls=http://${COREOS_DIGITALOCEAN_IPV4_PUBLIC_0}:2379 \
  --initial-advertise-peer-urls=http://${COREOS_DIGITALOCEAN_IPV4_PRIVATE_0}:2380 \
  --listen-client-urls=http://0.0.0.0:2379 \
  --listen-peer-urls=http://${COREOS_DIGITALOCEAN_IPV4_PRIVATE_0}:2380 \
  --initial-cluster=%m=http://${COREOS_DIGITALOCEAN_IPV4_PRIVATE_0}:2380
Other examples

Use host IP addresses and EnvironmentFile
You can also write your host IP addresses into /etc/network-environment file using this utility. Then you can run your Docker containers following way:

[Unit]
Description=Nginx service
Requires=etcd2.service
After=etcd2.service
[Service]
# Get network environmental variables
EnvironmentFile=/etc/network-environment
ExecStartPre=-/usr/bin/docker kill nginx
ExecStartPre=-/usr/bin/docker rm nginx
ExecStartPre=/usr/bin/docker pull nginx
ExecStartPre=/usr/bin/etcdctl set /services/nginx '{"host": "%H", "ipv4_addr": ${DEFAULT_IPV4}, "port": 80}'
ExecStart=/usr/bin/docker run --rm --name nginx -p ${DEFAULT_IPV4}:80:80 nginx
ExecStop=/usr/bin/docker stop nginx
ExecStopPost=/usr/bin/etcdctl rm /services/nginx

