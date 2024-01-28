lsblk

sfdisk -l /dev/nvme0n1
sfdisk -F /dev/nvme0n1

hdparm -S 60 /dev/sd*
fstrim -av
