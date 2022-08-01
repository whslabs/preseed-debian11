#!/bin/sh

apt-install openssh-server

echo "packer ALL=(ALL) NOPASSWD: ALL" >> /target/etc/sudoers

mkdir -p /target/home/packer/.ssh/

if [ -n "$SSH_PUBLIC_KEY" ]; then
  printf '%b' "$(echo $SSH_PUBLIC_KEY | sed 's/+/ /g;s/%/\\x/g')" > /target/home/packer/.ssh/authorized_keys
elif [ -n "$SSH_PUBLIC_KEY_FILE" ]; then
  preseed_fetch $SSH_PUBLIC_KEY_FILE /tmp/packer.pub
  mv /tmp/packer.pub /target/home/packer/.ssh/authorized_keys
fi
