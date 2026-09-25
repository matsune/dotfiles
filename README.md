# dotfiles

Personal dotfiles for macOS, managed with a fish setup script.

## Requirements

- macOS
- [Homebrew](https://brew.sh)
- [fish](https://fishshell.com)

## Recommended terminal

[Ghostty](https://ghostty.org) is recommended. Its config is included in this
repository, and `setup.fish` links it into
`~/Library/Application Support/com.mitchellh.ghostty/`. Install it with:

```fish
brew install --cask ghostty
```

After changing the config, reload it in Ghostty with `Cmd+Shift+,`.

## Setup

```fish
git clone git@github.com:matsune/dotfiles.git
cd dotfiles
./setup.fish
```

`setup.fish` offers to install the required Homebrew packages, then symlinks
the config files in this repository into your home directory.

It is safe to run more than once. Existing links are left as they are, and if a
regular file already exists at a target path it is skipped with a warning, so
nothing is overwritten.

## Machine-specific settings

Settings for a single machine go in these files. They are loaded automatically
if they exist and are not tracked in this repository.

- fish: `~/.config/fish/config.custom.fish`
- Vim plugins: `~/.vim/plugins.custom.vim` (`Plug` lines)
