isoinfo -i fcos.iso -R -l | grep ignition | awk -F '[\\[\\]]' {'print substr($2, 1, length($2)-3)'}
