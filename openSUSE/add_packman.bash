#!/bin/bash

sudo zypper ar -cfp 90 https://ftp.fau.de/packman/suse/openSUSE_Tumbleweed/ packman

sudo zypper dup --from packman --allow-vendor-change
