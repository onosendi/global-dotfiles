local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

return function(client)
  map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
  map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
  map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
  map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
  map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
  map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
  map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
  map('n', '<leader>lw', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })<CR>', options)
  map('n', '<leader>lo', '<cmd>OrganizeImports<CR>', options)
  map('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false }})<CR>', options)
  map('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false }})<CR>', options)

  vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

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
