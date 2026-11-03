vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "graphql", "pyright", "yaml", "terraformls" })

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})
