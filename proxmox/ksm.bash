sed -i.bak "s+# KSM_THRES_COEF=.*+KSM_THRES_COEF=25+g" /etc/ksmtuned.conf
cat /etc/ksmtuned.conf
systemctl restart ksmtuned
