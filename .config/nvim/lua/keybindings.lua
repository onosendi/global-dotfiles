vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- Clear search highlight
map('n', '<Leader>dc', ':let @/=""<CR>', { noremap = true, silent = true })

-- Navigate between windows
map('n', '<C-J>', '<C-W><C-J>', { noremap = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Noramlize window sizes
map('n', '<Leader>ds', '<C-W>=', { noremap = true })
