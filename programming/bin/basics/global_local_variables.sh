#!/bin/bash
#By default, all variables are global variables in bash, even ones defined in a function
greet_user1(){
	echo "Hello $name, how are you doing?"
	greet_user2 Rodro
}
greet_user2(){
	local name=$1 #by adding local, the variables locks to this function
	echo "Hello $name, how are you doing?"
}
name="Rod"
greet_user1 
echo "Hello $name, how are you doing?"
