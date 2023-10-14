
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/hgiasac/.zshrc'e

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# pure prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# nvm
source /usr/share/nvm/init-nvm.sh
