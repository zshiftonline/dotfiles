#!/bin/bash
# unstow config files
stow -D ohmyzsh zsh nvim vim neofetch htop
# change directory to avoid conflict
cd ..
# remove dotfiles dir
rm -rf dotfiles/
