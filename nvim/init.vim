language en_US

" Recursive Path
set path+=**

set number
" set showmatch

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smarttab

" syntax is good
syntax on

set mouse=a
set wildmode=longest,list

set notermguicolors
colors vim

let mapleader = " "

" very good for workin' in this file
map <leader>o :update<CR> :source<CR>
map <leader>w :write<CR>
map <leader>q :quit<CR>
map <leader>n :Ntree<CR>

" suppress intro
set shortmess+=I

highlight ColorColumn ctermbg=Black
