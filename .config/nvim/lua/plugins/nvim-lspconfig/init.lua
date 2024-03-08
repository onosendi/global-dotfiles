-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
-- npm i -g pyright
-- npm i -g bash-language-server
-- npm i -g eslint_d
-- npm i -g stylelint
local u = require('utils')
local bashls = require'plugins.nvim-lspconfig.bashls'
local cssls = require'plugins.nvim-lspconfig.cssls'
local html = require'plugins.nvim-lspconfig.html'
local jsonls = require'plugins.nvim-lspconfig.jsonls'
local null_ls = require'plugins.nvim-lspconfig.null-ls'
local pyright = require'plugins.nvim-lspconfig.pyright'
local tsserver = require'plugins.nvim-lspconfig.tsserver'
local eslint = require'plugins.nvim-lspconfig.eslint'
local hls = require'plugins.nvim-lspconfig.hls'

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      prefix = '●',
      spacing = 2,
    },
    update_in_insert = true,
    severity_sort = true,
  }
)

vim.fn.sign_define('DiagnosticSignError', {
  text = '',
  numhl = 'DiagnosticError',
  texthl= 'DiagnosticSignError',
})

vim.fn.sign_define('DiagnosticSignWarn', {
  text = '▲',
  numhl = 'DiagnosticWarn',
  texthl = 'DiagnosticSignWarn',
})

vim.fn.sign_define('DiagnosticSignInfo', {
  text = '●',
  numhl = 'DiagnosticInfo',
  texthl = 'DiagnosticSignInfo',
})

vim.fn.sign_define('DiagnosticSignHint', {
  text = '✱',
  numhl = 'DiagnosticHint',
  texthl = 'DiagnosticSignHint',
})

local on_attach = function(client, bufnr)
  u.map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  u.map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
  u.map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  u.map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  u.map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  u.map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  u.map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
  u.map('n', '<leader>lw', '<cmd>lua vim.diagnostic.open_float()<CR>')
  u.map('n', '<leader>lp', '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { show_header = false }})<CR>')
  u.map('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { show_header = false }})<CR>')

  if client.server_capabilities.documentFormattingProvider then
    u.buf_augroup('LspFormatOnSave', 'BufWritePre', 'lua vim.lsp.buf.formatting_sync()')
  end

  -- Gruvbox
  -- vim.cmd [[
  --   highlight DiagnosticVirtualTextError guifg=#fb4934
  --   highlight DiagnosticError guifg=#fb4934
  --   highlight DiagnosticFloatingError guifg=#ebdbb2

  --   highlight DiagnosticVirtualTextWarn guifg=#fabd2f
  --   highlight DiagnosticWarn guifg=#fabd2f
  --   highlight DiagnosticFloatingWarn guifg=#ebdbb2

  --   highlight DiagnosticVirtualTextInfo guifg=#8ec07c
  --   highlight DiagnosticInfo guifg=#8ec07c
  --   highlight DiagnosticFloatingInfo guifg=#ebdbb2

  --   highlight DiagnosticVirtualTextHint guifg=#ebdbb2
  --   highlight DiagnosticHint guifg=#ebdbb2
  --   highlight DiagnosticFloatingHint guifg=#ebdbb2
  -- ]]

  vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

bashls.setup(on_attach)
-- cssls.setup(on_attach)
html.setup(on_attach)
jsonls.setup(on_attach)
null_ls.setup(on_attach)
-- pyright.setup(on_attach)
tsserver.setup(on_attach)
eslint.setup(on_attach)
hls.setup(on_attach)
