#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession &

xset +fp /home/dusty47z/.local/share/fonts
xset fp rehash


exec i3 > ~/.i3.log 2>&1
