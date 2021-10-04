#!/bin/bash

SIZE=1024
MULTI=2
LIMIT=8192

rm -r temp
mkdir temp && cd temp

while (( $SIZE * $MULTI <= $LIMIT ))
do
	ssh-keygen -M generate -O bits=$SIZE candidates$SIZE &
	(( MULTI ++ ))
done
wait

sleep 1
MULTI=2

while (( $SIZE * $MULTI <= $LIMIT ))
do
	ssh-keygen -M screen -f candidates$SIZE $MULTI_$SIZE.f &
	(( MULTI ++ ))
	
done
wait

rm candidates*
cat * > final

mv /etc/ssh/moduli /etc/ssh/mod.back
mv final /etc/ssh/moduli
cd .. && rm -r temp
