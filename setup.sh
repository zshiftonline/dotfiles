#!/bin/bash
# update cache
trap 'kill "$bgid"' EXIT
echo "DEBUG: apt update start"
  apt update &> /dev/null &
  jobid=$!; while ;; do printf "."; sleep 0.2; done &; bgid=$!; wait "$jobid" && kill "$bgid"
echo "DEBUG: apt update end"
# install dependencies
echo "DEBUG: install deps start"
	printf "%s" "Dependencies Installing.$(
	for (( i=1; i<=8; i++ )); do
		echo "."
    sleep 0.5
  done;
    apt install -y zsh git stow curl wget htop neofetch neovim vim &> /dev/null)"
echo "DEBUG: install deps end"
# system update
echo "DEBUG: apt full-upgrade start"
	printf "%s" "System Upgrading.$(
	for (( i=1; i<=8; i++ )); do
		echo "."
    sleep 0.5
	done;
	apt full-upgrade -y &> /dev/null)"
echo "DEBUG: apt full-upgrade end"
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
	    source $HOME/.zshrc
	    source $HOME/.p10k.zsh
	else
	    echo "DEBUG: .zshrc.bck exists"
	    mv $HOME/.zshrc.bck $HOME/.zshrc && echo "DEBUG: .zshrc replaced"
	    source $HOME/.zshrc
	    source $HOME/.p10k.zsh
	fi
echo "DEBUG: remove .zshrc.bck & replace if exist end"
