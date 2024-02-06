#!/bin/bash -eu
DOTFILES="${DOTFILES:-$HOME/dotfiles}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
ZSH_CUSTOM_FILE="$HOME/.zsh_custom"

if [ -z "${DOTFILES}" ]; then
    echo "DOTFILES env var is not set."
    exit 1
fi

AUTO_SUGGESTIONS_LINE="source \${DOTFILES}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
DOTFILES_LINE="export DOTFILES=${DOTFILES}"

if [ -f "${ZSH_CUSTOM_FILE}" ]; then
  # if already zsh_custom exists
  if ! grep -q "export DOTFILES=" "${ZSH_CUSTOM_FILE}"; then
    echo "${DOTFILES_LINE}" >> "${ZSH_CUSTOM_FILE}"
  else
    # DOTFILES行がある場合、内容を更新
    sed -i '' "s|export DOTFILES=.*|${DOTFILES_LINE}|g" "${ZSH_CUSTOM_FILE}"
  fi

  if ! grep -q "source .*/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" "${ZSH_CUSTOM_FILE}"; then
    echo "${AUTO_SUGGESTIONS_LINE}" >> "${ZSH_CUSTOM_FILE}"
  else
    sed -i '' "s|source .*/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh|${AUTO_SUGGESTIONS_LINE}|g" "${ZSH_CUSTOM_FILE}"
  fi
else
  echo "${AUTO_SUGGESTIONS_LINE}" > "${ZSH_CUSTOM_FILE}"
  echo "${DOTFILES_LINE}" >> "${ZSH_CUSTOM_FILE}"
fi


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
ask_override $DOTFILES/vim/.vimrc $HOME/.vimrc
ask_override $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
ask_override $DOTFILES/git/.gitconfig $HOME/.gitconfig
ask_override $DOTFILES/git/.gitignore_global $HOME/.gitignore_global
ask_override $DOTFILES/tig/.tigrc $HOME/.tigrc
