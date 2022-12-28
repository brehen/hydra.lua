local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

-- A new color scheme

vim.cmd([[packadd packer.nvim]])
-- vim.cmd([[colorscheme dracula]])
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme catppuccin-macchiato]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    -- Statusline
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  })
  use("nvim-lua/plenary.nvim") -- Common utilities
  use("jeffkreeftmeijer/vim-numbertoggle") -- Auto toggle hybrid number mode
  use({
    "onsails/lspkind-nvim",
    config = function()
      require("plugins.lsp.lspkind")
    end,
  }) -- vscode-like pictograms
  use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp")
    end,
  }) -- Completion
  use({
    "neovim/nvim-lspconfig",
    -- config = function()
    --   require("plugins.lsp.lspconfig")
    -- end,
  }) -- LSP
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls")
    end,
  }) -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  })
  use({
    "williamboman/mason.nvim",
    config = function()
      require("plugins.lsp.mason")
    end,
  })
  use("williamboman/mason-lspconfig.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use({
    -- "gc" to comment visual regions/lines
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment")
    end,
  })
  use({
    "ray-x/navigator.lua",
    requires = {
      { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("plugins.navigator")
    end,
  })
  -- use({
  --   -- LSP UIs
  --   "glepnir/lspsaga.nvim",
  --   config = function()
  --     require("plugins.lsp.lspsaga")
  --   end,
  -- })
  use("L3MON4D3/LuaSnip")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("plugins.treesitter")
    end,
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({ "nvim-treesitter/playground" })
  use({
    "danymat/neogen",
    config = function()
      require("plugins.neogen")
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  })
  use({
    -- File icons
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.web-devicons")
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
  })
  use("nvim-telescope/telescope-file-browser.nvim")
  use("nvim-telescope/telescope-project.nvim")
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.project")
    end,
  })
  use("BurntSushi/ripgrep")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs")
    end,
  })
  use("windwp/nvim-ts-autotag")
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.zen-mode")
    end,
  })
  use({
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key")
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use({
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("plugins.bufferline")
    end,
  })
  use({
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            keymap = {
              accept = "<C-f>",
              decline = "<C-e>",
            },
          },
        })
      end, 100)
    end,
  })
  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("plugins.copilot")
    end,
  })
  --	use("brehen/headwind.nvim")

  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse

  -- #FF0000
  -- Related to color
  --	use("Mofiqul/dracula.nvim")
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("s-u-d-o-e-r/vim-ray-so-beautiful")

  -- Startup screen
  use({
    "goolord/alpha-nvim",
    config = function()
      require("plugins.alpha")
    end,
  })
  -- Bionic reading 🤖
  use("nullchilly/fsread.nvim")
  -- Navic
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("plugins.octo")
    end,
  })
  --	use("elixir-editors/vim-elixir") -- Add support for elixir
  use("leafOfTree/vim-svelte-plugin")
  -- use({
  --   "mhanberg/elixir.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("plugins.elixir")
  --   end,
  -- })
  -- Github
  -- use("ldelossa/litee.nvim")
  -- use({
  -- 	"ldelossa/gh.nvim",
  -- 	requires = "ldelossa/litee.nvim",
  -- 	config = function()
  -- 		require("plugins.gh")
  -- 	end,
  -- })
end)
