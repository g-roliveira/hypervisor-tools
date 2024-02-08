# Unifi
Persistent systemd service for enabeling NAT66 to give ULA VLANs internet access

## Install
```
curl -o /lib/systemd/system/udm-boot.service https://raw.githubusercontent.com/HPPinata/Notizen/main/unifi/NAT66.service
systemctl daemon-reload
systemctl enable udm-boot
systemctl start udm-boot
```
