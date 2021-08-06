local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<Leader>ff', ':Files<CR>', options)
map('n', '<Leader>fg', ':GFiles<CR>', options)
map('n', '<Leader>fw', ':Windows<CR>', options)
map('n', '<Leader>fb', ':Buffers<CR>', options)
