"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

let s:home = empty($HOME) ? expand('~') : $HOME
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:custom_toml = s:home . '/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml)
  if filereadable(s:custom_toml)
    call dein#load_toml(s:custom_toml)
  endif
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
"End dein Scripts------------------------

