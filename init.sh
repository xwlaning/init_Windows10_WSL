#!/usr/bin/sh
cp -f /etc/apt/sources.list /etc/apt/sources.list.bak
cat ubuntu_16.04.mirror > /etc/apt/sources.list
apt-get update
