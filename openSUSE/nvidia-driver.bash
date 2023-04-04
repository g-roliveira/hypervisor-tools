zypper addrepo https://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
zypper refresh
zypper install cuda
usermod -a -G video momi
reboot
