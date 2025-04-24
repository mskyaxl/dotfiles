local M = {}
M._start = 0

function M.goLazy()
  return {
    { 'plasticboy/vim-markdown', ft = { 'markdown' } },
    { 'godlygeek/tabular',       ft = { 'markdown' } },
  }
end

return M
