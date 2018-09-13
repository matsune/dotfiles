#!/bin/bash
sudo apt-get install vim 

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
rm ./installer.sh

if [ -e $HOME/.vimrc ] ; then
  echo ">>Delete old .vimrc"
  rm $HOME/.vimrc*
fi

echo ">>Download .vimrc"
wget -O $HOME/.vimrc --no-verbose $BASE_URL/.vimrc


