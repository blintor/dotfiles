filetype plugin indent on
let mapleader = " "
set ai "Auto indent
set autoindent
set background=dark
set backspace=start,eol,indent
set backupskip=/tmp/*,/private/tmp/*
set clipboard+=unnamedplus
set cmdheight=1
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,euc-jp,latin
set formatoptions+=r
set hlsearch
set ignorecase
set inccommand=split
set laststatus=2
set lazyredraw
set nobackup
set nocompatible
set nosc noru nosm
set nowrap "No Wrap lines
set number
set relativenumber
set path+=**
set scrolloff=10
set shell=zsh
set shiftwidth=2
set showcmd
set si "Smart indent
set smarttab
set tabstop=2
set title
set wildignore+=*/node_modules/*
set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-grepper'
Plug 'folke/todo-comments.nvim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lewis6991/gitsigns.nvim'
Plug 'pwntester/octo.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'vim-test/vim-test'
Plug 'folke/lsp-colors.nvim'

call plug#end()

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  colorscheme nord
endif
