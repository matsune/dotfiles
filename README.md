# dotfiles
## Prerequisites
- zsh
- vim (>= 8)
- tmux (>= 2.4)
- peco


for Terminal app
- [Nerd Fonts](https://www.nerdfonts.com/)

## Setup
```sh
curl -s https://raw.githubusercontent.com/matsune/dotfiles/master/install.sh | sh
```

## Optional
`~/.plugins.vim` and `.custom.vim` will also be loaded

```sh
~:$ cat .plugins.vim
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'fatih/vim-go'

~:$ cat .custom.vim
" LSP
nnoremap <silent><C-]> :LspDefinition<CR>

"" golang
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

"" rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
```
