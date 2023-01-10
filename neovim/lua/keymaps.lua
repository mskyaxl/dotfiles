vim.g.mapleader = " "
vim.o.pastetoggle = "<F2>"

-- Find files using Telescope command-line sugar.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
 
local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>fg', extensions.live_grep_args.live_grep_args, {})
-- Disable arrow keys 
vim.keymap.set('', '<Up>',    '<Nop>', {})
vim.keymap.set('', '<Down>',  '<Nop>', {})
vim.keymap.set('', '<Left>' , '<Nop>', {})
vim.keymap.set('', '<Right>', '<Nop>', {})

-- CtrlSF
vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt', {})
vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordPath', {})
vim.api.nvim_set_keymap('n', '<C-F>p', '<Plug>CtrlSFPwordPath', {})

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeFindFileToggle<CR>', {})
