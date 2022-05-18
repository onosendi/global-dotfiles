local lspconfig = require('lspconfig')

local M = {}
M.setup = function(on_attach)
  lspconfig.eslint.setup{}
end

return M
