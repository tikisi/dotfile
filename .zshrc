# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)

if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
        zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi

if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
        source ${HOME}/.zsh/git-prompt.sh
fi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='%F{magenta}$(__git_ps1 " (%s)")%f%F{green}%~%f %F{cyan}$%f '

alias ls='ls -FG'
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
export DISPLAY=localhost:0.0

