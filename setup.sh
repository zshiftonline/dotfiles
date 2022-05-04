#!/bin/bash
# update cache
apt update
# install dependencies
apt install zsh git stow curl wget htop neofetch neovim vim
# system update
apt full-upgrade
# clone config repo
git clone --recurse-submodules https://github.com/zshiftonline/dotfiles
# cd into repo
cd dotfiles
# link config files to system from repo
stow zsh ohmyzsh nvim vim htop neofetch
# remove default .zshrc; replace with repo .zshrc
if [ -f $HOME/.zshrc ]; then
    mv $HOME/.zshrc.bck $HOME/.zshrc
fi
# source newly created shell config
source ~/.zshrc
