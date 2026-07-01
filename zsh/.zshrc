bindkey -e

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export TERM=xterm-256color

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

PROMPT="%F{cyan}%~:%F{green}%f$ %f"

#
# aliases
#
alias ls="ls -GF"
alias la='ls -la'
alias ll='ls -l'
alias ox='open `ls | grep xcworkspace || ls | grep xcodeproj`'
alias v=vim

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='ls -lF'
  alias la='ls -laF'
  alias lt='ls --tree'
fi

if [ -x "$(command -v fzf)" ]; then
  export FZF_DEFAULT_COMMAND='find .'
  export FZF_DEFAULT_OPTS='--layout=reverse --border'

  function fzf-ghq-selection() {
    local selected_dir=$(ghq list -p | fzf --query="$LBUFFER" )
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }
  zle -N fzf-ghq-selection
  bindkey '^G' fzf-ghq-selection

  bindkey -s '^F' 'fzf --print0 | xargs -0 -o vim\n'
  bindkey '^N' fzf-cd-widget
fi

if [ -x "$(command -v docker)" ]; then
  alias up='docker compose up'
  alias down='docker compose down'
fi

#
# autocomplete
#
autoload -Uz compinit; compinit
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
# colorize 
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:warnings' format '%F{red}No matches%f: %d'
# highlight
zstyle ':completion:*:default' menu select=1
# cache
zstyle ':completion::complete:*' use-cache true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# tight space
setopt list_packed
# no beep when complete list
setopt nolistbeep
# do ls on change directory
setopt auto_cd
function chpwd() { ls }
# separator
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 
# plugins
#
source ~/.zsh_custom
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=36'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

