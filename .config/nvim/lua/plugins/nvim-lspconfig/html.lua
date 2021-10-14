local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}
M.setup = function(on_attach)
  lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = {'html', 'htmldjango'},
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)

      vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
    end,
  })
end

return M
