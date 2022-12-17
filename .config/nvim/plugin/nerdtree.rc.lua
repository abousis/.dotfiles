local keymap = vim.keymap
local opts = { noremap = true }

keymap.set('n', '<leader>n', '<Cmd>NERDTreeFocus<CR>', opts)
keymap.set('n', '<C-n>', '<Cmd>NERDTree<CR>', opts)
keymap.set('n', '<C-t>', '<Cmd>NERDTreeToggle<CR>', opts)
