#!/bin/bash
# update cache
apt update
# install dependencies
apt install zsh git stow curl wget htop neofetch neovim vim
# system update
apt full-upgrade
# clone config repo
cd $HOME
if [ ! -d $HOME/dotfiles/ ]; then
    git clone --recurse-submodules https://github.com/zshiftonline/dotfiles
else   
    # cd into repo
    cd dotfiles
fi
# link config files to system from repo
stow zsh ohmyzsh nvim vim htop neofetch
# remove default .zshrc; replace with repo .zshrc
if [ ! -f $HOME/.zshrc.bck ]; then
    source $HOME/.zshrc
else
    mv $HOME/.zshrc.bck $HOME/.zshrc
    source $HOME/.zshrc
fi
