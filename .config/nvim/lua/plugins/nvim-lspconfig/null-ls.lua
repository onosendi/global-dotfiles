local null_ls = require'null-ls'

local sources = {
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.diagnostics.flake8,
}

local M = {}
M.setup = function(on_attach)
  null_ls.config { sources = sources }
  require'lspconfig'['null-ls'].setup { on_attach = on_attach }
end

return M
