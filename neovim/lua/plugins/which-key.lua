local M = {}
M._start = 0

local function config()
  -- default configuration
end

function M.goLazy()
  return {
    'folke/which-key.nvim',
    config = function()
      config()
    end,
  }
end

return M
