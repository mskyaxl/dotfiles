local M = {}
M._start = 0
-- initialize the colorscheme for the first run
-- hacky way of detecting the current theme
-- todo-find a DE independent way of getting this
-- see https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
local function redrawLine()
  require('lualine').setup()
end

local function setBackground()
  vim.o.background = 'dark'
  local gsettings = vim.fn.executable('gsettings') == 1
  if gsettings then
      local colorScheme = vim.fn.system({ 'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme' }) 
      if not string.match(colorScheme, '.*dark') then
       vim.o.background = 'light'
    end 
  end
end

local function configure()
  vim.cmd.colorscheme 'gruvbox'
  setBackground()
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

function M.goLazy()
  return {
    'mikker/vim-togglebg',
    priority = 1000,
    dependencies = {
      'ellisonleao/gruvbox.nvim',
      --'gruvbox-community/gruvbox',
      -- 'overcache/NeoSolarized',
    },
    config = function()
      configure()
    end
  }
end

return M
