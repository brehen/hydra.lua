local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<leader>A", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")

-- Split window
keymap.set("n", "<C-s>s", ":split<Return><C-w>w")
keymap.set("n", "<C-s>v", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("n", "<C-Space>", "<C-w>w")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<leader>e", vim.diagnostic.open_float)
keymap.set("n", "{d", vim.diagnostic.goto_prev)
keymap.set("n", "}d", vim.diagnostic.goto_next)
keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
