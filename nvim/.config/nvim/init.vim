filetype plugin indent on
let mapleader = " "
set ai "Auto indent
set autoindent
set background=dark
set backspace=start,eol,indent
set backupskip=/tmp/*,/private/tmp/*
set clipboard+=unnamedplus
set clipboard=unnamed
set clipboard=unnamedplus
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
set hidden
set completeopt=menuone,noinsert
set mouse=a
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'AckslD/nvim-neoclip.lua'
Plug 'arcticicestudio/nord-vim'
Plug 'avdgaag/vim-phoenix'
Plug 'elixir-lang/vim-elixir'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mhinz/vim-grepper'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'pwntester/octo.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'windwp/nvim-autopairs'
Plug 'prettier/vim-prettier'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-dispatch'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim'
Plug 'APZelos/blamer.nvim'

call plug#end()

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  colorscheme gruvbox
endif

" Description: Keymaps
nnoremap <S-C-p> "0p
" Delete without yank
" nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nmap <C-a> gg<S-v>G

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

nmap <silent> <C-l> :NvimTreeToggle<CR>
nmap <silent> <leader>ft :NvimTreeFindFile<CR>

nmap <silent> <C-j> :cn<CR>
nmap <silent> <C-k> :cp<CR>
nmap <silent> <leader>cc :cclose<CR>

tnoremap <silent> <leader><Esc> <C-\><C-n>

nmap <silent> <leader>fa :Grepper<CR>

autocmd BufWritePre *.tsx,*.ts Prettier
let g:blamer_enabled = 1

nmap <leader>gg :GitGutterPreviewHunk<CR>
