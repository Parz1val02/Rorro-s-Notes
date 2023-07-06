#!/bin/bash
args=("$@")
echo ${args[0]} 
#Ways to print all elements of the array
echo ${args[@]}
echo $@
#Print the length of the array
echo $#
