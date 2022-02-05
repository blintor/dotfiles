call plug#begin()
Plug 'nvim-lua/plenary.nvim' " dependency for telescope
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder
Plug 'shaunsingh/nord.nvim' " nord color theme
Plug 'tpope/vim-commentary' " commenting
Plug 'neovim/nvim-lspconfig' " bare necessity for lsp
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter for syntax highlight
Plug 'tpope/vim-fugitive' " git interface for vim
Plug 'tpope/vim-surround' " bindings for changing the surronding, e.g. cs\"' replace \" -> '
Plug 'airblade/vim-gitgutter' " git diff markers
Plug 'mattn/emmet-vim' " emmet for vim
Plug 'nathanaelkane/vim-indent-guides' " indentation guides, the visual lines on indentations
Plug 'tpope/vim-sensible' " sensible defaults for vim
Plug 'williamboman/nvim-lsp-installer' " install lsp servers
Plug 'sbdchd/neoformat' " formatter
call plug#end()

colorscheme nord
