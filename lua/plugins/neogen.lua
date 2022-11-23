local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
  return
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true, desc = "Generate module docs for current function" }

keymap.set("n", "<leader>ng", ":lua require('neogen').generate()<CR>", opts)

neogen.setup({})
