local lspconfig = require('lspconfig')
local null_ls = require'null-ls'
local u = require('utils')

local ts_utils_settings = {
  debug = true,
  disable_commands = false,
  enable_import_on_completion = false,

  -- import all
  import_all_timeout = 5000, -- ms
  import_all_priorities = {
    buffers = 4, -- loaded buffer names
    buffer_content = 3, -- loaded buffer content
    local_files = 2, -- git files or files with relative path markers
    same_file = 1, -- add to existing import statement
  },
  import_all_scan_buffers = 100,
  import_all_select_source = false,

  -- eslint
  eslint_enable_code_actions = true,
  eslint_enable_disable_comments = true,
  eslint_bin = 'eslint_d',
  eslint_enable_diagnostics = false,

  -- formatting
  enable_formatting = false,
  formatter = 'prettier',
  formatter_opts = {},

  -- update imports on file move
  update_imports_on_move = false,
  require_confirmation_on_move = false,
  watch_dir = nil,

  -- filter diagnostics
  filter_out_diagnostics_by_severity = {},
  filter_out_diagnostics_by_code = {},
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