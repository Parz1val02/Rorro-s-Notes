#!/bin/bash
cars=('BMW' 'TOYOTA' 'HONDA' 'TESLA') #ARRAY
echo "${cars[@]}"
echo "${!cars[@]}"
echo "${!cars[@]}"
unset cars[3] #Remove an element from the array
echo "${cars[@]}"
cars[3]="MERCEDES"
echo "${#cars[@]}"
