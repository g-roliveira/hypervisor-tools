#!/bin/bash

lvresize -r -L -100M system/root
pvresize --setphysicalvolumesize XXXX /dev/sda2 #at least 32M smaller than device to make space for the LUKS2 header. 50M recommended
vgchange -an

cryptsetup reencrypt /dev/sda2 --encrypt --reduce-device-size 32M --pbkdf pbkdf2 #GRUB 2.06 only supports pbkdf2
cryptsetup open /dev/sda2
vgchange -ay

mount /dev/system/root /mnt
for i in proc run sys dev; do mount --rbind /$i /mnt/$i; done
chroot /mnt

mount -a
echo 'crypt_root  /dev/sda2  none' >> /etc/crypttab
sed -i 's+GRUB_ENABLE_CRYPTODISK="n"+GRUB_ENABLE_CRYPTODISK="y"+g' /etc/default/grub

mkinitrd
grub2-mkconfig -o /boot/grub2/grub.cfg
shim-install

exit
pvresize /dev/mapper/crypt_root
lvresize -r -l +100%FREE system/root
reboot
