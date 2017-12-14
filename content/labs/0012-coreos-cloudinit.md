---
layout: lab
title: Coreos Cloud-Init
permalink: /lab/provisioning/coreoscloudinit/
module: Provisioning
---

journalctl --identifier=coreos-cloudinit



systemctl status oem-cloudinit.service



/usr/bin/coreos-cloudinit --from-file much.yaml



/usr/bin/coreos-cloudinit --help

/etc/systemd/system/docker-redis.service

#cloud-config

coreos:
  units:                                     <----------------these get put in /etc/systemd/system/*.service
    - name: "docker-redis.service"
      command: "start"
      content: |
        [Unit]
        Description=Redis container
        Author=Me
        After=docker.service

        [Service]
        Restart=always
        ExecStart=/usr/bin/docker start -a redis_server
        ExecStop=/usr/bin/docker stop -t 2 redis_server






Add the DOCKER_OPTS environment variable to docker.service.

#cloud-config

coreos:
  units:
    - name: "docker.service"
      drop-ins:
        - name: "50-insecure-registry.conf"
          content: |
            [Service]
            Environment=DOCKER_OPTS='--insecure-registry="10.0.1.0/24"'



DROP IN CONCEPT HERE:

BEFRE:

ip-172-31-40-186 ~ # systemctl status docker.service
● docker.service - Docker Application Container Engine
   Loaded: loaded (/run/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2017-12-11 04:22:48 UTC; 1h 11min ago
#cloud-config
     Docs: http://docs.docker.com
 Main PID: 1327 (dockerd)
    Tasks: 8
   Memory: 14.7M
      CPU: 2.794s
   CGroup: /system.slice/docker.service
           └─1327 /run/torcx/bin/dockerd --host=fd:// --containerd=/var/run/docker/libcontainerd/docker-containerd.sock --selinux-enabled=true


AFTER:

ip-172-31-40-186 system # systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/run/systemd/system/docker.service; disabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/docker.service.d
           └─50-insecure-registry.conf
   Active: active (running) since Mon 2017-12-11 05:36:23 UTC; 3s ago
     Docs: http://docs.docker.com
 Main PID: 4024 (dockerd)
    Tasks: 6
   Memory: 13.2M
      CPU: 197ms
   CGroup: /system.slice/docker.service
           └─4024 /run/torcx/bin/dockerd --host=fd:// --containerd=/var/run/docker/libcontainerd/docker-containerd.sock --selinux-enabled=true --insecure-registry=10.0.1.0/24







           Cloud-Config Locations

NOTE: coreos-cloudinit is no longer under active development and has been superseded by Ignition. For more information about the recommended tools for provisioning Container Linux, refer to the provisioning documentation.

On every boot, coreos-cloudinit looks for a config file to configure your host. Here is a list of locations which are used by the Cloud-Config utility, depending on your CoreOS platform:

LOCATION	DESCRIPTION
/media/configvirtfs/openstack/latest/user_data	/media/configvirtfs mount point with config-2 label. It should contain a openstack/latest/user_data relative path. Usually used by cloud providers or in VM installations.
/media/configdrive/openstack/latest/user_data	FAT or ISO9660 filesystem with config-2 label and /media/configdrive/ mount point. It should also contain a openstack/latest/user_data relative path. Usually used in installations which are configured by USB Flash sticks or CDROM media.
Kernel command line: cloud-config-url=http://example.com/user_data.	You can find this string using this command cat /proc/cmdline. Usually used in PXE or iPXE boots.
/var/lib/coreos-install/user_data	When you install CoreOS manually using the coreos-install tool. Usually used in bare metal installations.
/usr/share/oem/cloud-config.yml	Path for OEM images.
/var/lib/coreos-vagrant/vagrantfile-user-data	Vagrant OEM scripts automatically store Cloud-Config into this path.
/var/lib/waagent/CustomData	Azure platform uses OEM path for first Cloud-Config initialization and then /var/lib/waagent/CustomData to apply your settings.
http://169.254.169.254/metadata/v1/user-data http://169.254.169.254/2009-04-04/user-data https://metadata.packet.net/userdata	DigitalOcean, EC2 and Packet cloud providers correspondingly use these URLs to download Cloud-Config.
/usr/share/oem/bin/vmtoolsd --cmd "info-get guestinfo.coreos.config.data"	Cloud-Config provided by VMware Guestinfo
/usr/share/oem/bin/vmtoolsd --cmd "info-get guestinfo.coreos.config.url"	Cloud-Config URL provided by VMware Guestinfo
You can also run the coreos-cloudinit tool manually and provide a path to your custom Cloud-Config file:

sudo coreos-cloudinit --from-file=/home/core/cloud-config.yaml
This command will apply your custom cloud-config.




This data is passed to the Azure API as base64-encoded data.  On Windows this data ends up in %SYSTEMDRIVE%\AzureData\CustomData.bin as a binary file.  On Linux, this data is passed to the VM via the ovf-env.xml file, which is copied to the /var/lib/waagent directory during provisioning.  Newer versions of the Microsoft Azure Linux Agent will also copy the base64-encoded data to /var/lib/waagent/CustomData as well for convenience.



/var/lib/waagent/ovf-env.xml




az vm create --name node-1 --resource-group group-1 --admin-username core --custom-data "$(cat config.ign)" --image CoreOS:CoreOS:Stable:latest



-mention templating (public/private ip)

Ignition only reads user-data and only applies on first boot. We wanted to make it very clear that this is a provisioning tool and not a general configuration management tool.