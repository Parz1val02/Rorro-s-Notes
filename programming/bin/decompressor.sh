#!/bin/bash

if [ -z $1 ];
then
	echo "Usage> $0 <file to extract>"
	exit 1
fi	

name_d=$(7z l $1 | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
7z x $1 > /dev/null 2>&1

while true; do
	7z l $name_d >/dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
		next_d=$(7z l $name_d | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
		7z x $name_d >/dev/null 2>&1 && name_d=$next_d
	else
		cat $name_d; rm data[0-9]* 2>/dev/null
		exit 1
	fi
done
