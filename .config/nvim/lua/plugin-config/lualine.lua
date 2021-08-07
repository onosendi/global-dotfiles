require('lualine').setup {
  inactive_sections = {
    lualine_x = {},
  },
  options = {
    theme = 'gruvbox',
    component_separators = {'', ''},
  },
  sections = {
    lualine_c = {
      {
        'diagnostics',
        color_error = '#fb4934',
        color_warn = '#fabd2f',
        color_info = '#83a598',
        color_hint = '#ffffff',
        sections = {'error', 'warn', 'info', 'hint'},
        sources = {'ale'},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = 'ﬤ '}
      },
      'filename',
    },
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {},
  },
}
