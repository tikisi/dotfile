source /usr/lib/git-core/git-sh-prompt
export PS1='\[\e[01;35m\]$(__git_ps1)\[\e[01;32m\] \w \[\e[01;34m\]\$\[\e[00m\]'

# stop Ctrl-S
if [[ -t 0 ]]; then
    stty stop undef
    stty start undef
fi

alias ls='ls --color=auto -F'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls'
alias ks='ls'
alias sl='ls'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias aizu='ssh -Y s1260138@sshgate.u-aizu.ac.jp'
alias aidu='sftp -r s1260138@sshgate.u-aizu.ac.jp'
alias pbcopy='xsel --clipboard --input'

alias g++='g++ -std=c++17'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tikisi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tikisi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tikisi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tikisi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

