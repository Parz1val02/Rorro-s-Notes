#!/bin/bash
#AND operator
read -p "Enter your age> " age
if [ "$age" -gt 18 ] && [  $age -lt 80 ] 
#if [ "$age" -gt 18 -a $age -lt 80 ] 
#if [[ "$age" -gt 18  &&  $age -lt 80 ]]
then
	echo "You are able to drive"
else
	echo "You should not be allowed to drive"
fi

#OR operator
read -p "Enter your name> " name
if [ $name = "Rodro" ] || [ "$name" = "Kori" ]
#if [[ $name = "Rodro" || "$name" = "Kori" ]]
#if [ $name = "Rodro" -o "$name" = "Kori" ]
then
	echo "Welcome to the matrix"
else
	echo "You are blue pilled xdnt"
fi
