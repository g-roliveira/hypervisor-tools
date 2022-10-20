#!/bin/sh

#remove existing keys
rm /etc/ssh/ssh_host*

#generate keys with default parameters
ssh-keygen -A
