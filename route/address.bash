mkdir /var/nextcloud/mount/addr
echo $(ip addr -4 | grep -A1 enX0 | grep inet | awk -F ' ' '{print $2}' | awk -F '/' '{print $1}') > /var/nextcloud/mount/addr/ipv4
echo $(ip addr -6 | grep -A1 enX0 | grep inet | awk -F ' ' '{print $2}' | awk -F '/' '{print $1}') > /var/nextcloud/mount/addr/ipv6
