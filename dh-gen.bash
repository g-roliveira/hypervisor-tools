#!/bin/bash

SIZE=2048
ADD=1024
LIMIT=8192

rm -r temp
mkdir temp && cd temp

while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M generate -O bits=$SIZE candidates$SIZE &
	(( SIZE = $SIZE + $ADD ))
done
wait

sleep 1
SIZE=2048

while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M screen -f candidates$SIZE "$SIZE".f &
	(( SIZE = $SIZE + $ADD ))
done
wait

rm candidates*
cat $(ls -v) > final

mv /etc/ssh/moduli /etc/ssh/mod.back
mv final /etc/ssh/moduli
cd .. && rm -r temp
