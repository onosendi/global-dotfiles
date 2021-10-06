local lsp_config = require('lspconfig')
local on_attach = require('plugin-config/lsp/on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.cssls.setup({
  capabilities = capabilities,
  filetypes = { 'css', 'sass', 'scss' },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  settings = {
    css = {
      validate = true
    },
    sass = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
})
