#!/bin/bash

DOT_FILES=(.bashrc .vimrc .tmux.conf)
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/.dotfile/$file $HOME/$file
done

mkdir -p $HOME/.config/alacritty/
ln -s $HOME/.dotfile/alacritty.toml $HOME/.config/alacritty/alacritty.toml

mkdir -p $HOME/.config/ghostty/
ln -s $HOME/.dotfile/ghostty.config $HOME/.config/ghostty/config

mkdir -p $HOME/.config/nvim/
ln -s $HOME/.dotfile/nvim.init.lua $HOME/.config/nvim/init.lua
