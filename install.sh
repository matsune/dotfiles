#!/bin/bash
cd $HOME
git clone --recursive https://github.com/matsune/dotfiles.git
ln -f -s ./dotfiles/zsh/.zshrc ~/.zshrc 
ln -f -s ./dotfiles/vim/.vimrc ~/.vimrc
ln -f -s ./dotfiles/tmux/.tmux.conf ~/.tmux.conf
