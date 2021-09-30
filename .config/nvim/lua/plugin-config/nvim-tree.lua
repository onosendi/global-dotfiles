require('nvim-tree.view').View.winopts.relativenumber = true

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>tt', ':NvimTreeToggle<CR>', options)
map('n', '<Leader>tr', ':NvimTreeRefresh<CR>', options)
