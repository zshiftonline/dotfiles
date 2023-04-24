
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LESS="--mouse --wheel-lines=2 -RiXj5"
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/snap/bin:/home/dusty47z/.local/usr/local/bin:/usr/sbin:$PATH
export ZSH="$HOME/.config/ohmyzsh"
export ZSH_CUSTOM="$HOME/.config/custom"
export ZSH_COMPLETION="${ZSH_CUSTOM}/completions"
export ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
export TERM=xterm-256color

bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history
bindkey "^[[3~" delete-char

setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dusty47z/Programs/googlecli/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dusty47z/Programs/googlecli/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/dusty47z/Programs/googlecli/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dusty47z/Programs/googlecli/google-cloud-sdk/completion.zsh.inc'; fi
alias router='ssh 10.98.1.1 -i /home/dusty47z/.ssh/id_local'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH_COMPLETION/


# The following lines were added by compinstall

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _approximate
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB to scroll. Matches: %l%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' '+r:|[._-]=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' old-list always
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p. Matches: %l%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
# zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'style :compinstall filename '/home/dusty47z/.zshrc'

zstyle ':completion:*:*:arplocal:*:descriptions' format '%B%F{yellow}%d%f%b'
zstyle ':completion:*:*:arplocal:argument-rest:*' format '%F{blue}%d%f'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# load and init bash completion backwards compatibility library
autoload -U +X bashcompinit
bashcompinit

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="%F{green}loading...%f"

# Uncomment the following line if you want to disable marking untracked files
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_COMPDUMP="$HOME/.zcompdump"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
            zsh-autosuggestions
            alias-finder
            zsh-syntax-highlighting
            git
            git-auto-fetch
            gitfast
            github
            gitignore
            git-prompt
            sudo
            colored-man-pages
            debian
            systemd
            command-not-found
            common-aliases
            copybuffer
            copyfile
            zsh-bash-completions-fallback colorize)

    fpath+="${ZSH_CUSTOM:-"$HOME/.config/custom"}/plugins/zsh-completions/src"
    fpath+="${ZSH_COMPLETION}"

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export nvim_plugdir="$HOME/dotfiles/nvim/.config/nvim/plugged"
export QT_QPA_PLATFORMTHEME=gtk2
export XDG_CONFIG_HOME="$HOME/.config"

# aliases
alias rl='source ~/.zshrc'
alias ll='ls -phlAt --color=auto --group-directories-first'
alias ls='ls -XpA --group-directories-first --color=auto'
alias vim='nvim'
alias cat='batcat'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsblk='lsblk -o name,size,mountpoint,type -e 7'
alias gits='git status'
alias gita='git add'
alias gitc='git clone'
alias gitp='git push -u origin main'
alias sc='apt search --names-only'
alias ac='sudo apt install'
alias inf='apt info'
alias pd='pushd'
alias pp='popd'
alias lnc='linode-cli'
alias nls='ls --no-group --time-style=iso --color=always --group-directories-first -lA'
alias fierce='python3 /mnt/c/Users/zshif/fierce/fierce/fierce.py'
alias gtac='git add .;git commit -m blah; git push'
alias doc='doctl'
alias zero='zerotier-cli'
alias zeronet='zerotier-cli listnetworks'
alias zeropeer='zerotier-cli listpeers'
alias zerot='zerotier-cli info'
alias zerpdump='zerotier-cli dump'
alias linodevpn='ssh -t erocktion@lish-atlanta.linode.com ubuntu-vpn'
alias lish='ssh erocktion@lish-atlanta.linode.com'
alias listcmds='(alias | cut -f1 -d= ; hash -f; hash -v | cut -f 1 -d= ; typeset +f) | sort'
alias vimssh='sudo vim /etc/ssh/ssh_config'
alias vimsshd='sudo vim /etc/ssh/sshd_config'
alias vimzsh='vim ~/.zshrc'
alias stls='sudo systemctl start'
alias stlp='sudo systemctl stop'
alias stlr='sudo systemctl restart'
alias stlt='sudo systemctl status'
alias stle='sudo systemctl enable'
alias stld='sudo systemctl disable'
alias stlrl='sudo systemctl daemon-reload'
alias nala='sudo nala'
alias htop='sudo htop'
alias blkid='sudo blkid'
alias xev='$HOME/scripts/xev.sh'
alias arp-scan='sudo arp-scan'
alias systemctl='sudo systemctl'
alias webupdate='ssh webserver 'bash -s' < $HOME/scripts/gitpull.sh'
# Lines configured by zsh-newuser-install^[[5~
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=50000
setopt autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

. "/home/dusty47z/.acme.sh/acme.sh.env"
