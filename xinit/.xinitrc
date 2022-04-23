#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession &

xset +fp /home/dusty47z/.local/share/fonts
xset fp rehash

## vscode auth fix ##
# see https://unix.stackexchange.com/a/295652/332452
#source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
#eval $(/usr/bin/gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
#mkdir -p "$HOME"/.local/share/keyrings
####
# init keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export keyring
export SSH_AUTH_SOCK
## end vscode auth fix ##

exec dbus-launch i3 > ~/.i3.log 2>&1
