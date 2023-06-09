#!/bin/bash
rm -rf $HOME/.vim
rm $HOME/.vimrc
unzip _vim.zip -d $HOME/
cp _vimrc $HOME/.vimrc
cp snippets/* $HOME/.vim/snippets/
