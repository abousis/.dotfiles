require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { 'typescript-language-server', 'rust-analyzer', 'lua-language-server' }
}
