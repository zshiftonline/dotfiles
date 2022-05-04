#!/bin/bash

###  Check for config files && Back them up   ###

if [ ! -d "$HOME/.config/ohmyzsh" ]; then
    mkdir -p $HOME/.config/ohmyzsh
fi


if [ -f "$file" ]; then
    mv $file $file.bak
fi

stow zsh ohmyzsh vim nvim htop neofetch

source $HOME/.zshrc

