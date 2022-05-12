#!/bin/bash
# update cache
echo "DEBUG: apt update start"
	printf "Package Cache Updating.\t%s\n" "$(
	for (( i=1; i<=8; i++ )); do
		echo "."
  done &
    apt update &> /dev/null)"
echo "DEBUG: apt update end"
# install dependencies
echo "DEBUG: install deps start"
	printf "Installing.\t%s\n" "$(
	for (( i=1; i<=8; i++ )); do
		echo "."
  done &
    apt install -y zsh git stow curl wget htop neofetch neovim vim &> /dev/null)"
echo "DEBUG: install deps end"
# system update
echo "DEBUG: apt full-upgrade start"
	printf "Upgrading.\t%s\n" "$(
	for (( i=1; i<=8; i++ )); do
		echo "."
	done &
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
