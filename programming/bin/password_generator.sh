#!/bin/bash
#Simple password generator
echo "This is a simple password generator"
read -p "Enter the length for your password> " Length

for p in $(seq 1 5); do
	 openssl rand -base64 48 | cut -c1-$Length
done
