#!/usr/local/bin/bash

# homebrew
export PATH=/opt/homebrew/bin:$PATH

# bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# __git_ps1
if [ -f /opt/homebrew/etc/bash_completion.d/git-prompt.sh ]; then
    . /opt/homebrew/etc/bash_completion.d/git-prompt.sh
fi

export PS1='\[\e[01;35m\]$(__git_ps1)\[\e[01;32m\] \w \[\e[01;34m\]\$\[\e[00m\]'

#export LANG=C

alias ls='ls --color=auto -F'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls'
alias s='ls'
alias ks='ls'
alias sl='ls'

alias d='cd'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

HISTSIZE=100000
HISTFILESIZE=100000

alias getDate='date +%m-%d'
alias getDateTime='date +%m-%d-%H_%M'

# go
export PATH=$HOME/go/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
#nodebrew use v22.12.0
#export NODEBREW_ROOT=/opt/homebrew/var/nodebrew

. "$HOME/.cargo/env"
