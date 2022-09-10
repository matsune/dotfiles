#!/bin/bash -eu
DOTFILES="${DOTFILES:-~/.dotfiles}"

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

[ ! -d $DOTFILES ] && git clone --recursive https://github.com/matsune/dotfiles.git $DOTFILES
ask_override $DOTFILES/zsh/.zshrc ~/.zshrc

echo "source ${DOTFILES}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export DOTFILES=${DOTFILES}
" > ~/.zsh_custom

ask_override $DOTFILES/vim/.vimrc ~/.vimrc
ask_override $DOTFILES/nvim ~/.config/nvim
ask_override $DOTFILES/tmux/.tmux.conf ~/.tmux.conf
ask_override $DOTFILES/git/.gitconfig ~/.gitconfig
ask_override $DOTFILES/tig/.tigrc ~/.tigrc
