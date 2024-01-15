#!/bin/bash

zswap=/sys/module/zswap/parameters

echo 1 > $zswap/enabled
echo zstd > $zswap/compressor
echo zsmalloc > $zswap/zpool
