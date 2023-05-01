cat <<'EOL' > /etc/modules-load.d/vfio.conf
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
EOL
cat /etc/modules-load.d/vfio.conf

PCI=$(lspci -n -s 01:00 | awk -F ': ' {'print $2'} | awk -F ' ' {'print $1'})
echo "options vfio-pci ids=$(echo $PCI | sed 's/ /,/g') disable_vga=1" > /etc/modprobe.d/vfio.conf
cat /etc/modprobe.d/vfio.conf

echo "blacklist amdgpu" >> /etc/modprobe.d/blacklist.conf
echo "blacklist radeon" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf
cat /etc/modprobe.d/blacklist.conf

sed -i -E 's/(GRUB_CMDLINE_LINUX_DEFAULT=".*)"/\1 video=efifb:off video=vesa:off"/g' /etc/default/grub
cat /etc/default/grub

echo "options kvm ignore_msrs=1 report_ignored_msrs=0" > /etc/modprobe.d/kvm.conf
cat /etc/modprobe.d/kvm.conf

update-initramfs -u -k all
update-grub
