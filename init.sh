#!/bin/bash

###  Check for config files && Back them up   ###

echo "debug: home/$HOME"

DIR=( "ohmyzsh" "nvim" "htop" "neofetch" )
for i in "${DIR[@]}"; do
    echo "debug; $i"
    if [ '!' -d "$HOME/.config/$i" ]; then
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

