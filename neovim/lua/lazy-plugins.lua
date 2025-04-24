-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration
  -- TODO: try this plugin
  -- use {'ojroques/nvim-osc52'}

  -- collow any #<color> to its value
  'ap/vim-css-color',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  --  [tmux]
  'tmux-plugins/vim-tmux-focus-events',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'tmux-plugins/vim-tmux',
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require('plugins/gitsigns').goLazy(),
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  require('plugins/lspconfig').goLazy(),
  -- Configurations for Nvim LSP
  'p00f/clangd_extensions.nvim',
  -- TODO probably this is not needed and most likely covered already by mason
  -- { 'rhysd/vim-clang-format',
  --     build = function()
  --       vim.g['clang_format#detect_style_file'] = 1
  --     end,
  -- },
  require('plugins/cmp').goLazy(),
  -- tree
  require('plugins/neo-tree').goLazy(),
  -- Useful plugin to show you pending keybinds.
  require('plugins/which-key').goLazy(),
  -- Git related plugins
  require('plugins/fugitive').goLazy(),

  -- [themes]
  require('plugins/togglebg').goLazy(),
  require('plugins/lualine').goLazy(),
  require('plugins/indent-blankline').goLazy(),
  -- "gc" to comment visual regions/lines
  require('plugins/comment').goLazy(),

  -- find in files that uses the quick list window
  require('plugins/ctrlsf').goLazy(),

  -- Fuzzy Finder (files, lsp, etc)
  require('plugins/telescope').goLazy(),
  -- Highlight, edit, and navigate code

  require('plugins/treesitter').goLazy(),
  -- markdown
  require('plugins/markdown').goLazy(),
  -- asciidoc
  require('plugins/asciidoctor').goLazy(),

  -- session management
  require('plugins/prosession').goLazy(),

  require('plugins/copilot').goLazy(),
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',
}, {})

-- vim: ts=2 sts=2 sw=2 et
