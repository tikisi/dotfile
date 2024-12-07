#!/bin/bash

DOT_FILES=(.bashrc .vimrc .tmux.conf)
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/.dotfile/$file $HOME/$file
done
