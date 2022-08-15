local dap = require("dap")

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. ".config/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.typescript = {
	{
		type = "",
		request = "launch",
		name = "Launch Program (Node2 with ts-node)",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "-r", "ts-node/register" },
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		sourceMaps = true,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
	{
		type = "node2",
		request = "attach",
		name = "Attach Program (Node2 with ts-node)",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		skipFiles = { "<node_internals>/**" },
		port = 9229,
	},
	{
		type = "node2",
		request = "launch",
		name = "Launch Test Program (Node2 with Jest)",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
		sourceMaps = true,
		port = 9229,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
}
