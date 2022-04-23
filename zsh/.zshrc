if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
            zsh-autosuggestions
            zsh-completions
            git
            sudo
            web-search
            copyfile
            ansible
            colored-man-pages
            debian
            ufw
            ssh-agent
            tmux
            systemd
            timer
            torrent
        )

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# aliases
alias rl='source ~/.zshrc'
alias ls='ls -lat --color=auto --group-directories-first'
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

alias overclock='flatpak run com.leinardi.gwe'

# key bindings fix
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dusty47z/.zshrc'
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

export PATH=~/.local/bin:/snap/bin:$PATH
export TERM=xterm-256color
