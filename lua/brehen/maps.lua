local keymap = vim.keymap

-- Set leader key to space
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Increment / Decrement on line
keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<leader>a", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("n", "<C-Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

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
