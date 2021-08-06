local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>nt', ':NERDTreeToggle<CR>', options)
map('n', '<Leader>nr', ':NERDTreeRefreshRoot<CR>', options)
