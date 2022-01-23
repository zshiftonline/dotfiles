# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export nvm completion settings for lukechilds/zsh-nvm plugin
# this must be exprted before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# source plugins
source ~/.zsh_plugins.sh

# aliases
alias ls='ls -lat --color=auto --group-directories-first'
alias vim='nvim'
alias cat='bat'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gits='git status'
alias gita='git add'
alias gitc='git clone'
alias gitp='git push -u origin main'

alias update='sudo apt update && sudo apt upgrade'
alias sc='apt search'
alias ac='sudo apt install'

# use nix
if [ -e /home/dusty47z/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dusty47z/.nix-profile/etc/profile.d/nix.sh; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dusty47z/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
