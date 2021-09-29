#!/bin/bash

SIZE=2048
ADD=1024
LIMIT=8192

while (( $SIZE <= $LIMIT ))
do
	ssh-keygen -M generate -O bits=$SIZE candidates
	ssh-keygen -M screen -f candidates final
	rm candidates
	(( SIZE = $SIZE + $ADD ))
done
mv /etc/ssh/moduli /etc/ssh/mod.back
mv final /etc/ssh/moduli
