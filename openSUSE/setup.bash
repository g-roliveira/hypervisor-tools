#!/bin/bash

echo 'default' > /etc/hostname
echo 'PermitRootLogin yes' > /etc/ssh/sshd_config.d/root.conf

mount /dev/sr0 /mnt

zypper rm -yu xen-tools-domU
/mnt/Linux/install.sh -d sles -m 15 -n

zypper in -y nano zram-generator

cat <<'EOL' > /etc/systemd/zram-generator.conf
[zram0]

zram-size = ram
compression-algorithm = zstd
EOL

sed -i "s+SELINUX=enforcing+SELINUX=permissive+g" /etc/selinux/config
