"-------------------------
" jumb between open splits
"-------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"------------------
" split opens remap
"------------------
nnoremap <Leader>l :vsp<CR>
nnoremap <Leader>j :sp<CR>

"---------------
" start terminal
"---------------
nnoremap <Leader>cl :5new term://zsh<CR>$a

"-------------
" marker remap
"-------------
nnoremap <leader>1 '1zz
nnoremap <leader>2 '2zz
nnoremap <leader>3 '3zz
nnoremap <leader>4 '4zz

"------------------------
" back to prev file remap
"------------------------
map <C-b> <C-^>

"------------------
" buffer operations
"------------------
map <Leader>bd <cmd>bd<CR>
map <Leader>bn <cmd>bnext<CR>
map <Leader>bp <cmd>bprevious<CR>
map <a-1> <cmd>b 1<cr>
map <a-2> <cmd>b 2<cr>
map <a-3> <cmd>b 3<cr>
map <a-4> <cmd>b 4<cr>
map <a-5> <cmd>b 5<cr>
