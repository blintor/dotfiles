"  _ ____   _(_)_ __ ___
" | '_ \ \ / / | '_ ` _ \
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
"
"  @Author Orosz Balint

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'kyazdani42/nvim-tree.lua'
Plug 'arcticicestudio/nord-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'unblevable/quick-scope'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rescript-lang/vim-rescript'

Plug 'hoob3rt/lualine.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
set clipboard+=unnamedplus

colorscheme nord

set completeopt=menuone,noselect
set encoding=utf-8
set fileencoding=utf-8
let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"lua require('lspconfig').tsserver.setup{ on_attach=require'completion'.on_attach }
"lua require('lspconfig').pyright.setup{ on_attach=require'completion'.on_attach }
"lua require('lspconfig').elixirls.setup{ on_attach=require'completion'.on_attach, cmd={"/home/blntrsz/.local/bin/elixir-ls/language_server.sh"} }

"----
" git
"----
nmap <Leader>gs :G<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gh :diffget //2
nmap <Leader>gl :diffget //3

nmap <C-a-l> <cmd>NvimTreeToggle<cr>

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
