local status, nvim_lsp = pcall(require, 'lspconfig')

if (not status) then return end

local on_attach = function(client, bufnr)
	--formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		if client.name == 'tsserver' then
			vim.api.nvim_command [[autocmd BufWritePre <buffer> Prettier]]
		else
			vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })]]
		end
		vim.api.nvim_command [[augroup END]]
	end
end

nvim_lsp.sumneko_lua.setup {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}

require('lspconfig')['intelephense'].setup {
	on_attach = on_attach('intelephense', { timeout_ms = 5000 }),
}

require('lspconfig')['pyright'].setup {
	on_attach = on_attach,
}

require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
}

require('lspconfig')['rust_analyzer'].setup {
	on_attach = on_attach,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {}
	}
}
