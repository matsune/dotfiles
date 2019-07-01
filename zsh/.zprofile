# zsh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -U compinit; compinit
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

autoload colors
colors

export LSCOLORS=gxfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto' 

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

PROMPT="%F{cyan}%~:%F{green}%f$ %f"

export LC_ALL=en_US.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
bindkey -e 

# peco

function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

bindkey '^R' peco-history-selection
zle -N peco-history-selection

function pv () {
  if [ -z $@ ]; then
    echo "no search keyword: pv [KEYWORD]"
  else
    PT_RES=$(pt $@)
    if [ ! -z $PT_RES ]; then
      PECO_RES=$(echo $PT_RES| peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
      if [ ! -z $PECO_RES ]; then
        eval "v $PECO_RES"
      fi
    fi
  fi
}

# gvm
[[ -s ~/.gvm/scripts/gvm ]] && source ~/.gvm/scripts/gvm
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# rust
[ -f ~/.cargo/env ] && source $HOME/.cargo/env
export RUST_SRC_PATH='$(echo ~/.multirust/toolchains/*/lib/rustlib/src/rust/src)'

# nvm
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
fi

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

    
# aliases

alias tailf='tail -f'

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='ls -lF'
  alias la='ls -laF'
  alias lt='ls --tree'
fi

# neovim
export XDG_CONFIG_HOME=$HOME/.config
if [ -x "$(command -v nvim)" ]; then
	alias n='nvim'
  export EDITOR=nvim
fi

# tmux
if [ ! -e ~/.tmux/plugins ]; then
  mkdir -p .tmux/plugins
fi

if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

