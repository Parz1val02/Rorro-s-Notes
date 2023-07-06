#!/usr/bin/sh
#Configurar teclado espanol
#setxkbmap latam &

#Configurar resolucion
#xrandr --output Virtual1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output Virtual2 --off --output Virtual3 --off --output Virtual4 --off --output Virtual5 --off --output Virtual6 --off --output Virtual7 --off --output Virtual8 --off

#Iconos
udiskie -t &
nm-applet &
volumeicon &
cbatticon -u 5 &
feh --bg-fill $(head -n 2 .config/nitrogen/bg-saved.cfg | tail -n 1 | cut -c 6-) &
#nitrogen --restore &
#picom --experimental-backends -b
