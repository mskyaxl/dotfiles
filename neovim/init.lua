--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require 'lazy-plugins'

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require 'telescope-setup'

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require 'treesitter-setup'

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require 'lsp-setup'

-- [[ Configure nvim-cmp ]]
-- (completion)
require 'cmp-setup'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

--vim.cmd [[set clipboard^=unnamed,unnamedplus]]
--vim.opt.clipboard:prepend('unnamed,unnamedplus')

--vim.opt.relativenumber = true
--vim.opt.tabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.softtabstop = 0
--vim.opt.expandtab = true
--vim.opt.swapfile = false
-- set termguicolors to enable highlight groups
--vim.opt.termguicolors = true
--vim.opt.colorcolumn = {80, 120}
--vim.g.loaded_perl_provider = 0 
-- [[ Splits ]]
--vim.opt.splitright = true            -- bool: Place new window to right of current one


--require("plugins")
--require("keymaps")
--require("nvimtree")
--require("lsp")
--require("clangd_lsp")
--require("treesitter")


--require('nvim_comment').setup()

--vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
--vim.o.undofile = true

--set tmuxtheme filetype to tmux
--vim.filetype.add({ extension = { tmuxtheme = 'tmux'}})

-- TODO replace this with lua
-- vim.cmd [[
-- nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
-- hi OverLength ctermbg=none cterm=none
-- match OverLength /\%>80v/
-- fun! s:LongLineHLToggle()
--  if !exists('w:longlinehl')
--   let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
--   echo "Long lines highlighted"
--  else
--   call matchdelete(w:longlinehl)
--   unl w:longlinehl
--   echo "Long lines unhighlighted"
--  endif
-- endfunction]]

