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
set vb t_vb=
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set whichwrap=b,s,h,l,<,>,[,],~
set signcolumn=yes
set belloff=all

set term=xterm-256color
syntax on

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
set backspace=indent,eol,start
set mouse=a

" keymap
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sn gt
nnoremap sp gT
nnoremap s= <C-w>=
nnoremap s] :<C-u>bn<CR>
nnoremap s[ :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap <leader>r :e!<CR>
nnoremap ` o<ESC>

au QuickfixCmdPost make,grep,grepadd,vimgrep copen

nnoremap qj  :cnext<Return>
nnoremap qk  :cprevious<Return>
nnoremap qq  :cc<Return>
nnoremap qo  :copen<Return>
nnoremap qc  :cclose<Return>

let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

xnoremap p "_dP

