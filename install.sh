#!/bin/bash
cd $HOME
git clone --recursive git@github.com:matsune/dotfiles.git
ln -s .zshrc ./dotfiles/zsh/.zshrc
ln -s .vimrc ./dotfiles/vim/.vimrc
ln -s .tmux.conf ./dotfiles/tmux/.tmux.conf
