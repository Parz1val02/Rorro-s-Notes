#!/bin/bash
myDir="$HOME/"
options=$( cd ${myDir} && /usr/bin/ls -d */ | cut -d" " -f 1)
echo -e  "${options[@]}"

for Name in ${options}; do
	if [ $Name == "spotifyd/" ]; then
		echo "Suiiiiii"
	elif [ $Name == "Obsidian/" ]; then
		echo "Siuuuuuu"	
	else
		echo "nel"
	fi
done
