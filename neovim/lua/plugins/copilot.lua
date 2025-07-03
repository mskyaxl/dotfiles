local M = {}
M._start = 0

function M.goLazy()
  return {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        -- { "github/copilot.vim" },                     -- or zbirenbaum/copilot.lua
        {
          "zbirenbaum/copilot.lua",
          cmd = "Copilot",
          event = "InsertEnter",
          config = function()
            require("copilot").setup({})
          end,
        },
        { "nvim-lua/plenary.nvim", branch = "master" },     -- for curl, log and async functions
      },
      build = "make tiktoken",                              -- Only on MacOS or Linux
      opts = {
        -- See Configuration section for options
      },
      config = function()
        -- return ':Copilot disable'
            require("CopilotChat").setup({})
      end,
      -- See Commands section for default commands if you want to lazy load on them
    },
  }
end

return M
