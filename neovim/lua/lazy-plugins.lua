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
  'lewis6991/gitsigns.nvim',
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- Configurations for Nvim LSP
  'p00f/clangd_extensions.nvim',
  -- TODO probably this is not needed and most likely covered already by mason
  -- { 'rhysd/vim-clang-format',
  --     build = function()
  --       vim.g['clang_format#detect_style_file'] = 1
  --     end,
  -- },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- cmdline autocompletion
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  -- tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
   -- Git related plugins
  {
    'tpope/vim-fugitive',
    dependencies = {
      'tommcdo/vim-fubitive',
      'tpope/vim-rhubarb',
    },
    config = function()
      --this is to include selfhosed bitbucket instances that are not worth 
      --shareing in a public configuration. if the file will not be present 
      --we'll just ignore it
      pcall(require, "fubitive_cfg")
    end
  },

  -- [themes]
  {
    'mikker/vim-togglebg',
    priority = 1000,
    dependencies = {
      'ellisonleao/gruvbox.nvim',
      --'gruvbox-community/gruvbox',
      -- 'overcache/NeoSolarized',
    },
    config = function ()
      require('togglebg-setup').config()
    end
    },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- find in files that uses the quick list window 
  { 'dyng/ctrlsf.vim',
       config = function()
         -- exclude .git and .gitignore from file search in ctrlp
         vim.g.ctrlp_user_command = {'.git', 'cd %s && git ls-files -co --exclude-standard'}
         vim.g.ctrlp_show_hidden = 1
         vim.g.ctrlsf_default_view_mode = 'compact'
       end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- markdown
  { 'plasticboy/vim-markdown', ft = {'markdown'}},
  { 'godlygeek/tabular', ft = {'markdown'}},
  -- asciidoc 
  { 'habamax/vim-asciidoctor',
        ft = {'ASCII', 'text', 'asciidoc', 'adoc', 'asciidoctor'},
        config = function()
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
        end
  },
  -- session management
  {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
    },
  }
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  }, {})

-- vim: ts=2 sts=2 sw=2 et
