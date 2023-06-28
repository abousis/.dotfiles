local keymap = vim.keymap
local opts = { noremap = true }

keymap.set('n', '<C-f>', '<Cmd>Telescope find_files<CR>', opts)
keymap.set('n', '<C-h>', '<Cmd>Telescope find_files hidden=true<CR>', opts)
keymap.set('n', '<C-m>', '<Cmd>Telescope buffers<CR>', opts)
