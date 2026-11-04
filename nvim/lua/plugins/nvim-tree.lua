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
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
			},
			view = {
				side = "right",
				adaptive_size = true,
			},
		})

		-- Root the tree at a directory passed on the command line without opening it
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
					vim.cmd.cd(arg)
				end
			end,
		})
	end,
}
