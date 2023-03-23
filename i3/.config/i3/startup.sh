#!/usr/bin/env bash

## merge .Xresources
xrdb -merge ~/.Xresources

## launch picom & set background with feh
picom -b &
feh --bg-fill ~/Pictures/debian2.png

## autostart programs
pulseeffects &
vivaldi-snapshot &
kitty &
discord-canary &

## autoconnect bluetooth headphones 
~/.config/i3/scripts/bluetooth.sh
