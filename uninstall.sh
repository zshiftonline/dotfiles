#!/bin/bash

# unstow config files
stow -D ohmyzsh zsh nvim vim neofetch htop
# change directory to avoid conflict
cd ..
# remove remaining linked files
rm .vimrc .zshrc .zshrc.bck
# remove remaining linked .config files
cd $HOME/.config
rm -rf gitmoodules htop neofetch nvim ohmyzsh
# remove dotfiles dir
cd $HOME
rm -rf dotfiles/
cd ~
