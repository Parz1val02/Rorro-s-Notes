#!/bin/bash
#Name="Rodro"
read -p "Please, enter your name> " Name
if [ $Name = "Rodro" ];
then
	echo "Welcome Rodro"
else
	echo "Invalid username"
fi

count=10
if [ $count -ne 10 ]; #The switch -eq means equal to; -ne means not equal to; -gt means greater than; -lt means less than
then
	echo "The conditional is true"
else
	echo "The conditional is false"
fi

if (( $count < 10 ))
then
	echo "The first condition is true"
elif (( $count > 10 ))
then
	echo "The second condition is true"
else
	echo "The condition is false"
fi
