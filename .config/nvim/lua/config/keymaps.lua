-- Set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Shorten function name for setting keymaps
local map = vim.api.nvim_set_keymap

-- Clear search highlighting
map('n', '<Leader>dc', ':let @/=""<CR>', { noremap = true, silent = true })

-- Navigate between windows using Ctrl + arrow keys
map('n', '<C-J>', '<C-W><C-J>', { noremap = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Make all windows equal size
map('n', '<Leader>ds', '<C-W>=', { noremap = true })
