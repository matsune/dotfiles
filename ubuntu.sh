#!/bin/sh -eu
cd ~
sudo apt-get install zsh tmux tig
chsh -s $(which zsh)
sudo wget "https://github.com/peco/peco/releases/download/v0.5.7/peco_linux_386.tar.gz"
sudo tar xzvf peco_linux_386.tar.gz
cd peco_linux_386
sudo chmod +x peco
sudo mv peco /usr/local/bin

