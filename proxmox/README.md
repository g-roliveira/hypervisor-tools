# Proxmox
Useful scriptlets for various Proxmox tweaks

## All scripts
```
mkdir setup && cd setup
list=( block btrfs font dhcp hosts cron repo back ksm fastdrive nosub )
for i in ${list[@]}; do
  curl -O https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/scripts/$i.bash
  chmod +x $i.bash
  cat $i.bash
  bash $i.bash
done
cd ..
reboot
```
