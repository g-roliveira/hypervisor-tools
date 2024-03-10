cat <<'EOL' >> /etc/hosts

10.11.1.44 ceph.lan ceph
EOL

cat /etc/hosts
hostname -f
