if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi

export PS1='\[\e[01;35m\]$(__git_ps1)\[\e[01;32m\] \w \[\e[01;34m\]\$\[\e[00m\]'

export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#export LANG=C

# stop Ctrl-S
if [[ -t 0 ]]; then
    stty stop undef
    stty start undef
fi

complete -cf sudo

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

alias pbcopy='xsel --clipboard --input'

alias g++='g++ -std=c++17'

alias getDate='date +%m-%d'
alias getDateTime='date +%m-%d-%H_%M'
