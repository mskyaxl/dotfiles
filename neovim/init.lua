
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


require("plugins")
require("keymaps")
require("nvimtree")
require("lsp")
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
vim.g.ctrlsf_compact_position = 'bottom_inside'
vim.g.ctrlsf_populate_qflist = 1
vim.g.ctrlsf_default_view_mode = 'compact'
-- exclude .git and .gitignore from file search in ctrlp
vim.g.ctrlp_user_command = {
      '.git', 
      'cd %s && git ls-files -co --exclude-standard'}
vim.g.ctrlp_show_hidden = 1   


vim.cmd [[let g:airline#extensions#tabline#enabled = 1]]
-- vim.g.airline#extensions#tabline#enabled = 1

-- vim-gitgutter used to do this by default:
vim.cmd [[
  highlight! link SignColumn LineNr
]] 

vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.colorcolumn = 80

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

-- asciidoc
-- Fold sections, default `0`.
vim.g.asciidoctor_folding = 1

-- Fold options, default `0`.
vim.g.asciidoctor_fold_options = 1
-- Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
-- See limitations in end of the README
vim.g.asciidoctor_syntax_conceal = 1

-- Highlight indented text, default `1`.
vim.g.asciidoctor_syntax_indented = 0

-- List of filetypes to highlight, default `[]`
vim.g.asciidoctor_fenced_languages = {'python', 'c', 'javascript'}



