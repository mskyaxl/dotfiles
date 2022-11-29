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
  use 'tpope/vim-fugitive'
  use 'jreybert/vimagit'
  use 'duggiefresh/vim-easydir'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'tmux-plugins/vim-tmux'
  -- Theme / Pretty stuff
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'
  use 'kshenoy/vim-signature'

  use 'overcache/NeoSolarized'
  use 'gruvbox-community/gruvbox'
  use 'mikker/vim-togglebg'
  use 'ap/vim-css-color'
  -- markdown
  use { 'plasticboy/vim-markdown', ft = 'md'}
  use { 'godlygeek/tabular', ft = 'md'}
  -- asciidoc 
  use { 'habamax/vim-asciidoctor', ft = 'md'}
  --vim airline
  use {
    'vim-airline/vim-airline',
    requires = { 
      {'vim-airline/vim-airline-themes'},
      {'bling/vim-bufferline'}
    }
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

  -- Find in files
  use 'ctrlpvim/ctrlp.vim'
  use 'dyng/ctrlsf.vim'
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
