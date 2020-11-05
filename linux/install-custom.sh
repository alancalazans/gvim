#!/bin/bash
cp linux.vimrc $HOME/.vimrc
tar -Jxvf linux.vim.tar.xz -C $HOME/
sudo cp linux.vimrc /root/.vimrc
sudo tar -Jxvf linux.vim.tar.xz -C /root/
