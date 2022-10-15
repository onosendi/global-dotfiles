local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}
M.setup = function(on_attach)
  lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = {'html', 'htmldjango'},
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      on_attach(client, bufnr)
    end,
  })
end

return M
