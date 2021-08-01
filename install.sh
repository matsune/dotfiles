#!/bin/bash -eu

function ask_override() {
  if [ -f $2 ]; then
    if [ -L $2 ]; then
      read -p "Do you wish to override $2? [yN] " yn
      case $yn in
          [Yy]* ) ;; 
          * ) return;;
      esac
    fi
  fi
  echo "ln -f -s $1 $2" 
  ln -f -s $1 $2
}

cd $HOME
[ ! -d "dotfiles" ] && git clone --recursive https://github.com/matsune/dotfiles.git
ask_override ./dotfiles/zsh/.zshrc ~/.zshrc 
ask_override ./dotfiles/vim/.vimrc ~/.vimrc
ask_override ./dotfiles/tmux/.tmux.conf ~/.tmux.conf
ask_override ./dotfiles/git/.gitconfig ~/.gitconfig
ask_override ./dotfiles/tig/.tigrc ~/.tigrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
