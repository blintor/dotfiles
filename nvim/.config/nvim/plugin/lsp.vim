set completeopt=menu,menuone,noselect
set wildmode=longest,list,full
set wildmenu

nmap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nmap <silent> <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nmap <silent> <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nmap <silent> <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nmap <silent> <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> <leader>rr <cmd>lua vim.lsp.buf.rename()<CR>
nmap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nmap <silent> <C-j> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <silent> <S-C-j> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nmap <silent> <leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
" nmap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(protocol.make_client_capabilities())

-- typescript
nvim_lsp.tsserver.setup {
  capabilities = capabilities
}

-- haskell
nvim_lsp.hls.setup {
  capabilities = capabilities,
  root_dir = vim.loop.cwd,
  settings = {
    rootMarkers = {"./git/"}
  }
}

-- eslint
local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

nvim_lsp.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}

EOF
