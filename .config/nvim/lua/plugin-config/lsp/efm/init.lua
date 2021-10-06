local lsp_config = require('lspconfig')
local on_attach = require('plugin-config/lsp/on_attach')
local eslint = require('plugin-config/lsp/efm/eslint')

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/plugin-config/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = { 'package.json', '.git/', '.zshrc' }
local efm_languages = {
  javascript = { eslint },
  javascriptreact = { eslint },
  typescript = { eslint },
  typescriptreact = { eslint },
}

lsp_config.efm.setup({
  cmd = {
    "efm-langserver",
    "-c",
    efm_config,
    "-logfile",
    efm_log_dir .. "efm.log"
  },
  filetype = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact'
  },
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
  init_options = {
    documentFormatting = false
  },
  settings = {
    rootMarkers = efm_root_markers,
    languages = efm_languages
  }
})
