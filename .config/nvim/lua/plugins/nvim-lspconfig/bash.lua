local lsp_config = require'lspconfig'
local on_attach = require'plugins.nvim-lspconfig.on_attach'

lsp_config.bashls.setup({
  on_attach = on_attach,
})
