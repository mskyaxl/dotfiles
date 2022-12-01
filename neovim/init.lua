vim.cmd [[set clipboard^=unnamed,unnamedplus]]


-- vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.colorcolumn = {80, 120}
vim.g.loaded_perl_provider = 0 
require("lsp")
require("plugins")
require("keymaps")
require("nvimtree")
require("clangd_cfg")
require("treesitter")

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Hack to avoid first calling togglebg#map on <F5>
vim.g.background=dark
vim.cmd [[
    colorscheme gruvbox 
    let g:no_plugin_maps=1
    call togglebg#map("<F6>")
    unlet g:no_plugin_maps]]

vim.g.pastetoggle = "<F2>"


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

