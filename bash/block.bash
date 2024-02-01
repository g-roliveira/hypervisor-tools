lsblk

sfdisk -l /dev/nvme0n1
sfdisk -F /dev/nvme0n1

dnf install -y hdparm
hdparm -S 240 /dev/sd*
fstrim -av
