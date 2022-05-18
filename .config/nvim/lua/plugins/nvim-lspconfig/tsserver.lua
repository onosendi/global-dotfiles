local lspconfig = require('lspconfig')
local u = require('utils')

local M = {}
M.setup = function(on_attach)

  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)

      u.map('n', '<leader>lf', ':EslintFixAll<CR>')
    end,
  })
end

return M
