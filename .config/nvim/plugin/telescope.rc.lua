local keymap = vim.keymap
local opts = { noremap = true }

keymap.set('n', '<C-f>', '<Cmd>Telescope find_files<CR>', opts)
keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>', opts)
