local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}
M.setup = function(on_attach)
  lspconfig.cssls.setup({
    capabilities = capabilities,
    filetypes = { 'css', 'sass', 'scss' },
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)

      vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
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
end

return M
