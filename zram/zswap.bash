#!/bin/bash

:> /etc/systemd/zram-generator.conf
zswap=/sys/module/zswap/parameters

echo 1 > $zswap/enabled
echo zstd > $zswap/compressor
echo zsmalloc > $zswap/zpool
