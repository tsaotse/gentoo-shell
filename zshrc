### p50
export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
ZSH_THEME="bureau"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

###OPi5Pro
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
###
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
