require'nvim-tree'.setup {
  view = {
    relativenumber = true,
    signcolumn = 'no',
    width = 35,
  },
}

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>t', ':NvimTreeToggle<CR>', options)
