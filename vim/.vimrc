" setting
set fenc=utf-8
set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" appearance
set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set whichwrap=b,s,h,l,<,>,[,],~
nnoremap j gj
nnoremap k gk

" tab
set shiftwidth=2
set expandtab
set tabstop=2

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" statusline
set statusline=2
set statusline=%y\ 
set statusline+=%F
set statusline+=%=
set statusline+=[LOW=%l/%L]

set foldlevel=99

"dein Scripts-----------------------------
if &compatible
  set nocompatible 
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('scrooloose/nerdtree')
  call dein#add('justinmk/vim-dirvish')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('Shougo/vimshell')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('nazo/pt.vim')
  call dein#add('fatih/vim-go')
  call dein#add('SirVer/ultisnips')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('rust-lang/rust.vim')
  

  " Required:
  call dein#end()
  call dein#save_state()

endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=16
colorscheme solarized


" vim-go
set autowrite
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

au FileType go setlocal foldmethod=syntax

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = '~/.cargo/bin/rustfmt'
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1

