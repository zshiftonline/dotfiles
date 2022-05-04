#!/bin/bash

###  Check for config files && Back them up   ###

declare -a \
    DIR=("ohmyzsh" "nvim" "htop" "neofetch")

for val in ${DIR[@]}; do
    if [ ! -d "$HOME/.config/ohmyzsh" ]; then
        mkdir -p $HOME/.config/ohmyzsh
    fi
done

if [ -f "$file" ]; then
    mv $file $file.bak
fi

stow zsh ohmyzsh vim nvim htop neofetch

source $HOME/.zshrc

