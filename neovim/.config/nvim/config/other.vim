"---------------
" groff settings
"---------------
au BufNewFile,BufRead *.ms set filetype=groff
au BufNewFile,BufRead *.json set filetype=jsonc
au FileType groff map <leader>w :w! \| !groff -k -Tpdf -ms -e <c-r>% > <c-r>%<del><del>pdf<CR>
au FileType groff map <leader>p :!zathura <c-r>%<del><del>pdf & disown<CR><CR>

"---------------
" latex settings
"---------------
au FileType tex map <leader>w :w! \| !pdflatex -interaction=nonstopmode <c-r>%<CR>
au FileType tex map <leader>p :!zathura <c-r>%<del><del><del>pdf & disown<CR><CR>

"------------------
" markdown settings
"------------------
au FileType markdown map <leader>w :w! \| !pandoc <c-r>% -V geometry:margin=2cm -o <c-r>%<del><del>pdf<CR>
au FileType markdown map <leader>p :!zathura <c-r>%<del><del>pdf & disown<CR><CR>
au FileType text map <leader>w :w! \| !pandoc <c-r>% -V geometry:margin=2cm -o <c-r>%<del><del>pdf<CR>
au FileType text map <leader>p :!zathura <c-r>%<del><del>pdf & disown<CR><CR>
