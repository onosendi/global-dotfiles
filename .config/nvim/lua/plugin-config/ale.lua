vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_filetype_changed = 1
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'always'
vim.g.ale_sign_column_always = 0

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>af', ':ALEFix<CR>', options)
map('n', '<Leader>al', ':ALELint<CR>', options)
map('n', '<Leader>ar', ':ALEReset<CR>', options)
map('n', '<Leader>an', ':ALENextWrap<CR>', options)
map('n', '<Leader>ap', ':ALEPreviousWrap<CR>', options)
