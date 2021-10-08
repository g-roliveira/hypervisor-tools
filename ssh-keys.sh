#!/bin/sh

#remove existing keys
rm /etc/ssh/ssh_host*

#rsa key
ssh-keygen -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key

#ecdsa key
ssh-keygen -N "" -t ecdsa -b 384 -f /etc/ssh/ssh_host_ecdsa_key

#dsa key: 1024 bits fixed
ssh-keygen -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key

#ed25519 key: 256 bits fixed
ssh-keygen -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
