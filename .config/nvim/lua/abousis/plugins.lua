local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'https://github.com/tpope/vim-commentary' -- Comments
Plug 'folke/tokyonight.nvim' --Styling
Plug 'nvim-lualine/lualine.nvim' -- Important footer info
Plug 'https://github.com/preservim/nerdtree' -- File tree
Plug 'nvim-lua/plenary.nvim' -- Dependency for Telescope
Plug 'nvim-telescope/telescope.nvim' -- Fuzzy search and preview
Plug 'https://github.com/neovim/nvim-lspconfig' -- LSP config
Plug 'williamboman/mason.nvim' -- Mason
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'onsails/lspkind-nvim' -- VSCode-like pictograms
Plug 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'L3MON4D3/LuaSnip' -- Dependency for nvim-cmp
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Language syntax highlighting
Plug 'windwp/nvim-autopairs' -- Autopairs
Plug 'windwp/nvim-ts-autotag' -- HTML autotag
Plug 'nvim-tree/nvim-web-devicons' -- File icons
Plug 'akinsho/bufferline.nvim' -- Styling tabs
Plug 'norcalli/nvim-colorizer.lua' -- Color highlighting

vim.call('plug#end')

--Set theme
vim.cmd [[colorscheme tokyonight]]
