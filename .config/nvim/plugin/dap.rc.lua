local dap = require('dap')
local dapui = require('dapui')

-- Dap UI configuration
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Keymaps
local keymap = vim.keymap
keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
keymap.set("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>")
keymap.set("n", "<F9>", ":lua require('dap').continue()<CR>")
keymap.set("n", "<F1>", ":lua require('dap').step_over()<CR>")
keymap.set("n", "<F2>", ":lua require('dap').step_into()<CR>")
keymap.set("n", "<F3>", ":lua require('dap').step_out()<CR>")

-- TypeScript/Node/React configuration
require('dap-vscode-js').setup({
	node_path = 'node',
	debugger_path = os.getenv("HOME") .. '/Dev/Tools/Debuggers/vscode-js-debug',
	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

local js_types = {
	'javascript',
	'typescript',
	'javascriptreact',
	'typescriptreact',
}

for i, js_type in ipairs(js_types) do
	dap.configurations[js_type] = {
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Current File (pwa-node)',
			cwd = vim.fn.getcwd(),
			args = { '${file}' },
			sourceMaps = true,
			protocol = 'inspector',
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Current File (pwa-node with ts-node)',
			cwd = vim.fn.getcwd(),
			runtimeArgs = { '--loader', 'ts-node/esm' },
			runtimeExecutable = 'node',
			args = { '${file}' },
			sourceMaps = true,
			protocol = 'inspector',
			skipFiles = { '<node_internals>/**', 'node_modules/**' },
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Current File (pwa-node with deno)',
			cwd = vim.fn.getcwd(),
			runtimeArgs = { 'run', '--inspect-brk', '--allow-all', '${file}' },
			runtimeExecutable = 'deno',
			attachSimplePort = 9229,
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Test Current File (pwa-node with jest)',
			cwd = vim.fn.getcwd(),
			runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
			runtimeExecutable = 'node',
			args = { '${file}', '--coverage', 'false' },
			rootPath = '${workspaceFolder}',
			sourceMaps = true,
			console = 'integratedTerminal',
			internalConsoleOptions = 'neverOpen',
			skipFiles = { '<node_internals>/**', 'node_modules/**' },
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Test Current File (pwa-node with vitest)',
			cwd = vim.fn.getcwd(),
			program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
			args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
			autoAttachChildProcesses = true,
			smartStep = true,
			console = 'integratedTerminal',
			skipFiles = { '<node_internals>/**', 'node_modules/**' },
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch Test Current File (pwa-node with deno)',
			cwd = vim.fn.getcwd(),
			runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
			runtimeExecutable = 'deno',
			attachSimplePort = 9229,
		},
		{
			type = 'pwa-chrome',
			request = 'attach',
			name = 'Attach Program (pwa-chrome = { port: 9222 })',
			program = '${file}',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			port = 9222,
			webRoot = '${workspaceFolder}',
		},
		{
			type = 'node2',
			request = 'attach',
			name = 'Attach Program (Node2)',
			processId = require('dap.utils').pick_process,
		},
		{
			type = 'node2',
			request = 'attach',
			name = 'Attach Program (Node2 with ts-node)',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			skipFiles = { '<node_internals>/**' },
			port = 9229,
		},
		{
			type = 'pwa-node',
			request = 'attach',
			name = 'Attach Program (pwa-node)',
			cwd = vim.fn.getcwd(),
			processId = require('dap.utils').pick_process,
			skipFiles = { '<node_internals>/**' },
		},
	}
end
