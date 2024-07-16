return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
    })

    local map = vim.keymap.set

    map('n', '<Leader>gs', ':Gitsigns toggle_signs<CR>')
  end,
}
