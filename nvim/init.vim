set number
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
" activating syntax
syntax on
set mouse=a
set wildmode=longest,list
" setting the colorscheme
set termguicolors
" let ayucolor="dark"
" colorscheme ayu
colorscheme atlas
" setting the background to be invisible
hi Normal guibg=NONE ctermbg=NONE
" enable Autocorrect
augroup ILoveCorrections
	autocmd!
	autocmd BufEnter * EnableAutocorrect
augroup END
" enable writegooder
augroup WriteGooder
	autocmd!
	" enable writegooder for everything
	" autocmd BufEnter * WritegooderEnable
	" enabling writegooder only for non data and programming files
	autocmd FileType markdown,tex,text WritegooderEnable
augroup END
