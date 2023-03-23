#!/usr/bin/env bash

server=( git zsh stow htop neovim vim bat mlocate curl wget arp-scan net-tools ranger )
workstation=( git zsh stow htop neovim vim bat mlocate curl wget arp-scan kitty ranger xinit dunst net-tools )



if [ $choice = "1" ]; then
  type="${server[@]}"
else
  type="${workstation[@]}"
fi

aptinstall() {
  echo -en "\n Sudo password required for $USER \n"
  read -s -p " Pass: " auth
  echo $auth | sudo -S su -c "apt-get update && apt-get upgrade -y && apt-get install -y $type"
}

gitclone() {
  cd $HOME
  if [ ! -d "$HOME/dotfiles/" ]; then
    git clone --recurse-submodules https://github.com/zshiftonline/dotfiles &> /dev/null
  else 
    cd dotfiles
  fi
}

stowconfig() {
  stow 
}

checkconfig() {
  if [ ! -f "$HOME/.zshrc.bck" ]; then
    zsh;
    source $HOME/.zshrc;
    source $HOME/.p10k.zsh;
  else 
    mv $HOME/.zshrc.bck $HOME/.zshrc
    zsh
    source $HOME/.zshrc
    source $HOME/.p10k.zsh
  fi
}


aptinstall && gitclone && stowconfig && checkconfig && printf "\n Configuration Complete! \n"












# update cache
#trap 'kill "$bgid"' EXIT
#	apt update # &> /dev/null; jobid=$!
#	printf "Package Cache Updating "
#  while :; do 
#      printf ".";
#      sleep 0.5; 
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"
# install dependencies
#	apt install -y zsh git stow curl wget htop neofetch neovim vim # &> /dev/null
#  jobid=$!
#	printf "Dependencies Installing "
#  while :; do 
#      printf "."; 
#      sleep 0.5; 
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"
# system update
#	apt full-upgrade -y # &> /dev/null
#  jobid=$!
#	printf "System Upgrading "
#  while :; do 
#      printf "."; 
#      sleep 0.5; 
#  done &
#  bgid=$!
#  wait "$jobid" && kill "$bgid"


