#!/bin/bash -eu
cd $HOME
git clone --recursive https://github.com/matsune/dotfiles.git
ln -f -s ./dotfiles/zsh/.zshrc ~/.zshrc 
ln -f -s ./dotfiles/vim/.vimrc ~/.vimrc
ln -f -s ./dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -f -s ./dotfiles/git/.gitconfig ~/.gitconfig
ln -f -s ./dotfiles/tig/.tigrc ~/.tigrc
