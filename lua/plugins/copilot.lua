local status_ok, cmp = pcall(require, "copilot_cmp")
if not status_ok then
  return
end

cmp.setup({
  method = "getCompletionsCycling",
})

-- cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)
--
-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)
