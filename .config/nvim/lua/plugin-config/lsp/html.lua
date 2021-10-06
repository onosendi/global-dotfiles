local lsp_config = require('lspconfig')
local on_attach = require('plugin-config/lsp/on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.html.setup({
  capabilities = capabilities,
  filetypes = {'html', 'htmldjango'},
  on_attach = function(client)
    -- TODO: What is this?
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
