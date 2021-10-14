local null_ls = require'null-ls'

local M = {}
M.setup = function(on_attach)
  null_ls.config {
    diagnostics_format = '#{m} [#{c}]',
    debounce = 150,
  }
  require'lspconfig'['null-ls'].setup { on_attach = on_attach }
end

return M
