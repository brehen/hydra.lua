return {
  "nvim-neotest/neotest",
  -- Example for loading neotest-go with a custom config
  adapters = {
    require("neotest-vitest"),
  },
  status = { virtual_text = true },
  output = { open_on_run = true },
  quickfix = {
    open = function()
      if require("lazyvim.util").has("trouble.nvim") then
        vim.cmd("Trouble quickfix")
      else
        vim.cmd("copen")
      end
    end,
  },
}
