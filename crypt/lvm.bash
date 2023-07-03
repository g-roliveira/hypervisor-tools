#!/bin/bash

lvresize -r -L -1G system/root
pvresize --setphysicalvolumesize XXXX /dev/nvme0n1p5 #16+ MB smaller than device for LUKS2 header. Shrinking 100+ MB and growing after recommended
vgchange -an

cryptsetup reencrypt /dev/nvme0n1p5 --encrypt --reduce-device-size 16M --pbkdf pbkdf2 #GRUB 2.06 only supports pbkdf2
cryptsetup open /dev/nvme0n1p5 crypt_root
vgchange -ay

mount /dev/system/root /mnt
for i in proc run sys dev; do mount --rbind /$i /mnt/$i; done
chroot /mnt

mount -a
echo 'crypt_root  /dev/nvme0n1p5  none' >> /etc/crypttab
sed -i 's+GRUB_ENABLE_CRYPTODISK="n"+GRUB_ENABLE_CRYPTODISK="y"+g' /etc/default/grub

mkinitrd
grub2-mkconfig -o /boot/grub2/grub.cfg
shim-install

exit
pvresize /dev/mapper/crypt_root
lvresize -r -l +100%FREE system/root
reboot
