drive=$(ls /dev/sd*)
cache=( /dev/nvme0n1 /dev/nvme1n1 )
dd if=/dev/zero bs=1M count=100 | tee ${cache[@]} ${drive[@]} /dev/nvme2n1 > /dev/zero
