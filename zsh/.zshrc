zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# prompt
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# syntax
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

autoload -U promptinit; promptinit
prompt pure
