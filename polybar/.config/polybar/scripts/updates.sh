#!/bin/sh

updatesapt="$(sudo apt update 2> /dev/null | wc -l)"
updatesapt="$(sudo apt  2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))
echo -e " $updates"


