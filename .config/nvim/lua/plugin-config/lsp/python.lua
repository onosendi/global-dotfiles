local lsp_config = require('lspconfig')
local on_attach = require('plugin-config/lsp/on_attach')

lsp_config.pyright.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
})
