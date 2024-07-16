-- Set the background theme to dark
vim.opt.background = "dark"

-- Disable backup file creation
vim.opt.backup = false

-- Set the command line height to 1 line
vim.opt.cmdheight = 1

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Support multiple file formats
vim.opt.fileformats = { "unix", "mac", "dos" }

-- Disable code folding by default
vim.opt.foldenable = false

-- Allow buffer switching without saving
vim.opt.hidden = true

-- Set command history to remember 1000 commands
vim.opt.history = 1000

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Enable lazy redraw for faster macros and scripts
vim.opt.lazyredraw = true

-- Enable regular expression magic
vim.opt.magic = true

-- Display line numbers
vim.opt.number = true

-- Display relative line numbers
vim.opt.relativenumber = true

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Disable highlighting matching parentheses
vim.opt.showmatch = false

-- Display the sign column with line numbers
vim.opt.signcolumn = "yes"

-- Override ignorecase if search pattern contains uppercase letters
vim.opt.smartcase = true

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2

-- Disable swap file creation
vim.opt.swapfile = false

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2

-- Enable true color support
vim.opt.termguicolors = true

-- Allow specified keys to move to the previous/next line when at the beginning/end of a line
vim.opt.whichwrap = vim.opt.whichwrap:append("<,>,[,]")

-- Enable command-line completion mode
vim.opt.wildmenu = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disable write backup file creation
vim.opt.writebackup = false

-- This autocommand is triggered after a buffer is read (BufReadPost event). 
-- It inspects the first 100 lines of the buffer to determine the predominant 
-- indentation style used (tabs vs spaces). Based on the analysis, it sets the 
-- buffer's tab settings to match the detected style.
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, 100, false)
      local tabs, spaces = 0, 0
      local space_indent = 0

      for _, line in ipairs(lines) do
          local first_char = line:match("^%s")
          if first_char == "\t" then
              tabs = tabs + 1
          elseif first_char == " " then
              spaces = spaces + 1
              local indent = line:match("^ +"):len()
              if indent > 1 and (space_indent == 0 or indent < space_indent) then
                  space_indent = indent
              end
          end
      end

      if tabs > spaces then
          vim.bo.expandtab = false
          vim.bo.tabstop = 8
          vim.bo.shiftwidth = 8
      else
          vim.bo.expandtab = true
          vim.bo.tabstop = space_indent
          vim.bo.shiftwidth = space_indent
      end
    end,
})
