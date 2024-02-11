lsblk

sfdisk -l /dev/nvme0n1
sfdisk -F /dev/nvme0n1
pvdisplay

dnf install -y hdparm
hdparm -S 240 /dev/sd*
fstrim -av
