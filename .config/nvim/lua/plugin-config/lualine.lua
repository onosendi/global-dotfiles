require('lualine').setup {
  options = {
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {
      {'mode'},
      {
        'diagnostics',
        color_error = '#fb4934',
        color_warn = '#fabd2f',
        color_info = '#83a598',
        color_hint = '#ffffff',
        sections = {'error', 'warn', 'info', 'hint'},
        sources = {'ale'},
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
      }
    },
  },
}
