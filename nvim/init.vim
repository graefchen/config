set number
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
" setting wrap and linebreak so that wrapping does not seem random
set wrap linebreak
" activating syntax
syntax on
set mouse=a
set wildmode=longest,list

"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Using plug, not to much, I hope, keep it minimal
call plug#begin()
  " color schemes
  Plug 'huyvohcmc/atlas.vim'

  " other
  Plug 'junegunn/goyo.vim'
call plug#end()

" setting the colorscheme
set termguicolors
colorscheme sunbather
" colorscheme atlas
" setting the background to be invisible
hi Normal guibg=NONE ctermbg=NONE
