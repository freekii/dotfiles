return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
			update_focused_file = {
				enable = true,
			},
			view = {
				side = "right",
				adaptive_size = true,
			},
		})
	end,
}
