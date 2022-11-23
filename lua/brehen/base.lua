vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true

vim.opt.autoindent = true -- New
vim.opt.backspace = { "start", "eol", "indent" } -- New
vim.opt.backup = false -- New
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- New
vim.opt.breakindent = true
vim.opt.cmdheight = 1 -- New
vim.opt.expandtab = true -- New
-- Set highlight on search
vim.opt.hlsearch = false
-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.inccommand = "split" -- New
vim.opt.laststatus = 2 -- New
-- Finding files - Search down into subfolders
vim.opt.path:append({ "**" }) -- New
vim.opt.scrolloff = 10 -- New
-- Set terminal in nvim to fish
vim.opt.shell = "fish" -- New, OK
vim.opt.shiftwidth = 2
vim.opt.showcmd = true -- New
vim.opt.smartcase = true
vim.opt.smartindent = true -- New
vim.opt.smarttab = true -- New
vim.opt.tabstop = 2
vim.opt.title = true -- New
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.wildignore:append({ "*/node_modules/*" }) -- New
-- No Wrap lines
vim.opt.wrap = false -- New

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Ray so options
vim.g.ray_options = "colors=breeze&padding=64"
