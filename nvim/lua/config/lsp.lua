vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "graphql", "pyright", "yaml", "terraformls", "jdtls" })

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})
