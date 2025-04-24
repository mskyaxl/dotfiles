local M = {}
M._start = 0

function M.goLazy()
  return {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
    },
  }
end

return M
