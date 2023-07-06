#!/bin/bash
#The while loop will execute until the condition is false
num=$1
while [ $num -ge 20 ] #-lt is less than; -le is less or eqal to; -gt; -ge
do
	echo "$num"
	num=$(( num-1 )) 
done
#The until loop will execute until the condition is true
until [ $num -le 10 ]
do 
	echo "$num"
	num=$(( num-1))
done
