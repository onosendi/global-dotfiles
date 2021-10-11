-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
-- npm i -g pyright
-- npm i -g bash-language-server
-- npm i -g eslint_d
-- pacman -S efm-langserver

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

require'plugins.nvim-lspconfig.bash'
require'plugins.nvim-lspconfig.css'
require'plugins.nvim-lspconfig.efm'
require'plugins.nvim-lspconfig.html'
require'plugins.nvim-lspconfig.json'
require'plugins.nvim-lspconfig.python'
require'plugins.nvim-lspconfig.typescript'
