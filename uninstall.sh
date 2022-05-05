#!/bin/bash

# unstow config files
stow -D ohmyzsh zsh nvim vim neofetch htop powerlevel10k
# change directory to avoid conflict
cd $HOME
# remove remaining linked files
rm .vimrc .zshrc .zshrc.bck .p10k.zsh
# remove remaining linked .config files
cd $HOME/.config
rm -rf gitmoodules htop neofetch nvim ohmyzsh
# remove dotfiles dir
cd $HOME
rm -rf dotfiles/
cd ~
