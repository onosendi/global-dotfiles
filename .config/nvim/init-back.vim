filetype on                      " Enable filetype detection.
filetype plugin on               " Enable filetype plugin.
filetype indent on               " Enable filetype plugin indenting.

" Emmet settings --------------------------------------------------------------

let g:user_emmet_leader_key = '<C-e>'

" Airline ---------------------------------------------------------------------

" Don't show charset.
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = ''

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = ''


" Gruvbox ---------------------------------------------------------------------

" let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" indentLine ------------------------------------------------------------------

let g:indentLine_color_term = 237


" nvim-lsp --------------------------------------------------------------------

lua require('lsp-config')


" nvim-compe" -----------------------------------------------------------------

lua require('compe-config')


" polyglot --------------------------------------------------------------------

let g:python_highlight_space_errors = 0
let g:python_highlight_operators = 0
