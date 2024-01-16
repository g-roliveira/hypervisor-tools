# zRam optimization
A small service for setting up zswap variables

## Tuned
```
dnf install -y tuned
systemctl enable --now tuned

mkdir /etc/tuned/zswap
cd /etc/tuned/zswap
curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/zram/tuned.conf

tuned-adm profile zswap
```

## Systemd 
```
mkdir /opt/zswap && cd /opt/zswap

curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/zram/zswap.bash
chmod +x zswap.bash

curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/zram/zswap.service
systemctl enable --now /opt/zswap/zswap.service
```
