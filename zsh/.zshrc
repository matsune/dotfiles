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

#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS=gxfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto' 

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

PROMPT="%F{cyan}%~:%F{green}%f$ %f"

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

# vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# peco

function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

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
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  # for brew
  . "$(brew --prefix nvm)/nvm.sh"
fi

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

    
# aliases

alias tailf='tail -f'

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='ls -lF'
  alias la='ls -laF'
  alias lt='ls --tree'
fi


# vim
export XDG_CONFIG_HOME=$HOME/.config
if [ -x "$(command -v nvim)" ]; then
	alias v='nvim'
fi

# tmux
if [ ! -e ~/.tmux/plugins ]; then
  mkdir -p .tmux/plugins
fi

if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

