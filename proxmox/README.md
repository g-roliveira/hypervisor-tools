# Proxmox
Useful scriptlets for various Proxmox tweaks

## All scripts
```
list=( dhcp font ksm repo nosub pcie )
for i in ${list[@]}; do
  wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/$i.bash
  chmod +x $i.bash
  cat $i.bash
  bash $i.bash
done
```
