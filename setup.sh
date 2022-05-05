#!/bin/bash
# update cache
echo "DEBUG: apt update start"
apt update
echo "DEBUG: apt update end"
# install dependencies
echo "DEBUG: install deps start"
apt install zsh git stow curl wget htop neofetch neovim vim
echo "DEBUG: install deps end"
# system update
echo "DEBUG: apt full-upgrade start"
apt full-upgrade
echo "DEBUG: apt full-upgrade end"
# clone config repo
echo "DEBUG: clone dotfiles repo start"
cd $HOME
if [ ! -d $HOME/dotfiles/ ]; then
    echo "DEBUG: dotfiles dir doesnt exist"
    git clone --recurse-submodules https://github.com/zshiftonline/dotfiles
else   
    echo "DEBUG: dir exist and change dir"
    # cd into repo
    cd dotfiles
fi
echo "DEBUG: clone dotfiles repo end"
# link config files to system from repo
echo "DEBUG: stow configs start"
stow zsh ohmyzsh nvim vim htop neofetch powerlevel10k
echo "DEBUG: stow configs end"
# remove default .zshrc; replace with repo .zshrc
echo "DEBUG: remove .zshrc.bck  & replace if exist start"
if [ ! -f $HOME/.zshrc.bck ]; then
    echo "DEBUG: .zshrc.bck doesnt exist"
    source $HOME/.zshrc
    source $HOME/.p10k.zsh
else
    echo "DEBUG: .zshrc.bck exists"
    mv $HOME/.zshrc.bck $HOME/.zshrc && echo "DEBUG: .zshrc replaced"
    source $HOME/.zshrc
    source $HOME/.p10k.zsh
fi
echo "DEBUG: remove .zshrc.bck & replace if exist end"
