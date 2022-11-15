"Set line numbers by default"
:set number
:set autoindent

call plug#begin()

Plug 'https://github.com/tpope/vim-commentary' " Comments
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Styling
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'https://github.com/vim-airline/vim-airline' " Important footer info
Plug 'https://github.com/preservim/nerdtree' " File tree
Plug 'https://github.com/neoclide/coc.nvim' " Autocompletion 

set encoding=UTF-8

call plug#end()

"Set theme"
:colorscheme space-vim-dark
