local status_ok, navigator = pcall(require, "navigator")
if not status_ok then
  return
end

navigator.setup({
  mason = true,
  lsp = {
    disable_lsp = { "denols" },
    servers = {
      "astro",
    },
  },
})
