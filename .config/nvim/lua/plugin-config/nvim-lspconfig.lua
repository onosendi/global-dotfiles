-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
-- npm i -g pyright
-- npm i -g bash-language-server
-- npm i -g eslint_d
-- pacman -S efm-langserver

vim.cmd [[
  hi LspDiagnosticsVirtualTextError guifg=#fb4934
  hi LspDiagnosticsDefaultError guifg=#fb4934
  hi LspDiagnosticsFloatingError guifg=#ebdbb2

  hi LspDiagnosticsVirtualTextWarning guifg=#fabd2f
  hi LspDiagnosticsDefaultWarning guifg=#fabd2f
  hi LspDiagnosticsFloatingWarning guifg=#ebdbb2
]]

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
require 'plugin-config/lsp/efm';
require 'plugin-config/lsp/html';
require 'plugin-config/lsp/json';
require 'plugin-config/lsp/python';
require 'plugin-config/lsp/typescript';
