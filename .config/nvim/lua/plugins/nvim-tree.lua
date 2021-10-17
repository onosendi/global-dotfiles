require'nvim-tree'.setup {
  view = {
    width = 35,
  },
}

require'nvim-tree.view'.View.winopts.relativenumber = true

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>t', ':NvimTreeToggle<CR>', options)
