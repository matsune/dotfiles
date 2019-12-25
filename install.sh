#!/bin/bash
cd $HOME
git clone --recursive git@github.com:matsune/dotfiles.git
ln -s ./dotfiles/zsh/.zshrc ~/.zshrc 
ln -s ./dotfiles/vim/.vimrc ~/.vimrc
ln -s ./dotfiles/tmux/.tmux.conf ~/.tmux.conf
