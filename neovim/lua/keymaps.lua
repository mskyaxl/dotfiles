-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et


-- old config



--vim.g.mapleader = " "

-- Find files using Telescope command-line sugar.
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
 
--local extensions = require('telescope').extensions
--vim.keymap.set('n', '<leader>fg', extensions.live_grep_args.live_grep_args, {})
-- Disable arrow keys 
--vim.keymap.set('', '<Up>',    '<Nop>', {})
--vim.keymap.set('', '<Down>',  '<Nop>', {})
--vim.keymap.set('', '<Left>' , '<Nop>', {})
--vim.keymap.set('', '<Right>', '<Nop>', {})

-- CtrlSF
--vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt', {})
--vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordPath', {})
--vim.api.nvim_set_keymap('n', '<C-F>p', '<Plug>CtrlSFPwordPath', {})

-- NvimTree
--vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeFindFileToggle<CR>', {})

--fix clipboard
--vim.keymap.set('','<Leader>Y', '"*y', {})
--vim.keymap.set('','<Leader>P', '"*p', {})
--vim.keymap.set('','<Leader>y', '"+y', {})
--vim.keymap.set('','<Leader>p', '"+p', {})

