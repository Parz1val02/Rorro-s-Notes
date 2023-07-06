#!/bin/bash
if [ -d ~/bin ];
then 
	echo "Yes, it exits"
else
	echo "The directory does not exist"
fi
if [ ! -e ~/attackers.txt ];
then 
	echo "It does not exits"
else
	echo "The file does exist"
fi
