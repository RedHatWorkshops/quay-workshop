---
layout: lab
title: Manging Users and Groups
permalink: /lab/users/mangingusers/
module: Users and Groups
---

Add user manually

If you'd like to add a user manually, SSH to the machine and use the useradd tool. To create the user user, run:

sudo useradd -p "*" -U -m user1 -G sudo
The "*" creates a user that cannot login with a password but can log in via SSH key. -U creates a group for the user, -G adds the user to the existing sudo group and -m creates a home directory. If you'd like to add a password for the user, run:

$ sudo passwd user1
New password:
Re-enter new password:
passwd: password changed.
To assign an SSH key, run:

update-ssh-keys -u user1 -a user1 user1.pem
Grant sudo Access

If you trust the user, you can grant administrative privileges using visudo. visudo checks the file syntax before actually overwriting the sudoers file. This command should be run as root to avoid losing sudo access in the event of a failure. Instead of editing /etc/sudo.conf directly you will create a new file under the /etc/sudoers.d/ directory. When you run visudo, it is required that you specify which file you are attempting to edit with the -f argument: 

# visudo -f /etc/sudoers.d/user1
Add a the line:

user1 ALL=(ALL) NOPASSWD: ALL
Check that sudo has been granted:

# su user1
$ cat /etc/sudoers.d/user1
cat: /etc/sudoers.d/user1: Permission denied

$ sudo cat /etc/sudoers.d/user1
user1 ALL=(ALL) NOPASSWD: ALL