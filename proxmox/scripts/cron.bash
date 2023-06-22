#!/bin/bash

cat <<'EOL' | crontab -
*/5 * * * * bash /root/setup/hosts.bash
EOL
