return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })

    local builtin = require('telescope.builtin')

    local map = vim.keymap.set

    map("n", "<leader>ff", builtin.find_files, { desc = "Lists files in your current working directory, respects .gitignore" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Lists open buffers in current neovim instance" })
    map("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy search through the output of git ls-files command, respects .gitignore" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Lists previously open files" })
    map("n", "<leader>fs", builtin.live_grep, { desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)" })
    map("n", "<leader>fc", builtin.grep_string, { desc = "Searches for the string under your cursor or selection in your current working directory" })
  end,
}
