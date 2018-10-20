#!/usr/bin/sh
cp -f /etc/apt/sources.list /etc/apt/sources.list.bak
cat ubuntu_16.04.mirror > /etc/apt/sources.list
apt-get update

# reinstall openssh-server
echo y | apt-get remove openssh-server
echo y | apt-get install openssh-server

echo  "which port you want bind to ssh ?"
read ssh_port
sed -i s/"Port 22"/"Port $ssh_port"/g /etc/ssh/sshd_config
sed -i s/"PermitRootLogin prohibit-password"/"PermitRootLogin yes"/g /etc/ssh/sshd_config
sed -i s/"PasswordAuthentication no"/"PasswordAuthentication yes"/g /etc/ssh/sshd_config

/etc/init.d/ssh start