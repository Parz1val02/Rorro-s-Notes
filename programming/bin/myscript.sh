#!/bin/bash
clear
echo "Today is:"
cal 
date

#Check for IuseArchBTW.txt in user's /home
#It will offer to create one if needed

#Look for file

if [ ! -f ~/IuseArchBTW.txt ]; then
	
    echo "You have no file named IuseArchBTW"
    echo "Would you like to create one? [y/N]"
    read -n 1 -s choice
        if [ "$choice" == "y" ]; then
	    touch ~/IuseArchBTW.txt
	fi
else

    echo "Found file IuseArchBTW.txt in user $USER's home directory"
fi    		



echo "Have a nice day! :)"
exit
