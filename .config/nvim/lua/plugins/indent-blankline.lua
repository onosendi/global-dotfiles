vim.cmd [[
    highlight IndentBlanklineIndent1 guifg=#4C4C4C gui=nocombine
]]

require("indent_blankline").setup {
    char_highlight_list = {
        'IndentBlanklineIndent1',
    },
}
