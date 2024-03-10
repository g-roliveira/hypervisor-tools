cat <<'EOL' >> /etc/hosts

192.168.1.44 ceph.lan ceph
EOL

cat /etc/hosts
hostname -f
