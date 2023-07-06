#!/bin/bash
echo "Welcome to Los pollos hermanos"
echo "Please choose your meal> "
meals="Burger Fries Chicken"
select option in $meals; do
	echo "The selected option is $REPLY"
	echo "The selected meal is $option"
done
