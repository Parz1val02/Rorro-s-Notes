#!/bin/bash
read -p "Enter file name to create> " file
if [ ! -f "$file" ];
then
	touch $file	
	echo "$file created"
else
	echo "$file already exists"
	echo "Exiting..."
fi
exit
