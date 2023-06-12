#!/bin/bash

cat <<'EOL' | crontab -
@reboot bash /root/scripts/hosts.bash
EOL
