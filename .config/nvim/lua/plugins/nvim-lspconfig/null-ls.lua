local null_ls = require'null-ls'

local M = {}
M.setup = function(on_attach)
    null_ls.config { }
    require'lspconfig'['null-ls'].setup { on_attach = on_attach }
end

return M
