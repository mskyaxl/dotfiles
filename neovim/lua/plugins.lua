local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  --vim airline
  use {
    'vim-airline/vim-airline',
    requires = { 
      {'vim-airline/vim-airline-themes'},
      {'bling/vim-bufferline'}
    },
    config = function()
      vim.g["airline#extensions#tabline#enabled"] = 1
    end
  }
  --    [git]
  use 'ryanoasis/vim-devicons'
  use {'airblade/vim-gitgutter',
       config = function()
         vim.g.gitgutter_override_sign_column_highlight = 0
         -- vim-gitgutter used to do this by default:
         vim.cmd [[highlight! link SignColumn LineNr]]
       end
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {'tpope/vim-fugitive',
        requires = { 
            {'mskyaxl/vim-fubitive'},
            {'tpope/vim-rhubarb'}
        },
        config = function()
          local status, lfs = pcall(require, "fubitive_cfg")
          if(status) then
              --lfs exists, so use it.
          end
        end
  }
  use 'jreybert/vimagit'

  use 'duggiefresh/vim-easydir'
  --  [tmux]
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'tmux-plugins/vim-tmux'
  use 'kshenoy/vim-signature'
  use 'terrortylor/nvim-comment'
  -- [themes]
  use {'mikker/vim-togglebg',
       requires = {
           {'gruvbox-community/gruvbox'},
           {'overcache/NeoSolarized'}
       },
       config = function() 
         -- Hack to avoid first calling togglebg#map on <F5>
         vim.g.background=dark
         --vim.colorscheme = "gruvbox"
         vim.cmd [[colorscheme gruvbox]]
         vim.g.no_plugin_maps = 1
         vim.fn['togglebg#map']("<F6>")
         vim.g.no_plugin_maps = nil
       end
  }
  -- colors
  use 'ap/vim-css-color'
  -- markdown
  use { 'plasticboy/vim-markdown', ft = {'markdown'}}
  use { 'godlygeek/tabular', ft = {'markdown'}}
  -- asciidoc 
  use { 'habamax/vim-asciidoctor',
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
    }

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- session management
  use 'tpope/vim-obsession'
  use 'dhruvasagar/vim-prosession'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
     'nvim-telescope/telescope-fzf-native.nvim',
     run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
  }
  use 'p00f/clangd_extensions.nvim'
  use { 'rhysd/vim-clang-format',
      run = function()
        vim.g['clang_format#detect_style_file'] = 1
      end
  }

  -- Find in files
  use {'ctrlpvim/ctrlp.vim',
       config = function()
         vim.g.ctrlsf_compact_position = 'bottom_inside'
         vim.g.ctrlsf_populate_qflist = 1
         vim.g.ctrlsf_default_view_mode = 'compact'
       end
  }
  use { 'dyng/ctrlsf.vim',
       config = function()
         -- exclude .git and .gitignore from file search in ctrlp
         vim.g.ctrlp_user_command = {
                '.git', 'cd %s && git ls-files -co --exclude-standard'}
         vim.g.ctrlp_show_hidden = 1   
       end
  }
 
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
