-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
-- npm i -g pyright
-- npm i -g bash-language-server
-- npm i -g eslint_d
local u = require('utils')
local bashls = require'plugins.nvim-lspconfig.bashls'
local cssls = require'plugins.nvim-lspconfig.cssls'
local html = require'plugins.nvim-lspconfig.html'
local jsonls = require'plugins.nvim-lspconfig.jsonls'
local null_ls = require'plugins.nvim-lspconfig.null-ls'
local pyright = require'plugins.nvim-lspconfig.pyright'
local tsserver = require'plugins.nvim-lspconfig.tsserver'

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

vim.fn.sign_define('LspDiagnosticsSignError', {
  text = '',
  numhl = 'LspDiagnosticsDefaultError',
})

vim.fn.sign_define('LspDiagnosticsSignWarning', {
  text = '▲',
  numhl = 'LspDiagnosticsDefaultWarning',
})

vim.fn.sign_define('LspDiagnosticsSignInformation', {
  text = '●',
  numhl = 'LspDiagnosticsDefaultInformation',
})

vim.fn.sign_define('LspDiagnosticsSignHint', {
  text = '✱',
  numhl = 'LspDiagnosticsDefaultHint',
})

local on_attach = function(client, bufnr)
  u.map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  u.map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
  u.map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  u.map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  u.map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  u.map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  u.map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
  u.map('n', '<leader>lw', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })<CR>')
  u.map('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false }})<CR>')
  u.map('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false }})<CR>')

  if client.resolved_capabilities.document_formatting then
    u.buf_augroup('LspFormatOnSave', 'BufWritePre', 'lua vim.lsp.buf.formatting_sync()')
  end

  vim.cmd [[
    highlight LspDiagnosticsVirtualTextError guifg=#fb4934
    highlight LspDiagnosticsDefaultError guifg=#fb4934
    highlight LspDiagnosticsFloatingError guifg=#ebdbb2
    highlight LspDiagnosticsVirtualTextWarning guifg=#fabd2f
    highlight LspDiagnosticsDefaultWarning guifg=#fabd2f
    highlight LspDiagnosticsFloatingWarning guifg=#ebdbb2
    highlight LspDiagnosticsVirtualTextHint guifg=#ebdbb2
    highlight LspDiagnosticsDefaultHint guifg=#ebdbb2
    highlight LspDiagnosticsFloatingHint guifg=#ebdbb2
  ]]
end

bashls.setup(on_attach)
cssls.setup(on_attach)
html.setup(on_attach)
jsonls.setup(on_attach)
null_ls.setup(on_attach)
pyright.setup(on_attach)
tsserver.setup(on_attach)
