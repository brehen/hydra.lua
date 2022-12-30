return {
  -- Bionic reading 🤖
  "nullchilly/fsread.nvim",
  -- rip grep search
  "BurntSushi/ripgrep",
  -- Dashboard
  "kyazdani42/nvim-web-devicons", -- Lsp
  "williamboman/mason-lspconfig.nvim",
  "jayp0521/mason-null-ls.nvim",
  -- Cmp
  -- "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  --  "L3MON4D3/LuaSnip",
  -- TreeSitter
  -- "nvim-treesitter/nvim-treesitter-textobjects",
  -- Telescope
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-project.nvim",
  -- Language support
  "leafOfTree/vim-svelte-plugin",
  -- Unsure
  -- "windwp/nvim-ts-autotag",
  -- Auto toggle hybrid number mode
  "jeffkreeftmeijer/vim-numbertoggle",
  -- Common utils
  "nvim-lua/plenary.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "folke/which-key.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = {
      plugins = {
        gitsigns = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>ng",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    config = { snippet_engine = "luasnip" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },
}
