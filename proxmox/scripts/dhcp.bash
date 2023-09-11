#!/bin/bash

cp /etc/network/interfaces /etc/network/interfaces.bak

VAR=$(cat <<'EOL'

iface enp8s0 inet manual
auto vmbr0

iface vmbr0 inet static
        address 192.168.8.40/24
        gateway 192.168.8.1
        bridge-ports enp8s0
        bridge-stp on
        bridge-fd 0

iface vmbr0 inet6 auto
EOL
)

VAR=$(VAR=${VAR@Q}; echo "${VAR:2:-1}")
sed -i -E "s+iface enp8s0 inet (auto|dhcp)+$VAR+g" /etc/network/interfaces

cat /etc/network/interfaces
