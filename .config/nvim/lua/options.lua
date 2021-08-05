-- when set to 'dark' or 'light', adjusts the default color groups
vim.opt.background = 'dark'

-- Make a backup before overwriting a file
vim.opt.backup = false

-- Number of screen lines to use for the command-line
vim.opt.cmdheight = 1

-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- This gives the end-of-line formats that will be tried when editing/reading buffer
vim.opt.fileformats = {'unix', 'mac', 'dos'}

-- When off, all folds are open
vim.opt.foldenable = false

-- Abondoning buffers, see :help hidden
vim.opt.hidden = true

-- Number of how many commands and previous search patterns are remembered
vim.opt.history = 1000

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- When set, the screen will not be redrawn while executing macros
vim.opt.lazyredraw = true

--- Changes the special characters that can be used in search patterns
vim.opt.magic = true

-- Show the line number in front of each line
vim.opt.number = true

-- Show the line number relative to the line with the cursor
vim.opt.relativenumber = true

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

vim.opt.showmatch = false

-- When and how to draw the sign column
vim.opt.signcolumn = 'number'

-- Override the 'ignorecase' option if the search pattern contains uppercase characters
vim.opt.smartcase = true

-- Number of spaces that <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2

-- Use a swapfile for the buffer
vim.opt.swapfile = false

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Allow specified keys that move the cursor left/right to move to the previous/next line
vim.opt.whichwrap = vim.opt.whichwrap:append('<,>,[,]')

-- Enables "enhanced mode" of command-line completion
vim.opt.wildmenu = true

-- This option changes how text is displayed, see :help wrap
vim.opt.wrap = false

-- Make a backup before overwriting a file
vim.opt.writebackup = false
