local map = vim.api.nvim_set_keymap

map('n', '<Leader>ff', ':Files<CR>', { noremap = true })
map('n', '<Leader>fg', ':GFiles<CR>', { noremap = true })
map('n', '<Leader>fw', ':Windows<CR>', { noremap = true })
map('n', '<Leader>fb', ':Buffers<CR>', { noremap = true })
