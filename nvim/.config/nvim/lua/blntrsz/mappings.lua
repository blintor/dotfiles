local Remap = require("blntrsz.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
-- local inoremap = Remap.inoremap

vnoremap(">", ">gv");
vnoremap("<", "<gv");

nnoremap("<A-j>", ".+1<CR>==");
nnoremap("<A-k>", ":m .-2<CR>==");
-- inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
-- inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

