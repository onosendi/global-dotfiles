return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      shade_terminals = false,
      shading_factor = 0,
      open_mapping = [[<c-\>]]
    })

    -- local keymap = vim.keymap
    --
    -- -- toggle file explorer
    -- keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle file explorer" })
  end,
}
