sed -i.bak 's/notfound/active/g' /usr/share/perl5/PVE/API2/Subscription.pm
systemctl restart pveproxy.service
