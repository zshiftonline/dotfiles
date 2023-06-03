#!/usr/bin/env bash

num() { ansi --green-intense --bold  $1  ;}
tit() { ansi --cyan-intense  --bold  $1  ;}
tex() { ansi --yellow        --bold  $1  ;}
des() { ansi --white-intense         $1  ;}
err() { ansi --red-intense   --bold  $1  ;}


server=( git zsh stow htop neovim vim bat mlocate arp-scan net-tools ranger tree )
workstation=( git zsh stow htop neovim vim bat mlocate curl wget arp-scan kitty ranger xinit dunst net-tools tree )

stow_server=( git zsh nvim vim ranger ohmyzsh powerlevel10k )
stow_workstation=( git zsh nvim vim kitty ranger xinit dunst pcmanfm rofi picom polybar powerlevel10k ohmyzsh dialog i3 flameshot )

aptinstall() {
 # echo -en "\n Sudo password required for $USER \n"
 # read -s -p " Pass: " auth
 # echo $auth | sudo -S su -c "
 apt-get -q update && apt-get -q upgrade -y && apt-get -q install -y "$@"
}

input() {
workstation="git zsh stow htop neovim vim bat mlocate curl wget arp-scan net-tools ranger"
server="git zsh stow htop neovim vim bat mlocate curl wget arp-scan kitty ranger xinit dunst net-tools"

whiptail --checklist \
  "Please pick one" 10 60 5 \
  one one off two two off \
  three three off four four off five five off

echo -ne "
  $(tit "Select Which Set of Packages You Want to Install")\n
    $(num "1")) $(num "Workstation")
        $(des "${workstation[@]}")\n
    $(num "2")) $(num "Server")
        $(des "${server[@]}")\n
    $(num "0")) $(num "Exit")\n\n"
  read -n 1 -p "    $(num "Choose an option: ")" choice

  case $choice in
      1)  aptinstall ${workstation[@]} ;;
      2)  aptinstall ${server[@]}      ;;
  0)  exit 0 ;;
  *)  echo -e "\n\n      $(err "Invalid Option.")\n"; exit 0;
  esac
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
  case $choice in
      1)  stow ${stow_workstation[@]} ;;
      2)  stow ${stow_server[@]}      ;;
  *)  echo -e "\n\n      $(err "Invalid Option.")\n"; exit 0;
  esac
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


input && aptinstall && gitclone && stowconfig && checkconfig && printf "\n Configuration Complete! \n"












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


