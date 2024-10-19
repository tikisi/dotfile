#!/bin/bash

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    . /usr/lib/git-core/git-sh-prompt
fi

export PS1='\[\e[01;35m\]$(__git_ps1)\[\e[01;32m\] \w \[\e[01;34m\]\$\[\e[00m\]'

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

alias getDate='date +%m-%d'
alias getDateTime='date +%m-%d-%H_%M'

# rmコマンドを置き換える関数
function safe_rm() {
    # ゴミ箱ディレクトリ
    TRASH_DIR="$HOME/.trash"

    # サイズ制限（500MB）
    SIZE_LIMIT=$((500 * 1024 * 1024))  # バイト単位

    # オプションを解析
    FORCE=false
    RECURSIVE=false
    FILES=()

    # オプションの解析
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -f)
                FORCE=true
                shift
                ;;
            -r)
                RECURSIVE=true
                shift
                ;;
            --)
                shift
                break
                ;;
            -*)
				# 複数オプションが一緒に指定された場合に対応
                if [[ "$1" == *f* ]]; then
                    FORCE=true
                fi
                if [[ "$1" == *r* ]]; then
                    RECURSIVE=true
                fi
                shift
                ;;
            *)
                FILES+=("$1")
                shift
                ;;
        esac
    done

    # 引数がない場合はエラーメッセージを表示
    if [ ${#FILES[@]} -eq 0 ]; then
        echo "Usage: rm [-r] [-f] [file...]"
        return 1
    fi

    # 各ファイル/ディレクトリをチェック
    for file in "${FILES[@]}"; do
        # ファイルやディレクトリが存在するか確認
        if [ ! -e "$file" ]; then
            echo "Error: '$file' does not exist."
            continue
        fi

        # ディレクトリの場合
        if [ -d "$file" ]; then
            if [ "$RECURSIVE" = true ]; then
                # ディレクトリのサイズを取得（バイト単位）
                DIR_SIZE=$(du -sb "$file" | cut -f1)

                # 確認プロンプト（-fオプションがない場合）
                if [ "$FORCE" = false ]; then
                    read -p "Are you sure you want to delete the directory '$file'? [y/N] " confirm
                    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
                        echo "Skipped '$file'."
                        continue
                    fi
                fi

                # ディレクトリが500MBを超える場合は完全に削除
                if [ "$DIR_SIZE" -gt "$SIZE_LIMIT" ]; then
                    #echo "Directory '$file' is larger than 500MB, deleting permanently."
                    /bin/rm -r "$file"
                else
                    # 500MB以下ならゴミ箱に移動
                    #echo "Directory '$file' is smaller than 500MB, moving to trash."
                    mv "$file" "$TRASH_DIR"
                fi
            else
                echo "Cannot remove '$file': Is a directory. Use -r option to delete directories."
            fi
        else
            # ファイルの場合
            FILE_SIZE=$(stat --format="%s" "$file")

            # 確認プロンプト（-fオプションがない場合）
            if [ "$FORCE" = false ]; then
                read -p "Are you sure you want to delete '$file'? [y/N] " confirm
                if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
                    echo "Skipped '$file'."
                    continue
                fi
            fi

            # ファイルが500MBを超える場合は完全に削除
            if [ "$FILE_SIZE" -gt "$SIZE_LIMIT" ]; then
                #echo "File '$file' is larger than 500MB, deleting permanently."
                /bin/rm "$file"
            else
                # 500MB以下ならゴミ箱に移動
                #echo "File '$file' is smaller than 500MB, moving to trash."
                mv "$file" "$TRASH_DIR"
            fi
        fi
    done
}

# rmコマンドのエイリアスをsafe_rmにする
alias rm='safe_rm'

