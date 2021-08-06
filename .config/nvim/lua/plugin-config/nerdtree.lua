local map = vim.api.nvim_set_keymap

map('n', '<Leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<Leader>nr', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })
