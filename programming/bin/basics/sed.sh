#!/bin/bash -x

read -p "Enter file to substitute using sed> " file
if [ -f $file ];
then
	cat os.txt | sed 's/i/I/g'
else
	echo "$file does not exist"
fi
