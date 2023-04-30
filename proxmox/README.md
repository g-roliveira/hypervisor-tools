# Proxmox
Useful scriptlets for various Proxmox tweaks

## Use DHCP
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/dhcp.bash
cat dhcp.bash
bash dhcp.bash
```
Now reboot and select Non-Enterprise repo in webui

## Disable Warning
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/nosub.bash
cat nosub.bash
bash nosub.bash
```

## GPU Passthrough
```
wget https://raw.githubusercontent.com/HPPinata/Notizen/main/proxmox/PCIe_pass.bash
cat PCIe_pass.bash
bash PCIe_pass.bash
```
