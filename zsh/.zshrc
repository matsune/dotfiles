export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

export GREP_OPTIONS='--color=auto' 
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/ncurses/bin:$PATH"

PROMPT="%F{cyan}%~:%F{green}%f$ %f"

# VCS
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' formats '%F{48}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{126}[%b|%a]%f'
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#
# aliases
#
alias tailf='tail -f'
alias ls="ls -GF"
alias la='ls -la'
alias ll='ls -l'
alias v='vim'
alias ox='open `ls | grep xcworkspace`'

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='ls -lF'
  alias la='ls -laF'
  alias lt='ls --tree'
fi

if [ -x "$(command -v rg)" ]; then
  alias rgf='rg --files | rg'
fi

# peco

function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

bindkey '^R' peco-history-selection
zle -N peco-history-selection

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
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=36'

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

