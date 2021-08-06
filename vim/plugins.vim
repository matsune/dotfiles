call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'osyo-manga/vim-over'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

source $HOME/.plugins.vim

call plug#end()

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" vim-over
nnoremap <leader>m :OverCommandLine<CR>%s/

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
let g:airline_section_z = '%3l:%2v %{airline#extensions#lsp#get_warning()} %{airline#extensions#lsp#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" gitgutter
let g:gitgutter_async = 0
highlight clear SignColumn

" LSP
nnoremap <silent><C-]> :LspDefinition<CR>
let g:lsp_diagnostics_echo_cursor = 1

" fzf
nnoremap <S-o> :Files<CR>
nnoremap <S-f> :Rg<CR>
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

