zypper addrepo https://download.nvidia.com/opensuse/tumbleweed NVIDIA
zypper refresh
zypper install nvidia-drivers-G06
usermod -a -G video momi
reboot
