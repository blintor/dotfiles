-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

additional_plugins = {
  -- You can put your additional plugins here.
  -- Syntax is like normal packer.nvim Syntax. Examples:

  -- {'famiu/feline.nvim', branch = 'develop' },

  'morhetz/gruvbox',
  'prettier/vim-prettier',

  -- { crispgm/nvim-go', ft = 'go'}
}

-- Other settings here
-- For examples for disabling line number:
-- vim.opt.number = false
-- vim.opt.relativenumber = false
vim.api.nvim_command([[
autocmd BufWritePre *.tsx,*.ts Prettier
]])


-- Or for changing terminal toggle mapping:
-- first argument is mode of mapping. second argument is keymap.
-- third argument is command. and last argument is optional argument like {expr = true}.
-- map('n', '<C-t>', ':ToggleTerm<CR>')
-- map('t', '<C-t>', ':ToggleTerm<CR>')
