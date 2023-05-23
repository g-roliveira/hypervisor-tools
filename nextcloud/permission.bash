#!/bin/bash

chown 33:33 /var/nextcloud/mount
find /var/nextcloud/mount -type f -exec chmod 644 -- {} +
find /var/nextcloud/mount -type d -exec chmod 755 -- {} +
