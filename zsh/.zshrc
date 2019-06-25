source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# prompt
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "sorin-ionescu/prezto"

# syntax
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"

# tools
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

if [[ -d ~/.zplug/repos/sorin-ionescu/prezto ]]; then # already installed prezto
  if [[ ! -L "${ZDOTDIR:-$HOME}/.zprezto" ]]; then # not linked to ~/.zprezto
    ln -s ~/.zplug/repos/sorin-ionescu/prezto ~/.zprezto
  fi
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  zstyle ':prezto:load' pmodule \
  'terminal' \
  'history' \
  'directory' \
  'spectrum' \
  'completion' \
  'prompt'
fi

# Then, source plugins and add commands to $PATH
zplug load

prompt powerline
