#!/bin/bash

cat /etc/sysconfig/bootloader | grep "_BOOT"
cat /usr/sbin/shim-install | grep "tpm2_key_protector_init"

zypper in -y tpm2.0-tools

tpm2_getrandom --hex 8
systemd-cryptenroll --tpm2-device=list

cat <<'EOL' >> /etc/default/grub

GRUB_TPM2_PCR_LIST=0,2,4,7
GRUB_TPM2_SEALED_KEY=sealed_rootfs_key
EOL

grub2-mkconfig -o /boot/grub2/grub.cfg
shim-install
reboot

dd if=/dev/urandom of=/boot_keyfile bs=1 count=256
chmod 0400 /boot_keyfile

cryptsetup luksAddKey /dev/vda2 /boot_keyfile --pbkdf=pbkdf2
cryptsetup luksDump /dev/vda2

grub2-protect --action=add --protector=tpm2 --tpm2key --tpm2-keyfile=/boot_keyfile --tpm2-outfile=/boot/efi/EFI/opensuse/sealed_rootfs_key --tpm2-pcrs=0,2,4,7

