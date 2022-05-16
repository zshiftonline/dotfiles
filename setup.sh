#!/bin/bash
# update cache
trap 'kill "$bgid"' EXIT
echo "DEBUG: apt update start"
  apt update &> /dev/null
  jobid=$!; printf "Package Cache Updating"
  while :; do printf "."; sleep 0.2; done & bgid=$!; wait "$jobid" && kill "$bgid"
echo \n"DEBUG: apt update end"
# install dependencies
echo "DEBUG: install deps start"
  apt install -y zsh git stow curl wget htop neofetch neovim vim &> /dev/null 
  jobid=$!; printf "Dependencies Installing"
  while :; do printf "."; sleep 0.2; done & bgid=$!; wait "$jobid" && kill "$bgid"
echo \n"DEBUG: install deps end"
# system update
echo "DEBUG: apt full-upgrade start"
	apt full-upgrade -y &> /dev/null
  jobid=$!; printf "System Upgrading"
  while :; do printf "."; sleep 0.2; done & bgid=$!; wait "$jobid" && kill "$bgid"
echo \n"DEBUG: apt full-upgrade end"
# clone config repo
echo "DEBUG: clone dotfiles repo start"
	cd $HOME
	if [ ! -d $HOME/dotfiles/ ]; then
	    echo "DEBUG: dotfiles dir doesnt exist"
	    git clone --recurse-submodules https://github.com/zshiftonline/dotfiles &> /dev/null
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
      exec zsh
      source $HOME/.zshrc
	    source $HOME/.p10k.zsh
	else
	    echo "DEBUG: .zshrc.bck exists"
	    mv $HOME/.zshrc.bck $HOME/.zshrc && echo "DEBUG: .zshrc replaced"
      exec zsh
	    source $HOME/.zshrc
	    source $HOME/.p10k.zsh
	fi
echo "DEBUG: remove .zshrc.bck & replace if exist end"
