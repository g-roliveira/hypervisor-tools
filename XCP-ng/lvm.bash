sed -i "s+metadata_read_only = 1+metadata_read_only = 0+g" /etc/lvm/lvm.conf

pvcreate -ff /dev/sda /dev/sdb
vgcreate data /dev/sda /dev/sdb
lvcreate -n lvol -l 96%PVS --type raid1 data

mkdir /srv/pass_drives
dm=$(ls -l /dev/disk/by-id/dm-name-data-lvol | awk -F '->.*/' {'print $2'})
ln -s "/dev/$dm" /srv/pass_drives/

xe sr-create name-label=Pass_Drives type=udev content-type=disk device-config:location=/srv/pass_drives
