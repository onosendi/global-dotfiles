require'fzf-lua'.setup {
  fzf_layout = 'default',
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

map('n', '<Leader>ff', '<cmd>lua require"fzf-lua".files()<CR>', options)
map('n', '<Leader>fb', '<cmd>lua require"fzf-lua".buffers()<CR>', options)
map('n', '<Leader>fv', '<cmd>lua require"fzf-lua".git_files()<CR>', options)
map('n', '<Leader>fg', '<cmd>lua require"fzf-lua".live_grep()<CR>', options)
map('n', '<Leader>fl', '<cmd>lua require"fzf-lua".grep_last()<CR>', options)
