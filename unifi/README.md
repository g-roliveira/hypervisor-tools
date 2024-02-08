# Unifi
Persistent systemd service for enabeling NAT66 to give ULA VLANs internet access

## Install
```
curl -o /lib/systemd/system/NAT66.service https://raw.githubusercontent.com/HPPinata/Notizen/main/unifi/NAT66.service
systemctl daemon-reload
systemctl enable NAT66
systemctl start NAT66
```
