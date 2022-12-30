local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.fish_indent,
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.shellcheck,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.diagnostics.luacheck,
      nls.builtins.diagnostics.selene.with({
        condition = function(utils)
          return utils.root_has_file({ "selene.toml" })
        end,
      }),
      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.flake8,
      -- html
      nls.builtins.formatting.tidy,
      nls.builtins.formatting.gofmt,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.mix,
      nls.builtins.diagnostics.credo,
      nls.builtins.formatting.rustywind,
      nls.builtins.formatting.rustfmt,
    },
    on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  })
end

function M.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
