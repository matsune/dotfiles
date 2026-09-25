set fish_greeting

if type -q brew
    fish_add_path (brew --prefix)/bin
end

set -l custom_config "$HOME/.config/fish/config.custom.fish"
if test -f "$custom_config"
    source "$custom_config"
end

bind \cg cproj

alias v='vim'
alias t='tig'
