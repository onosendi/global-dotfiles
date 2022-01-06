local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<Leader>gg', ':Git<CR>', options)
map('n', '<Leader>gl', ':Git l<CR>', options)
map('n', '<Leader>gs', ':Git status<CR>', options)
map('n', '<Leader>gcc', ':Git commit<CR>', options)
map('n', '<Leader>gca', ':Git commit -a<CR>', options)
map('n', '<Leader>gp', ':Git push<CR>', options)
map('n', '<Leader>gdv', ':Gvdiffsplit<CR>', options)
