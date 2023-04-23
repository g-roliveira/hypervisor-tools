cp /etc/network/interfaces /etc/network/interfaces.bak
sed -n '1h;1!H;${g;s/iface vmbr0.*10.1/iface vmbr0 inet dhcp/;p;}' /etc/network/interfaces.bak > /etc/network/interfaces
