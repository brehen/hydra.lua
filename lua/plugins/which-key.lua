local status, wk = pcall(require, "which-key")

if not status then
  return
end

wk.setup({
  window = {
    border = "double",
  },
})

wk.register({
  ["<leader>ns"] = { ":Ray<CR>", "Capture selected code block and send to ray.so", mode = "v" },
  ["<leader>nr"] = { ":FSToggle<CR>", "Turn on bionic reading" },
})
