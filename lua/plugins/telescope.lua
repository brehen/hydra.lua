return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions
    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
        file_ignore_patterns = { "node_modules", "deps", "_build", "priv", ".git" },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = false,
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function()
                vim.cmd("normal vbd")
              end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
          },
        },
      },
    })
    local builtin = require("telescope.builtin")

    telescope.load_extension("file_browser")
    vim.keymap.set("n", ";f", function()
      builtin.find_files({
        no_ignore = false,
        hidden = true,
      })
    end)
    vim.keymap.set("n", ";r", function()
      builtin.live_grep()
    end)
    vim.keymap.set("n", ";s", function()
      builtin.grep_string()
    end)
    vim.keymap.set("n", "\\\\", function()
      builtin.buffers()
    end)
    vim.keymap.set("n", ";t", function()
      builtin.help_tags()
    end)
    vim.keymap.set("n", ";;", function()
      builtin.resume()
    end)
    vim.keymap.set("n", ";e", function()
      builtin.diagnostics()
    end)
    vim.keymap.set("n", "<leader>sf", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end)
  end,
}
