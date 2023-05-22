useradd -M momi
smbpasswd -a momi
mkdir /var/share/mnt/net/desktop
chown -R momi:momi /var/share/mnt/net/desktop
