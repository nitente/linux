set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set noswapfile
set number
set relativenumber
set ruler
set statusline+=%F
set shiftwidth=2
set smartindent
set smarttab
set wrap
syntax on
colorscheme white

" KEYBOARD CHANGES
" clear the search highlight with the 'Enter' key
nnoremap <CR> :noh <CR>

" C PROGRAMMING
" save, compile and execute with 'F2' key
if has("win32") || has("win64")
  au BufEnter,BufNew *.c map <F2> :w <CR> :!cls && gcc -O -Wall -W
  \ -pedentic -ansi % -lm -o %< & %< <CR>
else
  au BufEnter,BufNew *.c map <F2> :w <CR> :!clear && gcc -O -Wall -W
  \ -pedantic -ansi % -lm -o %< && ./%< <CR>
endif

" MISC
" make sure vim returns to the same line when you reopen a file
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END
