return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		vim.keymap.set("n", "<leader>wq", "<Cmd>:BufferClose<CR>", {})
		-- Move to previous/next
		vim.keymap.set("n", "<leader>1", "<Cmd>BufferGoto 1<CR>")
		vim.keymap.set("n", "<leader>2", "<Cmd>BufferGoto 2<CR>")
		vim.keymap.set("n", "<leader>3", "<Cmd>BufferGoto 3<CR>")
		vim.keymap.set("n", "<leader>4", "<Cmd>BufferGoto 4<CR>")
		vim.keymap.set("n", "<leader>5", "<Cmd>BufferGoto 5<CR>")
		vim.keymap.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>")
		vim.keymap.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>")
		vim.keymap.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>")
		vim.keymap.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>")
		vim.keymap.set("n", "<leader>0", "<Cmd>BufferLast<CR>")
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = false,
		-- insert_at_start = true,
		-- …etc.
	},
}
