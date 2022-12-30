-- Markdown preview using Deno. Doesn't work as of now, but I"m curious to see if it will in the future.

local M = {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  enabled = false,
  keys = {
    {
      "<leader>op",
      function()
        local peek = require("peek")
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      desc = "Peek (Markdown Preview)",
    },
  },
}

return M
