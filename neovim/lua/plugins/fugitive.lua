return {
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
}
