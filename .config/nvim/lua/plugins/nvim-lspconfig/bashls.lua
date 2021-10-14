local lspconfig = require('lspconfig')
local u = require('utils')

local M = {}
M.setup = function(on_attach)
  lspconfig.bashls.setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
    end,
  })
end

return M
