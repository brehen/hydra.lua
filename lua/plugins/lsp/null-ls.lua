local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = {
    -- typescript
    null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        "html",
        "json",
        "svelte",
        "markdown",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }),
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
    }),
    null_ls.builtins.code_actions.eslint_d.with({

      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
    }),
    null_ls.builtins.formatting.trim_whitespace.with({
      filetypes = { "plantuml" },
    }),
    -- lua
    null_ls.builtins.formatting.stylua,
    -- sshell
    null_ls.builtins.diagnostics.shellcheck,

    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.formatting.shfmt,
    -- docker
    null_ls.builtins.diagnostics.hadolint,
    -- markdown
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.markdownlint,
    -- python
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.formatting.black,
    -- write-good
    null_ls.builtins.diagnostics.write_good,
    --html
    null_ls.builtins.formatting.tidy,
    -- go
    null_ls.builtins.formatting.gofmt,
    -- fish terminal
    null_ls.builtins.diagnostics.fish,
    -- Elixir
    null_ls.builtins.formatting.mix,
    null_ls.builtins.diagnostics.credo,
    -- Tailwind
    null_ls.builtins.formatting.rustywind,
    -- Rust
    null_ls.builtins.formatting.rustfmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
