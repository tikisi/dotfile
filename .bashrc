export PS1='\[\e[01;35m\]$(__git_ps1)\[\e[01;32m\] \w \[\e[01;34m\]\$\[\e[00m\]'

alias ls='ls --color=auto -F'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls'
alias ks='ls'
alias sl='ls'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias pbcopy='xsel --clipboard --input'
alias clip='clip.exe'
alias open='explorer.exe'

export DISPLAY=$(ipconfig.exe | iconv -f sjis -t utf8 | grep IPv4 | tail -1 | awk '{print $NF}' | awk 'sub(/\r$/,"")'):0
