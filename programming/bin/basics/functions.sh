#!/bin/bash
function test_shadow(){
	if [ -e $1$2 ];
	then
		echo "The shadow file exists"
	else
		echo "The shadow file does not exist"
	fi
	test_passwd
}
function test_passwd(){
	if [ -e /etc/passwd ];
	then
		echo "The passwd file exists"
	else
		echo "The passwd file does not exist"
	fi
}
test_shadow /etc /shadow #Passing arguments to the functions
