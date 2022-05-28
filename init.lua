-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	--  use 'tpope/vim-fugitive' -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("jeffkreeftmeijer/vim-numbertoggle") -- Auto toggle hybrid number mode
	use({
		"folke/which-key.nvim",
		config = function()
			local ws = require("which-key")
			ws.setup({
				operators = {
					["<Leader>y"] = "Yank to clipboard",
				},
			})
			ws.register({
				["<"] = { "<gv", "Deindent lines" },
				[">"] = { ">gv", "Indent lines" },
				["<Leader>y"] = "Yank to clipboard",
			}, {
				mode = "v",
			})

			ws.register({
				["cn"] = { "*``cgn", "Search and replace" },
				["cN"] = { "*``cgN", "Search and replace backwards" },
				J = { "mzJ`z", "Join lines" },
				["<Leader>y"] = "Yank to clipboard",
			})
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				disable_in_macro = true,
			})
		end,
	})
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	--  use { "ellisonleao/gruvbox.nvim" }
	use({ "mhartington/oceanic-next" }) -- Newest hotness theme
	use({ "xiyaowong/nvim-transparent" }) -- Transparent bg
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("wfxr/minimap.vim") -- Minimap
	use("elixir-editors/vim-elixir")
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
		end,
		requires = {
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"jose-elias-alvarez/null-ls.nvim",
			"williamboman/nvim-lsp-installer",
			"b0o/SchemaStore.nvim",
		},
	})

	use({

		"williamboman/nvim-lsp-installer",
		requires = "neovim/nvim-lspconfig",
		--        config = function()
		--          require("nvim-lsp-installer").setup {}
		--            local lspconfig = require("lspconfig")
		--           lspconfig.sumneko_lua.setup {}
		--      end
		-- }
	})
	-- Nerdtree alternative.
	use({ "ms-jpq/chadtree", branch = "chad" })
	-- Fast af code completion.
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use({ "ms-jpq/coq.thirdparty", branch = "3p" })
	use("github/copilot.vim")
	use({ "iamcco/markdown-preview.nvim" })
end)

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme
vim.o.termguicolors = true
vim.opt.background = "dark"
vim.cmd([[colorscheme OceanicNext]])
-- vim.cmd [[set guifont=Operator\ Mono\ LigFont:h14]]
-- vim.cmd [[set guifont=Operator\ Mono\ Lig:h14]]
vim.cmd([[set guifont=Operator\ Mono\ \Lig\,MesloLGS\ NF:h14]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

--Set statusbar
require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "onedark",
		component_separators = "|",
		section_separators = "",
	},
})

--Enable Comment.nvim
require("Comment").setup()

--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Auto start COQ
vim.g.coq_settings = { auto_start = true }

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Add shortcut for CHADopen
vim.keymap.set("n", "<Leader>v", ":CHADopen<CR>")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Indent blankline
require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})

-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

-- Enable telescope fzf native
require("telescope").load_extension("fzf")

--Add leader shortcuts
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files({ previewer = false })
end)
vim.keymap.set("n", "<leader>sb", require("telescope.builtin").current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>st", require("telescope.builtin").tags)
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").grep_string)
vim.keymap.set("n", "<leader>sp", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>so", function()
	require("telescope.builtin").tags({ only_current_buffer = true })
end)
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Neovide settings
vim.g["neovide_transparency"] = 0.9
-- vim.g["clipboard"] = "unnamedplus"
-- vim.g["clipboard"] = "unnamedplus"
vim.cmd([[set clipboard=unnamedplus]])
-- Coq thirdparty plugins
require("coq_3p")({
	{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
})
