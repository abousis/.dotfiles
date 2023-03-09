local null_ls = require("null-ls")

local my_sources = {
	null_ls.builtins.formatting.prettier.with({
		filetypes = {
			"javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown", "md", "txt"
		},
	}),
	null_ls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
		prefer_local = "vendor/bin",
	}),
	null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
		prefer_local = "vendor/bin",
	}),
}

null_ls.setup({
	debug = true,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	-- root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
	diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
	sources = my_sources
})
