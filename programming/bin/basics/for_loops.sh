#!/bin/bash

for Name in $(cat names.txt); do
	echo "The name is $Name"
done

for i in 1 2 3 4 5 
do
	echo $i
done

for i in {0..20..2} 
do
	echo $i
done

for (( i=0; i<=10 ;i++ ))
do
	if [ $i -gt 8 ];
	then
		break
	fi
	if [ $i -eq 3 -o $i -eq 7 ];
	then
		continue
	fi
	echo $i
done
