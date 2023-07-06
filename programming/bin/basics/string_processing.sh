#!/bin/bash
read -p "Enter strings> " -a strings
if [ ${strings[0]} == ${strings[1]} ];
then
	echo "Both strings match"
else
	echo "Strings do not match"
fi

var1=${strings[0]}
var2=${strings[1]}
echo ${var1^}
echo ${var2^^}
#if [ ${#strings[0]} < ${#strings[1]} ];
#then
#	echo "${strings[0]} is smaller than ${strings[1]}"
#elif [ ${#strings[0]} > ${#strings[1]} ];
#	echo "${strings[0]} is bigger than ${strings[1]}"
#else
#	echo "The strings have the same length"
#fi
