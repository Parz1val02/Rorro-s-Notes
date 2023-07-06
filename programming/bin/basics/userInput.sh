#!/bin/bash
#echo "Enter your names"
#read -p "Enter your names: " name1 name2 name3
read -p "Enter your names> " -a names #The -p switch enables the prompt before user input and the -a switch allows to hold user input as an array
echo "your names are ${names[@]}" 
#In bash, to output all items of an array just use @
read -t 5 -p "Enter your password> " -s password 
echo "Your password is: $password" #The -s switch does not echo the input comming from the terminal annd the -t switch is a timeout in seconds
