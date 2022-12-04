-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
}

M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true, italic = true },
  NvimTreeOpenedFile = { fg = "teal", bold = true, italic = true },
}

vim.cdm([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

return M
