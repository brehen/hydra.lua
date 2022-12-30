vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugin")
require("base")

require("dashboard.alpha")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("commands")
    require("maps")
  end,
})
