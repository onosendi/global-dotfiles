local lspconfig = require('lspconfig')
local null_ls = require'null-ls'
local u = require('utils')

local ts_utils_settings = {
  cwd = function(params)
    return require('lspconfig.util').root_pattern('tsconfig.json')(params.bufname)
  end,
  debug = false,
}

local M = {}
M.setup = function(on_attach)
  local null_ls_sources = { null_ls.builtins.diagnostics.eslint_d }
  null_ls.register({ sources = null_ls_sources })

  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)

      local ts_utils = require('nvim-lsp-ts-utils')
      ts_utils.setup(ts_utils_settings)
      ts_utils.setup_client(client)

      u.map('n', '<leader>lo', ':TSLspOrganize<CR>')
      u.map('n', '<leader>lR', ':TSLspRenameFile<CR>')
      u.map('n', '<leader>la', ':TSLspImportAll<CR>')
      u.map('n', '<leader>lf', ':TSLspFixCurrent<CR>')
    end,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

return M
