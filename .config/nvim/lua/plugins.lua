local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'farmergreg/vim-lastplace'
Plug 'hoob3rt/lualine.nvim'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'dylnmc/synstack.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

vim.call('plug#end')
