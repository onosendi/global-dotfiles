local lspconfig = require'lspconfig'
local null_ls = require'null-ls'

local M = {}
M.setup = function(on_attach)
  local null_ls_sources = {
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  }
  null_ls.register({ sources = null_ls_sources })

  lspconfig.pyright.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)
    end,
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
    },
  })
end

return M
