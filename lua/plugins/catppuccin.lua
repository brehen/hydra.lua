local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 999
}

function M.config() 
  local catppuccin = require("catppuccin")
  catppuccin.setup({
      flavour = "macchiato"
  })
  vim.cmd([[colorscheme catppuccin]])
end


return M
