printf "\\x$(cryptsetup luksDump --dump-master-key /dev/nvme0n1p5 | tail -n 4 | tr -d '\t' | sed 's+MK dump:++g' | tr -d '\n' | sed 's+ +\\x+g' | sed 's..$++g')" | hexdump-C
