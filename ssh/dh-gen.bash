#!/bin/bash

#set minimum and maximum key size, as well as step size
START="${1:-2048}"
LIMIT="${2:-8192}"
STEP="${3:-1024}"
SIZE=$START

rm -r temp && rm moduli && killall ssh-keygen
mkdir temp && cd temp

#start first stage (generation), runs multiple sizes in parallel
while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M generate -O bits=$SIZE "$SIZE".c &
	(( SIZE = $SIZE + $STEP ))
done
wait

#reset size to start value for second stage
sleep 1
SIZE=$START

#start second stage (validation), runs multiple sizes in parallel
while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M screen -f "$SIZE".c "$SIZE".f &
	(( SIZE = $SIZE + $STEP ))
done
wait

#remove files from first stage and create sorted, final output
rm *.c
cat $(ls -v) > moduli

#move file to correct location and delete temporary directory
cp moduli ../moduli
mv /etc/ssh/moduli /etc/ssh/mod.back
mv moduli /etc/ssh/moduli
cd .. && rm -r temp
