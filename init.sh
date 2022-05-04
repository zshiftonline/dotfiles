#!/bin/bash

###  Check for config files && Back them up   ###

DIR=( "ohmyzsh" "nvim" "htop" "neofetch" )

for val in ${DIR[@]}; do
    echo "debug; $val"
    if [ ! -d "$HOME/.config/$val" ]; then
        mkdir -p $HOME/.config/$val
        echo "debug; $val created"
    fi
done

# if [ -f "$file" ]; then
#    mv $file $file.bak
# fi

# stow zsh ohmyzsh vim nvim htop neofetch

# source $HOME/.zshrc

