-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false
-- keep the cursor line highlighted
vim.o.cursorline = true

-- Make line numbers default
--vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.o.clipboard = 'unnamedplus'

vim.opt.clipboard:prepend('unnamed,unnamedplus')
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

--set tmuxtheme filetype to tmux
vim.filetype.add({ extension = { tmuxtheme = 'tmux'}})

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- set termguicolors to enable highlight groups
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.opt.colorcolumn = {80, 120}
vim.g.loaded_perl_provider = 0
-- [[ Splits ]]
vim.opt.splitright = true            -- bool: Place new window to right of current one

-- vim: ts=2 sts=2 sw=2 et




