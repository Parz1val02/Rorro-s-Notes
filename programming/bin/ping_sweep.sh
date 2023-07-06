#!/bin/bash
#Simple ping sweep script
read -p "Please, enter a subnet> " Subnet
for ip in $(seq 1 15); do
	ping -c 1 $Subnet.$ip >/dev/null
	if [ "$?" ];
	then
		echo "$Subnet.$ip is up"	
	fi
done
