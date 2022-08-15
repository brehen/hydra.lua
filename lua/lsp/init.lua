local utils = require("lsp.utils")
local lsp_installer = require("nvim-lsp-installer")

local default_server_config = utils.base_config

---Configs for known LSP servers.
---Presence of a server in this table means it will get installed
---by `:InstallDefaultLspServers`
local server_configs = {
	-- Use null_ls for formatting
	jsonls = require("lsp.jsonls").config,
	-- Conflicts with prettier formatting in TS files.
	--	stylelint_lsp = utils.base_config_without_formatting,
	sumneko_lua = require("lsp.lua").config,
	tsserver = require("lsp.tsserver").config,
	rust_analyzer = default_server_config,
	bashls = default_server_config,
	cssls = default_server_config,
	svelte = default_server_config,
	elixirls = default_server_config,
	prismals = default_server_config,
	tailwindcss = default_server_config,
	eslint = default_server_config,
	yamlls = default_server_config,
	vimls = default_server_config,
}

lsp_installer.setup({
	ensure_installed = vim.tbl_keys(server_configs),
})

local lspconfig = require("lspconfig")
local coq = require("coq")

local function setup_lsp_servers()
	for server_name, server_config in pairs(server_configs) do
		--		lspconfig[server_name].setup(server_config)
		lspconfig[server_name].setup(coq.lsp_ensure_capabilities(server_config))
	end
end

setup_lsp_servers()

require("lsp.null-ls").setup()

local function use_icons_for_diagnostic_signs()
	-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

use_icons_for_diagnostic_signs()

-- require("auto-nvimrc").execute_nvimrcs()
