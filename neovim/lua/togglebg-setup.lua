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
  if not string.match(vim.fn.system({ 'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme' }), '.*dark') then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

function M.config()
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


return M
