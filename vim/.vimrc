source $DOTFILES/vim/rc.vim
source $DOTFILES/vim/plugins.vim
if filereadable(expand('$HOME/custom.vim')) 
  source $HOME/custom.vim
endif
