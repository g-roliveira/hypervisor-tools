# Proxmox
Useful scriptlets for various Proxmox tweaks

## All scripts
```
list=( dhcp ksm repo nosub pcie )
for i in ${list[@]}; do
  wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/$i.bash
  chmod +x $i.bash
  cat $i.bash
  bash $i.bash
done
```

## Use DHCP
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/dhcp.bash
chmod +x dhcp.bash
cat dhcp.bash
bash dhcp.bash
```

## Setup KSM
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/ksm.bash
chmod +x ksm.bash
cat ksm.bash
bash ksm.bash
```

## Community Repo
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/repo.bash
chmod +x repo.bash
cat repo.bash
bash repo.bash
```

## Disable Warning
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/nosub.bash
chmod +x nosub.bash
cat nosub.bash
bash nosub.bash
```

## GPU Passthrough
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/pcie.bash
chmod +x pcie.bash
cat pcie.bash
bash pcie.bash
```
