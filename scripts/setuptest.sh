#!/usr/bin/bash

if ! [ "$(id -u)" = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ "$SUDO_USER" ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

echo "sudo: $SUDO_USER"
echo "real: $real_user"

# update cache
#trap 'kill "$bgid"' EXIT
        apt update # &> /dev/null; jobid=$!
        printf "Package Cache Updating "
#  while :; do
#      printf ".";
#      sleep 0.5;
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"

# install dependencies
        apt install -y zsh git stow curl wget htop neofetch neovim vim # &> /dev/null
#  jobid=$!
        printf "Dependencies Installing "
#  while :; do
#      printf ".";
#      sleep 0.5;
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"

# system update
        apt full-upgrade -y # &> /dev/null
#  jobid=$!
        printf "System Upgrading "
#  while :; do
#      printf ".";
#      sleep 0.5;
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"

# clone config repo
gitclone() { cd "$HOME || return"; if [ ! -d "$HOME/dotfiles/" ]; then git clone --recurse-submodules https://github.com/zshiftonline/dotfiles &> /dev/null; else cd dotfiles || exit; fi; }
# link config files to system from repo
stowconfig() { stow zsh ohmyzsh nvim vim htop neofetch powerlevel10k; }
# remove default .zshrc; replace with repo .zshrc
checkconfig() { if [ ! -f "$HOME/.zshrc.bck" ]; then zsh; source "$HOME"/.zshrc; source "$HOME"/.p10k.zsh; else mv "$HOME"/.zshrc.bck "$HOME"/.zshrc; zsh; source "$HOME"/.zshrc; source "$HOME"/.p10k.zsh; fi; }

su - dusty47z; cd "$HOME"; if [ ! -d "$HOME"/dotfiles/ ]; then git clone --recurse-submodules https://github.com/zshiftonline/dotfiles &> /dev/null; else cd dotfiles || return; fi; stow zsh ohmyzsh nvim vim htop neofetch powerlevel10k; if [ ! -f "$HOME/.zshrc.bck" ]; then zsh; source $HOME/.zshrc; source $HOME/.p10k.zsh; else mv $HOME/.zshrc.bck $HOME/.zshrc; zsh; source $HOME/.zshrc; source $HOME/.p10k.zsh; fi;

