#!/bin/bash

cat <<'EOL' | crontab -
SHELL=/bin/bash
BASH_ENV=/etc/profile

@reboot fstrim -av
EOL

crontab -l
