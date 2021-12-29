local null_ls = require'null-ls'

local M = {}
M.setup = function(on_attach)
  null_ls.setup {
    on_attach = on_attach,
    diagnostics_format = '#{m} [#{c}]',
    debounce = 150,
  }
end

return M
