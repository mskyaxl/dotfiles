--vim.cmd [[set clipboard^=unnamed,unnamedplus]]
vim.opt.clipboard:prepend('unnamed,unnamedplus')

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.colorcolumn = {80, 120}
vim.g.loaded_perl_provider = 0 

-- [[ Splits ]]
--vim.opt.splitright = true            -- bool: Place new window to right of current one


require("plugins")
require("keymaps")
require("nvimtree")
require("lsp")
require("clangd_lsp")
require("treesitter")


require('nvim_comment').setup()

vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

--fix clipboard
vim.cmd [[
    noremap <Leader>y "*y
    noremap <Leader>p "*p
    noremap <Leader>Y "+y
    noremap <Leader>P "+p]]
--set tmuxtheme filetype to tmux
vim.cmd [[autocmd BufRead,BufNewFile *.tmuxtheme set filetype=tmux]]

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

