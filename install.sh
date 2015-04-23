#!/usr/bin/env bash

current_dir=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )
ln -sf ${current_dir}/.vimrc ~/.vimrc
ln -sf ${current_dir}/.vimrc.bundles ~/.vimrc.bundles

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
