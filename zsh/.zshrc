# 補完機能
autoload -U compinit; compinit

PROMPT="[%m]%F{cyan}%~:%F{green}%f$ %f"

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export LD_LIBRARY_PATH="/usr/local/libevent-2.1.8-stable/lib:$LD_LIBRARY_PATH"
export PATH=$PATH:/usr/local/tmux-2.3/bin

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
