#!/bin/bash

read -p "Enter file to search text from> " file
if [ -f $file ];
then
	read -p "Enter the text to search> " grepvar
	grep -i -n $grepvar $file
else
	echo "$file does not exist"
fi
