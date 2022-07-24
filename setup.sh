#!/bin/sh

apt-install openssh-server

echo "packer ALL=(ALL) NOPASSWD: ALL" >> /target/etc/sudoers

mkdir -p /target/home/packer/.ssh/
printf '%b' "$(echo $PACKER_AUTHORIZED_KEY | sed 's/+/ /g;s/%/\\x/g')" > /target/home/packer/.ssh/authorized_keys
