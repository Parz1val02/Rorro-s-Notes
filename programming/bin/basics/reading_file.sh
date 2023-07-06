#!/bin/bash
read -p "Enter file from which to read> " file
if [ -f "$file" ];
then
	while IFS="" read -r line
	do
		echo "$line"
	done < $file
else
	echo "$file does not exist pipipi"
	echo "Exiting..."
fi
exit
