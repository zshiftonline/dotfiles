#!/bin/bash

###  Check for config files && Back them up   ###

DIR=( "ohmyzsh" "nvim" "htop" "neofetch" )
for i in "${DIR[@]}"; do
    if [ ! "$HOME/.config/$i" ]; then
        mkdir -p $HOME/.config/$i
        echo "debug; $i created"
    else
        echo "debug: $i not created"
    fi
done

# if [ -f "$file" ]; then
#    mv $file $file.bak
# fi

# stow zsh ohmyzsh vim nvim htop neofetch

# source $HOME/.zshrc

