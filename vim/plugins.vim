"
" Vundle
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

source $HOME/.plugins.vim

call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" vim-airline
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" gitgutter
let g:gitgutter_async = 0

