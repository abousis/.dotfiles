"Set line numbers by default"
:set number
:set autoindent

call plug#begin()

Plug 'https://github.com/tpope/vim-commentary' " Comments
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Styling
Plug 'https://github.com/vim-airline/vim-airline' " Important footer info
Plug 'https://github.com/preservim/nerdtree' " File tree
Plug 'https://github.com/neoclide/coc.nvim' " Autocompletion 
Plug 'nvim-lua/plenary.nvim' " Dependency for Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Fuzzy search and preview

set encoding=UTF-8

call plug#end()

"Set theme"
:colorscheme space-vim-dark

"NERDTree"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"Telescope"
nnoremap <C-f> :Telescope find_files<CR>
