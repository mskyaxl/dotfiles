local M = {}
M._start = 0

function M.goLazy()
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
end

return M

-- vim: ts=2 sts=2 sw=2 etc
