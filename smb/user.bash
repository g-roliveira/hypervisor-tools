useradd -M momi
smbpasswd -a momi
mkdir /var/smbshare/mnt/net/desktop
chown -R momi:momi /var/smbshare/mnt/net/desktop
