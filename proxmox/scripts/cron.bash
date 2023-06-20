#!/bin/bash

cat <<'EOL' | crontab -
*/5 * * * * bash /root/scripts/hosts.bash
EOL
