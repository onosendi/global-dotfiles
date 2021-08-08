require('fzf-lua').setup {
  fzf_layout          = 'reverse',
  previewers = {
    bat = {
      theme = 'gruvbox-dark',
    },
  },
  grep = {
    rg_opts = "--hidden --column --line-number --no-heading -g '!package-lock.json'",
  },
}

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<Leader>ff', ':FzfLua files<CR>', options)
map('n', '<Leader>fg', ':FzfLua git_files<CR>', options)
map('n', '<Leader>fr', ':FzfLua grep<CR>', options)
