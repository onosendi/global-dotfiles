vim.g.ale_completion_enabled = 0
vim.g.ale_linters = {
  javascript = {'eslint'},
  javascriptreact = {'eslint'},
  python = {'flake8',},
}
vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  javascript = {'eslint'},
  javascriptreact = {'eslint'},
  python = {'black', 'isort'},
}

vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_filetype_changed = 1
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'always'
vim.g.ale_sign_column_always = 0
vim.g.ale_sign_error = 'E'
vim.g.ale_sign_warning = 'W'

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>af', ':ALEFix<CR>', options)
map('n', '<Leader>al', ':ALELint<CR>', options)
map('n', '<Leader>ar', ':ALEReset<CR>', options)
map('n', '<Leader>an', ':ALENextWrap<CR>', options)
map('n', '<Leader>ap', ':ALEPreviousWrap<CR>', options)
