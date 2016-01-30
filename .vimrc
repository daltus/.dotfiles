
scriptencoding utf-8
set encoding=utf-8

set nocompatible

set backspace=indent,eol,start

set number
set ruler
set showcmd
set cursorline
set showmatch

set textwidth=79
set formatoptions+=t
set colorcolumn=80

syntax on
syntax enable

set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

set list listchars=tab:\|\_,trail:·,extends:>,precedes:<,nbsp:*

set hlsearch
set incsearch

filetype indent on

set wildmenu

set lazyredraw

set laststatus=2
" set statusline=%4(%m%)\ %f\ %y\ %{'['.&ff.'\ '.(&fenc==''?&enc:&fenc).']'}\ %r\ %=\Line\ %-4l\ \Col\ %-4c\ [%L\ lines]
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Vertical split creates a split to the right by default
set splitright

" Split creates a split below by default
set splitbelow

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

try
    colorscheme solarized
catch
endtry

set background=dark


" set filetype for arduino code files to be c++
" https://medium.com/@jayfajardo/setting-up-vim-for-arduino-66a90706b5ec
au BufRead,BufNewFile *.ino,*.pde set filetype=c++
