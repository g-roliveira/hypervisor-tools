# zRam optimization
A small service for setting up zswap variables

## Setup 
```
mkdir /opt/zswap && cd /opt/zswap

curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/zram/zswap.bash
chmod +x zswap.bash
bash zswap.bash

curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/zram/zswap.service
systemctl enable /opt/zswap/zswap.service
```
