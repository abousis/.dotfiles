local keymap = vim.keymap
local opts = { noremap = true }

keymap.set('n', '<C-f>', '<Cmd>Telescope find_files<CR>', opts)
