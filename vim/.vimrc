let s:dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source' fnameescape(s:dir . '/rc.vim')
execute 'source' fnameescape(s:dir . '/plugins.vim')
