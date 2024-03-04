# Unifi
Persistent systemd service for enabeling NAT66 to give ULA VLANs internet access

## Install (on device)
```
curl -o /etc/systemd/system/NAT66.service https://raw.githubusercontent.com/HPPinata/Notizen/main/unifi/NAT66.service
systemctl enable --now NAT66
```

## Install (ssh)
```
ssh root@unifi "curl -o /etc/systemd/system/NAT66.service https://raw.githubusercontent.com/HPPinata/Notizen/main/unifi/NAT66.service && systemctl enable --now NAT66"
```
