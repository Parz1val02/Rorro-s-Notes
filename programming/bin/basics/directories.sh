#!/bin/bash
read -p "Enter directory name to check> " direct
if [ -d "$direct" ]; 
then
	echo "$direct exists owo"
else
	echo "$direct does not exist :("
fi
