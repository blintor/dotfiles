"----------------
" setting for vim
"----------------
set nocompatible

"-------------------------
" turn plugins on filetype
"-------------------------
filetype plugin on

"------------------------------------------
" set color highlight for the 120th column 
"------------------------------------------
highlight ColorColumn ctermbg=0 guibg=lightgrey
set colorcolumn=120

"-------------------------
" set leaderkey to <space>
"-------------------------
let mapleader = " "

"-----------------------
" set background to dark
"-----------------------
set bg=dark

"-----------------------------------
" set clipboard to system clipboard 
"-----------------------------------
set clipboard+=unnamedplus

"----------------------
" set encoding to utf-8
"----------------------
set encoding=UTF-8
set encoding=utf-8

"-----------------------------
" set tab width to 4 spaces
" set shifting (>) to 4 spaces
" replace tab with 4 spaces
"-----------------------------
set tabstop=2
set shiftwidth=2
set expandtab

"--------------------------------------------
" set search to ignorecase if none is present
"--------------------------------------------
set ignorecase
set smartcase

"--------------
" turn mouse on
"--------------
set mouse=a

"----------------------------
" turn off swap file creation
"----------------------------
set nobackup

"----------------------------------
" turn off highlight when searching
"----------------------------------
set nohlsearch

"---------------------------------
" set number and relativenumber on
"---------------------------------
set number
set relativenumber

"-----------------------------------------------------
" set spelllang to hungarian and turn spellchechin ogg
"-----------------------------------------------------
set spelllang=hu
set nospell

"--------------
" set splitting
"--------------
set splitbelow splitright

"---------------------------------------
" move viminfo generation to nvim folder
"---------------------------------------
set viminfo='50,<1000,s100,:0,n~/.config/nvim/viminfo

"---------------------------
" turn color highlighting on
"---------------------------
syntax on " color hl on

"--------------------------
" vertical highlighted line
"--------------------------
verbose set cursorline

"------------
" true colors
"------------
set termguicolors

set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
