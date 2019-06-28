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

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi


ZDOTDIR="${ZPLUG_REPOS}/sorin-ionescu/prezto"
if [[ -d "${ZDOTDIR}" ]]; then # already installed prezto
  if [[ ! -L ~/.zprezto ]]; then # not linked to ~/.zprezto
    ln -s "${ZDOTDIR}" ~/.zprezto
  fi
fi

if [[ -s "${ZDOTDIR}/init.zsh" ]]; then
  source "${ZDOTDIR}/init.zsh"
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

prompt agnoster

source ~/.zlogin
