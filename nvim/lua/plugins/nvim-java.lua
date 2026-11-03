return {
	"nvim-java/nvim-java",
	ft = "java",
	config = function()
		require("java").setup({
			spring_boot_tools = { enable = false },
			java_debug_adapter = { enable = false },
		})
		vim.lsp.enable("jdtls")
	end,
}
