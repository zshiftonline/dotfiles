
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/snap/bin:/home/dusty47z/.local/usr/local/bin:/usr/sbin:$PATH
export ZSH="$HOME/.config/ohmyzsh"
export ZSH_CUSTOM="$HOME/.config/custom"
ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
export TERM=xterm-256color

bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char

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


# The following lines were added by compinstall

zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort links
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[.,_-]=** r:|=**' '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/dusty47z/.zshrc'

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
        )

    fpath+="${ZSH_CUSTOM:-"$HOME/.config/custom"}/plugins/zsh-completions/src"

source $ZSH/oh-my-zsh.sh
source $HOME/.config/custom/completions/linode.sh

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
alias blkid='sudo blkid'
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
<<<<<<< HEAD
alias zerpdump='zerotier-cli dump'
alias linodevpn='ssh -t erocktion@lish-atlanta.linode.com ubuntu-vpn'
alias lish='ssh erocktion@lish-atlanta.linode.com'
alias nala='sudo nala'
=======
alias zerodump='zerotier-cli dump'

fpath+=~/.zfunc

>>>>>>> 89094c4a8c66eb5486d58ecb6b5268f6fe456256
