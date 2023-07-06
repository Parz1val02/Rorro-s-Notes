#!/bin/bash
#Use expr 
expr 1 + 1
expr 3 + 2 
#Set variables that are equal to the result of the calculation
add=$(expr 20 + 1)
sub=$(expr 20 - 1)
mul=$(expr 20 \* 1) #Escape the * character, wildcard. This is specific to expr and some other commands
div=$(expr 20 / 1)
rem=$(expr 20 % 1)

echo "add is $add"
echo "sub is $sub"
echo "mul is $mul"
echo "div is $div"
echo "rem is $rem"

num1=50
num2=10
echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 )) #with echo it is not necessary to escape the wildcard
echo $(( num1 / num2 ))
echo $(( num1 % num2 )) 

#expr does not work with floating point numbers
#To get past this error, we must pipe our results into bc, basic calculator
echo "20.5 + 5.5" | bc
#bc truncates in division
#We could add the -l switch, but two many decimals
echo "20.5 / 5" | bc -l
#The answer is using scale
echo "scale=2;20.5 / 5" | bc -l

#Hex numbers
read -p "Enter hex number of your choice> " hex
echo -n "The decimal value of $hex is: "
echo "obase=10; ibase=16; $hex" | bc
