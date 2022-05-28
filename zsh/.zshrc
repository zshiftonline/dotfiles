# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:/snap/bin:/home/dusty47z/.local/usr/local/bin:$PATH
export ZSH="$HOME/.config/ohmyzsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

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
            sudo
            colored-man-pages
            debian
            systemd
        )

    fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

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
alias update='sudo apt update && sudo apt upgrade'
alias sc='apt search --names-only'
alias ac='sudo apt install'
alias inf='apt info'
alias pd='pushd'
alias pp='popd'
alias lnc='linode-cli'
alias nls='ls --no-group --time-style=iso --color=always --group-directories-first -lA'
alias gtac='git add .;git commit -m blah; git push'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias doc='doctl'
alias zero='zerotier-cli'
alias zeronet='zerotier-cli listnetworks'
alias zeropeer='zerotier-cli listpeers'
alias zerot='zerotier-cli info'
alias zerpdump='zerotier-cli dump'
