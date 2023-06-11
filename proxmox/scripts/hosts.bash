#!/bin/bash

IP=$(ip -4 addr | grep -EA1 "enp8s0|vmbr0" | grep inet | awk -F ' ' '{print $2}' | awk -F '/' '{print $1}')
sed -i "s+.*proxmox.+$IP proxmox.+g" /etc/hosts
