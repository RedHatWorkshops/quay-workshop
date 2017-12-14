#cloud-config

bootcmd:
 - echo ${lab_node1} host1 >> /etc/hosts
 - echo ${lab_node2} host2 >> /etc/hosts
 - echo ${lab_node3} host3 >> /etc/hosts
packages:
 - docker.io
 - fail2ban
runcmd:
 - chown -R lab: /hom/lab
users:
  - default
  - name: lab
    gecos: Lab user
    groups: adm
    lock_passwd: true
    shell: /bin/bash
    ssh-authorized-keys:
      - ${cluster_public_key}
      - ${lab_public_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
write_files:
-   content: |
        export HOST_1=${lab_node1}
        export HOST_2=${lab_node2}
        export HOST_3=${lab_node3}
    owner: lab:lab
    path: /home/lab/.bash_profile
