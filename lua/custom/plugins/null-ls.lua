local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  b.diagnostics.tsc,
  b.formatting.rustywind,
  -- webdev code actions
  b.code_actions.eslint_d,
  b.code_actions.refactoring,

  -- code spelling
--  b.diagnostics.codespell,
--  b.diagnostics.misspell,
  b.diagnostics.proselint,
  b.diagnostics.write_good,

  -- python
  b.diagnostics.ruff,
  b.formatting.black,


  -- elixir
  b.diagnostics.credo,
  b.formatting.mix,

  -- markdown
  b.diagnostics.markdownlint,
  b.formatting.markdownlint,
  b.formatting.markdown_toc,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  -- rust
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

