local lspconfig = require('lspconfig')
local u = require('utils')

local M = {}
M.setup = function(on_attach)

  lspconfig.tsserver.setup({
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      on_attach(client, bufnr)

      u.map('n', '<leader>lf', ':EslintFixAll<CR>')
    end,
  })
end

return M
