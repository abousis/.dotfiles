local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'https://github.com/tpope/vim-commentary' -- Comments
Plug('folke/tokyonight.nvim') --Styling
Plug 'https://github.com/vim-airline/vim-airline' -- Important footer info
Plug 'https://github.com/preservim/nerdtree' -- File tree
Plug 'https://github.com/neoclide/coc.nvim' -- Autocompletion 
Plug 'nvim-lua/plenary.nvim' -- Dependency for Telescope
Plug 'nvim-telescope/telescope.nvim' -- Fuzzy search and preview
Plug 'https://github.com/neovim/nvim-lspconfig' -- LSP config

vim.call('plug#end')

--Set theme
vim.cmd[[colorscheme tokyonight]]
