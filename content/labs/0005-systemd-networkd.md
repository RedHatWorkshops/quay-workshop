---
layout: lab
title: Networkd
permalink: /lab/systemd/networkd/
module: Systemd
---

`systemd-networkd` is a system daemon that manages network configurations. It detects and configures network devices as they appear. It can also create virtual network devices.

There are three types of configuration files. They all use a format similar to systemd unit files.

`.link` files: when a network device appears, udev will look for the first matching `.link` file via `net_setup_link`
`.network` files: apply a network configuration for a matching device (includes ip address, subnet, gateway, etc.)
`.netdev` files: They will create a virtual network device for a matching environment. These includes bridges, veth pairs, tap interfaces, tunnels, etc.

A wildcard (`*`) can be used in VALUE (e.g `en*` will match any Ethernet device).

Files are read from the following (also supports a "drop-in" directory, i.e. `foo.network.d` with files containing `.conf` suffix.)

1) /etc/systemd/network
2) /run/systemd/network 
3) /usr/lib/systemd/network

View the current status of the systemd-networkd unit.

```
sudo systemctl status systemd-networkd
```

View any possible `.link`, `.network`, or `.netdev` files.

```
find /etc/systemd/system -name "*.link*" -or -name "*.network" -or -name "*.netdev"
```

```
find /run/systemd/network/ -name "*.link*" -or -name "*.network" -or -name "*.netdev"
```

```
find /usr/lib/systemd/ -name "*.link*" -or -name "*.network" -or -name "*.netdev"
```

View the default `.link` file.

```
cat /usr/lib/systemd/network/99-default.link
```

`networkctl` may be used to introspect the state of the network links as seen by systemd-networkd.

```
sudo networkctl list
```

View more details of the second interface.

```
sudo networkctl status 2
```

Let's create a bridge device by creating a `.netdev` file.

```
sudo bash -c "cat > /etc/systemd/network/00-mybridge.netdev" <<EOF
[NetDev]
Name=br0
Kind=bridge
EOF
```

Restart the networkd unit.

```
sudo systemctl restart systemd-networkd
```

List network interfaces. You should now see the new bridge device.

```
sudo networkctl list
```

We can also view the bridge device by using the `brctl` userspace program.

```
sudo brctl show
```

We can easily create a veth pair, connect one side to the bridge, and assign the bridge an IP address.

```
sudo bash -c "cat > /etc/systemd/network/01-veth.netdev" <<EOF
[NetDev]
Name=veth0
Kind=veth

[Peer]
Name=veth1
EOF
```

```
sudo bash -c "cat > /etc/systemd/network/02-connect-to-bridge.network" <<EOF
[Match]
Name=veth1

[Network]
Bridge=br0
EOF
```

```
sudo bash -c "cat > /etc/systemd/network/03-ip-on-bridge.network" <<EOF
[Match]
Name=br0

[Network]
Address=192.168.0.1/24
EOF
```

Restart networkd to apply the newly added network configuration.

```
sudo systemctl restart systemd-networkd
```

View the newly created veth pair.

```
ip a
```

View the one side of the veth pair plugged into the bridge.

```
sudo brctl show
```
