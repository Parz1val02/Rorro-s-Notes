#!/bin/bash
read -p "Enter a number from 1-5> " number
case $number in
	1) echo "The number is 1";;
	2) echo "The number is 2";;
	3) echo "The number is 3";;
	4) echo "The number is 4";;
	5) echo "The number is 5";;
	*) echo "The number is not in the specified range";;
esac
