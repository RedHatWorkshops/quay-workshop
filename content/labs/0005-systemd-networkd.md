---
layout: lab
title: Networkd
permalink: /lab/systemd/networkd/
module: Systemd
---

systemd-networkd is a system daemon that manages network configurations. It detects and configures network devices as they appear. It can also create virtual network devices.

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
ls /etc/systemd/system/ | grep {.network,.link,.netdev}
```

```
ls /run/systemd/network | grep {.network,.link,.netdev}
```

```
ls /usr/lib/systemd/network | grep {.network,.link,.netdev}
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
cat > /etc/systemd/network/00-mybridge.service <<EOF
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
sudo etworkctl list
```

We can also view the bridge device by using the `brctl` userpace program.

```
sudo brctl show
```

We can easily create a veth pair, connect one side to the bridge, and assign the bridge an IP address.

```
cat > /etc/systemd/network/01-veth.netdev <<EOF
[NetDev]
Name=veth0
Kind=veth

[Peer]
Name=veth1
EOF
```

```
cat > /etc/systemd/network/02-connect-to-bridge.network <<EOF
[Match]
Name=veth1

[Network]
Bridge=br0
EOF
```

```
cat > /etc/systemd/network/03-ip-on-bridge.network <<EOF
[Match]
Name=br0

[Network]
Address=192.168.1.5/24
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

In cases where you need to debug networkd, you can easily enable verbose logging by doing the following.

```
mkdir -p /etc/systemd/system/systemd-networkd.service.d/
cat > /etc/systemd/system/systemd-networkd.service.d/10-debug.conf <<EOF
[Service]
Environment=SYSTEMD_LOG_LEVEL=debug
EOF
```

Restart networkd

```
sudo systemctl restart systemd-networkd
```

Verify verbose logging is enabled.

```
journalctl -b -u systemd-networkd --no-pager -f
```