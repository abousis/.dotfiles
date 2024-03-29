local on_attach = function(client, bufnr)
	--formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })]]
		vim.api.nvim_command [[augroup END]]
	end
end

--Lua
require('lspconfig')['lua_ls'].setup {
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

--PHP
require('lspconfig')['intelephense'].setup {
	on_attach = on_attach,
}

--Python
require('lspconfig')['pyright'].setup {
	on_attach = on_attach,
}

--TypeScript
require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
}

--Go
require('lspconfig')['gopls'].setup {
	on_attach = on_attach,
}

--C
require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	filetypes = { "c" }
}

--Rust
require('lspconfig')['rust_analyzer'].setup({
	on_attach = on_attach,
	settings = {
		['rust-analyzer'] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				allFeatures = true,
				command = 'clippy',
			},
			procMacro = {
				ignored = {
					['async-trait'] = { 'async_trait' },
					['napi-derive'] = { 'napi' },
					['async-recursion'] = { 'async_recursion' },
				},
			},
		},
	},
})

--Tailwind
require('lspconfig')['tailwindcss'].setup {
	on_attach = on_attach,
}

--HTML
require('lspconfig')['html'].setup {
	on_attach = on_attach,
}
