-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
-- npm i -g pyright
-- npm i -g bash-language-server

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false,
    virtual_text = {
      prefix = '●',
      spacing = 2,
    },
    update_in_insert = true,
    severity_sort = true,
  }
)

vim.fn.sign_define('LspDiagnosticsSignError', {
  text = '✖',
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

require 'plugin-config/lsp/bash';
require 'plugin-config/lsp/css';
require 'plugin-config/lsp/html';
require 'plugin-config/lsp/json';
require 'plugin-config/lsp/python';
require 'plugin-config/lsp/typescript';
