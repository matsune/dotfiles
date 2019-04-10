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

#PROMPT="[%m]%F{cyan}%~:%F{green}%f$ %f"
PROMPT="%F{cyan}%~:%F{green}%f$ %f"

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

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
        eval "vim $PECO_RES"
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
fi
    
# aliases

alias tailf='tail -f'

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='ls -l'
  alias la='ls -la'
  alias lt='ls --tree'
fi

if [ -x "$(command -v nvim)" ]; then
  alias v='nvim'
fi
