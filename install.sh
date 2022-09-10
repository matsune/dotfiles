#!/bin/bash -eu
DOTFILES="${DOTFILES:-$HOME/dotfiles}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

function ask_override() {
  if [ -f $2 ]; then
    if [ -L $2 ]; then
      read -p "Do you wish to override $2? [yN] " yn
      case $yn in
      [Yy]*) ;;
      *)
        echo "not override"
        return
        ;;
      esac
    fi
  fi
  echo "override: ln -f -s $1 $2"
  ln -f -s $1 $2
}

[ ! -d $DOTFILES ] && git clone --recursive git@github.com:matsune/dotfiles.git $DOTFILES
ask_override $DOTFILES/zsh/.zshrc $HOME/.zshrc

echo "source ${DOTFILES}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export DOTFILES=${DOTFILES}
" > ~/.zsh_custom

ask_override $DOTFILES/vim/.vimrc $HOME/.vimrc
mkdir -p $XDG_CONFIG_HOME/nvim
ask_override $DOTFILES/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
ask_override $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ask_override $DOTFILES/git/.gitconfig $HOME/.gitconfig
ask_override $DOTFILES/git/.gitignore_global $HOME/.gitignore_global
ask_override $DOTFILES/tig/.tigrc $HOME/.tigrc
