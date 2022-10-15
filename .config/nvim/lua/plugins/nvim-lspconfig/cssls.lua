local lspconfig = require'lspconfig'
local null_ls = require'null-ls'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}
M.setup = function(on_attach)
  local null_ls_sources = {
    null_ls.builtins.diagnostics.stylelint,
  }
  null_ls.register({ sources = null_ls_sources })

  lspconfig.cssls.setup({
    capabilities = capabilities,
    filetypes = { 'css', 'sass', 'scss' },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      on_attach(client, bufnr)
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
