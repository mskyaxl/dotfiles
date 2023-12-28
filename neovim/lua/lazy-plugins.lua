-- initialize the colorscheme for the first run
-- hacky way of detecting the current theme
-- todo-find a DE independent way of getting this
-- see https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
local function redrawLine()
  require('lualine').setup()
end

local function setBackground()
  if string.match(vim.fn.system({ 'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme' }), '.*dark') then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end
end

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

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  --  [tmux]
  'tmux-plugins/vim-tmux-focus-events',
  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'tmux-plugins/vim-tmux',

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
  -- TODO prepare the dev env for C++
  -- check if clangd_extensions can be configured to work with mason

  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'
  -- Configurations for Nvim LSP
  -- use 'neovim/nvim-lspconfig'
  -- use {
  --       'nvim-treesitter/nvim-treesitter',
  --       run = function()
  --           local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --           ts_update()
  --       end,
  -- }
  -- 'p00f/clangd_extensions.nvim',
  -- { 'rhysd/vim-clang-format',
  --     build = function()
  --       vim.g['clang_format#detect_style_file'] = 1
  --     end
  -- },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  -- tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons' -- optional, for file icons
    },
  },
  -- colors
  'ap/vim-css-color',
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
      local status, lfs = pcall(require, "fubitive_cfg")
      if (status) then
        print(lfs)   --lfs exists, so use it.
      end
    end
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },

        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
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
    config = function()
      setBackground()
      vim.cmd.colorscheme 'gruvbox'

      -- Hack to avoid first calling togglebg#map on <F5>
      vim.g.no_plugin_maps = 1
      vim.fn['togglebg#map']("<F6>")
      vim.g.no_plugin_maps = nil

      -- react on SigUSR1 to swith between dark and light mode
      vim.api.nvim_create_autocmd({ "Signal" }, {
        callback = function()
          setBackground()
          vim.cmd.redraw()
          redrawLine()
        end
      })
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
