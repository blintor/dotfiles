" plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'elixir-lang/vim-elixir'
Plug 'evanleck/vim-svelte'

"--------------------------------------------
" Use git commands inside vim
" https://vimawesome.com/plugin/vim-gitgutter
"--------------------------------------------
Plug 'airblade/vim-gitgutter'

"------------------------------------------------------------
" Css color highlight in vim
" https://vimawesome.com/plugin/vim-css-color-the-story-of-us
"------------------------------------------------------------
Plug 'ap/vim-css-color'

"---------------------------------------
" Nord colorscheme
" https://vimawesome.com/plugin/nord-vim
"---------------------------------------
Plug 'arcticicestudio/nord-vim'

"-----------------------------------------------
" Rest client for vim (curl)
" https://vimawesome.com/plugin/vim-rest-console
"-----------------------------------------------
Plug 'diepm/vim-rest-console'

"----------------------------------------------------
" Run your test inside vim
" https://vimawesome.com/plugin/vim-test-all-too-well
"----------------------------------------------------
Plug 'janko-m/vim-test'

"---------------------------------------------------
" Insert or delete brackets, parens, quotes in pair.
" https://vimawesome.com/plugin/auto-pairs
"---------------------------------------------------
Plug 'jiangmiao/auto-pairs'

"--------------------------------------
" Fuzzy finder
" https://vimawesome.com/plugin/fzf-vim
"--------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"---------------------------------------------
" Javascript and typescript syntax highlight
" https://vimawesome.com/plugin/vim-javascript
" https://vimawesome.com/plugin/typescript-vim
"---------------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

"-------------------------------------
" git commit browser
" https://vimawesome.com/plugin/gv-vim
"-------------------------------------
Plug 'junegunn/gv.vim'

"----------------------------------------
" Emmet works with <c-y>,
" https://vimawesome.com/plugin/emmet-vim
"----------------------------------------
Plug 'mattn/emmet-vim'

"---------------------------------------
" Intellisense for vim
" https://vimawesome.com/plugin/coc-nvim
"---------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"------------------------------------------------
" Json with comment syntax
" https://vimawesome.com/plugin/jsonc-vim-is-holy
"------------------------------------------------
Plug 'neoclide/jsonc.vim',

"-------------------------------------------------
" TSX support
" https://vimawesome.com/plugin/vim-jsx-typescript
"-------------------------------------------------
Plug 'peitalin/vim-jsx-typescript'

"-------------------------------------------
" VimFiler file browser tree
" https://vimawesome.com/plugin/vimfiler-vim
" https://vimawesome.com/plugin/unite-vim
" Toggle safe mode: gs
" Create new file: N
" Delete file: d
" Rename file: r
" New directory: K
" Open file: e
" Move file: m
" Open VimFilerExplorer: e
" Open current directory in a new buffer: dl
" Open current directory in a new split: ds
" Open VimFiler: \e
" Find files under current directory (Unite): \f
"-------------------------------------------
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'

"---------------------------------------------
" Comment with gc
" https://vimawesome.com/plugin/commentary-vim
"---------------------------------------------
Plug 'tpope/vim-commentary'

"---------------------------------------------
" Vim git wrapper, use git commands inside vim
" https://vimawesome.com/plugin/fugitive-vim
"---------------------------------------------
Plug 'tpope/vim-fugitive'

"-------------------------------------------
" Vim commands for surround
" https://vimawesome.com/plugin/surround-vim
"-------------------------------------------
Plug 'tpope/vim-surround'

"------------------------------------------
" Highlight on f,F
" https://vimawesome.com/plugin/quick-scope
"------------------------------------------
Plug 'unblevable/quick-scope'

"---------------------------------------------------
" Airline status bar with themes
" https://vimawesome.com/plugin/vim-airline-superman
" https://vimawesome.com/plugin/vim-airline-themes
"---------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
"----------------------------------------------------
" VimWiki plugin <leader>ww
" https://vimawesome.com/plugin/vimwiki-the-lucky-one
"----------------------------------------------------
Plug 'vimwiki/vimwiki'

"----------------------------------------------
" Fzf with file preview
" https://vimawesome.com/plugin/fzf-preview-vim
"----------------------------------------------
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
call plug#end()

"---------
" prettier
"---------
nmap <Leader>p :Prettier<CR>

"----
" git
"----
nmap <Leader>gs :G<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gh :diffget //2
nmap <Leader>gl :diffget //3

"---------
" vimfiler
"---------
nmap <C-a-l> <cmd>VimFilerExplorer<cr>
nmap <leader>n <cmd>VimFilerTab<cr>

"-----------------------------------
" vimwiki path and extension setting
"-----------------------------------
let g:vimwiki_list = [{'path': '~/Code/cerveau/',
                      \ 'ext': '.md'}]

"-------------------------------
" quick-scope highlight settings
"-------------------------------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_highlight_on_keys = ['f', 'F']

"----------------------------------------
" coc symbol rename and search in project
"----------------------------------------
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prv :CocSearch <C-R>=expand("<cword>")<CR><CR>

"--------
" airline
"--------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"----------------
" set colorscheme
"----------------
colorscheme nord

"----------------
" vim-test remaps
"----------------
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tp :TestLast<CR>
nmap <silent> <leader>tb :TestVisit<CR>

"-----------------------------
" autoimport on pressing enter
"-----------------------------
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"------------------------------
" tsserver autofix on alt-enter
"------------------------------
nmap <a-CR> :CocCommand tsserver.executeAutofix<cr>

"---------------
" coc extensions
"---------------
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-css', 
    \ 'coc-html',
    \ 'coc-json', 
    \ 'coc-yaml', 
    \ 'coc-calc', 
    \ 'coc-emmet', 
    \ 'coc-eslint', 
    \ 'coc-prettier', 
    \ 'coc-godot', 
    \ 'coc-phpactor',
    \ 'coc-fzf-preview',
    \ 'coc-rome',
    \ 'coc-tsserver',
    \ 'coc-yank',
    \ 'coc-tailwindcss',
    \ 'coc-clangd',
    \ 'coc-go',
    \ 'coc-pyright'
    \]

"----------------
" fzf keybindings
"----------------
nnoremap <leader>ff <cmd>FzfPreviewProjectFilesRpc<cr>
nnoremap <leader>fb <cmd>FzfPreviewAllBuffersRpc<cr>
nnoremap <C-p> <cmd>FZF<cr>

"-----------------------
" React syntax highlight
"-----------------------
hi ReactState guifg=#89C0D0
hi ReactProps guifg=#89C0D0
hi ApolloGraphQL guifg=#89C0D0
hi Events guifg=#88C0D0
hi ReduxKeywords guifg=#88C0D0
hi ReduxHooksKeywords guifg=#88C0D0
hi WebBrowser guifg=#88C0D0
hi ReactLifeCycleMethods guifg=#88C0D0

"---------------------------
" Toggle Terminal key remaps
"---------------------------
nmap <silent> <C-t> <cmd>ToggleTerminal<Enter>
tmap <silent> <C-t> <cmd>ToggleTerminal<Enter>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
