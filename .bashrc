if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
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

alias open='explorer.exe'
alias pbcopy='iconv -f utf8 -t sjis | clip.exe'

export DISPLAY=$(ipconfig.exe | iconv -f sjis -t utf8 | grep IPv4 | tail -1 | awk '{print $NF}' | awk 'sub(/\r$/,"")'):0

alias getDate='date +%m-%d'
alias getDateTime='date +%m-%d-%H_%M'
