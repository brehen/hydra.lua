local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["dw"] = { 'vb"_d', "Delete word backwards" },
    ["<leader>A"] = { "gg<S-v>G", "Select all"},
    ["<C-s>s"] = { ":split<Return><C-w>w" },
    ["<C-s>v"] = { ":vsplit<Return><C-w>w" }
  },
}
-- Select all

-- Split window

-- more keybinds!

return M
