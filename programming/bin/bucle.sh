#!/bin/bash
contador=0
while read line;do
	echo "Linea $contador: $line"
	let contador+=1
done < /etc/passwd
