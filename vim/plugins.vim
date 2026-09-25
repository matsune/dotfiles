"vim-plug Scripts-------------------------
if &compatible
  set nocompatible
endif

let s:plug_file = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:plug_file)
  call system('curl -fLo ' . shellescape(s:plug_file) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

let s:custom_plugins = expand('~/.vim/plugins.custom.vim')

call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/vim-lsp', { 'commit': 'bbffa60cb08a' }
Plug 'prabirshrestha/asyncomplete.vim', { 'tag': 'v2.1.0' }
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'junegunn/fzf', { 'tag': '0.46.0', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'tag': '7.1.1' }
Plug 'tomtom/tcomment_vim', { 'tag': '4.00' }
Plug 'airblade/vim-gitgutter'
Plug 'osyo-manga/vim-over'
Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }
Plug 'vim-airline/vim-airline-themes'
Plug 'blakewilliams/numetal.vim'

if filereadable(s:custom_plugins)
  execute 'source' fnameescape(s:custom_plugins)
endif

call plug#end()

" install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | source $MYVIMRC
endif
"End vim-plug Scripts---------------------

" vim-lsp
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nnoremap <buffer> <silent><C-]> <plug>(lsp-definition)
  nnoremap <buffer> <silent><C-K> <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" asyncomplete-lsp
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vim-vsnip
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" fzf.vim
nnoremap <S-o> :Files<CR>
nnoremap <S-f> :Rg<CR>
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" vim 9 issue https://github.com/preservim/nerdtree/issues/1321
let g:NERDTreeMinimalMenu=1
let g:NERDTreeNodeDelimiter = " "

" vim-gitgutter
let g:gitgutter_async = 0
highlight clear SignColumn

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
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" numetal.vim
augroup customize_colors
  au!
  autocmd ColorScheme * highlight clear CursorLine
  autocmd ColorScheme * highlight CursorLine gui=underline cterm=underline
augroup END
set termguicolors
set background=dark
silent! colorscheme numetal
