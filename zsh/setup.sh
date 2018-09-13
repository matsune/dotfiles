#!/bin/bash
sudo apt-get install zsh

if [ ! `echo $SHELL | grep zsh` ]; then
	echo "Default shell is not zsh."
	echo "Do you change default shell to zsh?(y/N)"
	read A
	case $A in
		y)
			chsh -s `which zsh`
			echo -e "${GREEN}Set default shell to zsh. Please relogin.${ESC}"
			;;
		*)
			;;
	esac
fi


if [ -e $HOME/.zprofile ] ; then
  echo ">>Delete old .zprofile"
  rm $HOME/.zprofile*
fi

if [ -e $HOME/.zshrc ] ; then
  echo ">>Delete old .zshrc"
  rm  $HOME/.zshrc*
fi

echo ">>Download .zprofile"
wget -O $HOME/.zprofile --no-verbose $BASE_URL/zsh/.zprofile
echo ">>Download .zshrc"
wget -O $HOME/.zshrc --no-verbose $BASE_URL/zsh/.zshrc


