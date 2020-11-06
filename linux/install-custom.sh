#!/bin/bash
cp linux.vimrc ~/.vimrc
tar -Jxvf linux.vim.tar.xz -C ~/
sudo cp linux.vimrc /root/.vimrc
sudo tar -Jxvf linux.vim.tar.xz -C /root/
