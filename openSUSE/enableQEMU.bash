#!/bin/bash

transactional-update pkg in -y podman qemu-linux-user && reboot

/sbin/qemu-binfmt-conf.sh --persistent yes --systemd ALL
