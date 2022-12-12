local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.wo.number = true

opt.autoindent = true -- New
opt.backspace = { "start", "eol", "indent" } -- New
opt.backup = false -- New
opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- New
opt.breakindent = true
opt.cmdheight = 1 -- New
opt.expandtab = true -- New
-- Set highlight on search
opt.hlsearch = false
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.inccommand = "split" -- New
opt.laststatus = 2 -- New
-- Finding files - Search down into subfolders
opt.path:append({ "**" }) -- New
opt.scrolloff = 10 -- New
-- Set terminal in nvim to fish
opt.shell = "fish" -- New, OK
opt.shiftwidth = 2
opt.showcmd = true -- New
opt.smartcase = true
opt.smartindent = true -- New
opt.smarttab = true -- New
opt.tabstop = 2
opt.title = true -- New
opt.undofile = true
opt.termguicolors = true
opt.wildignore:append({ "*/node_modules/*" }) -- New
-- No Wrap lines
opt.wrap = false -- New

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
-- Add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Ray so options
vim.g.ray_options = "colors=breeze&padding=64"
