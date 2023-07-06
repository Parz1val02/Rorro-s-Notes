#!/bin/bash

read -p "Enter file to search text from> " file
if [ -f $file ];
then
	awk '/Linux/ {print $1,$3}' $file
else
	echo "$file does not exist"
fi
