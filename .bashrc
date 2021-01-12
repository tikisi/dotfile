source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/git-prompt.sh  
GIT_PS1_SHOWDIRTYSTATE=true

#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
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

function opencmd()
{
	cmd 2>&1 | start $1
}

alias open='opencmd'
alias home='cd /c/Users/faohf/Documents'

alias aizu='ssh -Y s1260138@sshgate.u-aizu.ac.jp'
alias aidu='sftp -r s1260138@sshgate.u-aizu.ac.jp'
export DISPLAY=localhost:0.0

export GOPATH=/c/Users/faohf/msys2/go
export GOROOT=/mingw64/lib/go
alias python='/usr/bin/python'

alias tmux='rm -rf /tmp/tmux* && tmux'
alias gnuplot='winpty gnuplot'
