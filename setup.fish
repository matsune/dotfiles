#!/usr/bin/env fish

function ensure_brew
    if not type -q brew
        echo "Error: Homebrew is not installed." >&2
        exit 1
    end

    echo "Homebrew is installed."
end

function ensure_brew_package
    # check arg
    if test (count $argv) -lt 1
        echo "Usage: ensure_brew_package <package>" >&2
        return 1
    end

    set -l package $argv[1]

    # do nothing if already installed
    if brew list --formula $package >/dev/null 2>&1
        echo "$package is already installed."
        return 0
    end

    # ask user
    read -P "Install $package with Homebrew? [Y/n] " answer

    switch $answer
        case n N no NO
            echo "Skipped: $package"
            return 0
        case '*'
            brew install $package
    end
end

function ensure_symlink
    set -l source $argv[1]
    set -l target $argv[2]

    # check source exists
    if not test -e "$source"
        echo "Error: source does not exist: $source" >&2
        return 1
    end

    if test -L "$target"; and test (readlink "$target") = "$source"
        echo "Already linked: $target"
        return 0
    end

    # skip if already exists
    if test -e "$target"; or test -L "$target"
        echo "Warning: target already exists, skipped: $target" >&2
        return 0
    end

    mkdir -p (dirname "$target")

    ln -s "$source" "$target"

    echo "Linked: $target -> $source"
end

function ensure_symlinks_in_dir
    set -l source_dir $argv[1]
    set -l target_dir $argv[2]

    test -d "$source_dir"; or return 0

    for source in $source_dir/*
        test -f "$source"; or continue
        ensure_symlink "$source" "$target_dir/"(basename "$source")
    end
end

function main
    set -l script_dir (dirname (realpath (status filename)))
    set -l fish_src $script_dir/fish
    set -l fish_dst $HOME/.config/fish

    ensure_brew

    set -l packages fd fzf ripgrep tig tmux
    for package in $packages
        ensure_brew_package $package
    end

    ensure_symlink $fish_src/config.fish $fish_dst/config.fish

    for dir in functions completions conf.d
        ensure_symlinks_in_dir $fish_src/$dir $fish_dst/$dir
    end

    ensure_symlink $script_dir/ghostty/config.ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
    ensure_symlink $script_dir/git/.gitconfig $HOME/.gitconfig
    ensure_symlink $script_dir/git/.gitignore_global $HOME/.gitignore_global
    ensure_symlink $script_dir/tig/.tigrc $HOME/.tigrc
    ensure_symlink $script_dir/tmux/.tmux.conf $HOME/.tmux.conf
    ensure_symlink $script_dir/vim/.vimrc $HOME/.vimrc
end

main
