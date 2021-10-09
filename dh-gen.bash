#!/bin/bash

#set minimum and maximum key size, as well as step size
SIZE=2048
STEP=1024
LIMIT=8192

rm -r temp
mkdir temp && cd temp

#start first stage (generation), runs multiple sizes in parallel
while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M generate -O bits=$SIZE candidates$SIZE &
	(( SIZE = $SIZE + $STEP ))
done
wait

#reset size to start value for second stage
sleep 1
SIZE=2048

#start second stage (validation), runs multiple sizes in parallel
while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M screen -f candidates$SIZE "$SIZE".f &
	(( SIZE = $SIZE + $STEP ))
done
wait

#remove files from first stage and create sorted, final output
rm candidates*
cat $(ls -v) > final

#move file to correct location and delete temporary directory
mv /etc/ssh/moduli /etc/ssh/mod.back
mv final /etc/ssh/moduli
cd .. && rm -r temp
