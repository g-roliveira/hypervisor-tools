drive=$(ls /dev/sd*)
cache=$(ls /dev/nvme*)
dd if=/dev/zero bs=1M count=100 | tee ${cache[@]} ${drive[@]} > /dev/zero
