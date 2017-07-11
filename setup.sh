#!/bin/zsh

BASE_URL='https://raw.github.com/matsune/dotfiles/master'
DELETE_FILE='';

echo -e "\n \e[38;05;228m[${0##*/}] Excecuting fetch scripts..."

#-------------------------------------
#                zsh
#-------------------------------------
echo -e "\e[38;05;147m---------------->>> fetch zsh setting"
echo -e " .zprofile"
echo -e " .zshrc"

if [ -e /home/`whoami`/.zprofile ] ; then
  DELETE_FILE=$DELETE_FILE"delete old .zprofile\n"
  rm  /home/`whoami`/.zprofile*
fi

if [ -e /home/`whoami`/.zshrc ] ; then
  DELETE_FILE=$DELETE_FILE"delete old .zshrc\n"
  rm  /home/`whoami`/.zshrc*
fi

echo -e -n "\e[38;05;244m"
wget --no-verbose $BASE_URL/.zprofile
wget --no-verbose $BASE_URL/.zshrc

#-------------------------------------
#                vim
#-------------------------------------
echo -e "\n\e[38;05;147m---------------->>> fetch vim setting"
echo -e ".vimrc"

if [ -e /home/`whoami`/.vimrc ] ; then
  DELETE_FILE=$DELETE_FILE"delete old .vimrc\n"
  rm  /home/`whoami`/.vimrc*
fi

echo -e -n "\e[38;05;244m"
wget --no-verbose $BASE_URL/.vimrc

#-------------------------------------
#                tmux
#-------------------------------------
echo -e "\n\e[38;05;147m---------------->>> fetch tmux setting"
echo -e ".tmux.conf"

if [ -e /home/`whoami`/.tmux.conf ] ; then
  DELETE_FILE=$DELETE_FILE"delete old .tmux.conf\n"
  rm  /home/`whoami`/.tmux.conf*
fi

echo -e -n "\e[38;05;244m"
wget --no-verbose $BASE_URL/.tmux.conf

