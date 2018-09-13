#!/bin/bash
sudo apt-get install tmux

if [ -e $HOME/.tmux.conf ] ; then
  echo ">>Delete old .tmux.conf"
  rm $HOME/.tmux.conf*
fi

echo ">>Download .tmux.conf"
wget -O $HOME/.tmux.conf --no-verbose $BASE_URL/tmux/.tmux.conf

