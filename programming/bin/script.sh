#!/bin/bash
myTerm="alacritty"
$myTerm -e "htop" &
firefox &
sleep 3
thunar
