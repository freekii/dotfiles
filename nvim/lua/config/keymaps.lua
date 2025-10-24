-- LSP Actions
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "I", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "<leader>gu", vim.lsp.buf.rename, {})

-- barbar
vim.keymap.set("n", "<leader>wq", "<Cmd>:BufferClose<CR>", {})
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

-- telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>o", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", telescope_builtin.live_grep, {})
-- telescope lsp actions
vim.keymap.set("n", "<leader>gd", telescope_builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>gr", telescope_builtin.lsp_references, {})
vim.keymap.set("n", "<leader>gi", telescope_builtin.lsp_implementations, {})

-- formatting (conform.nvim)
vim.keymap.set({ "n", "v" }, "<leader>gf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end)
