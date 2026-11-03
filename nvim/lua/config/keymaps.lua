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
vim.keymap.set("n", "<leader>gs", telescope_builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>gS", telescope_builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>gt", telescope_builtin.lsp_type_definitions, {})
-- nvim tree
vim.keymap.set("n", "<leader>ntt", "<Cmd>NvimTreeToggle<CR>")
-- buffers
vim.keymap.set("n", "<leader>bca", "<Cmd>BufferCloseAllButCurrent<CR>")

-- formatting (conform.nvim)
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		bufnr = vim.api.nvim_get_current_buf(),
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end)

-- gitsigns
local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>pl", gitsigns.preview_hunk)

-- java template in the current buffer for quick experiments (leetcode, interviews)
vim.keymap.set("n", "<leader>jn", function()
	local buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local has_content = #lines > 1 or lines[1] ~= ""
	if has_content and vim.fn.confirm("Replace buffer contents with Java template?", "&Yes\n&No", 2) ~= 1 then
		return
	end

	-- unnamed buffers get a file in the current directory (Main.java, Main1.java, ...)
	-- so the run keymaps have something to execute
	local class_name = "Main"
	local current = vim.api.nvim_buf_get_name(buf)
	if current == "" then
		local i = 0
		while vim.uv.fs_stat(vim.fn.getcwd() .. "/" .. class_name .. ".java") do
			i = i + 1
			class_name = "Main" .. i
		end
		vim.api.nvim_buf_set_name(buf, vim.fn.getcwd() .. "/" .. class_name .. ".java")
	else
		class_name = vim.fn.fnamemodify(current, ":t:r")
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
		"import java.io.*;",
		"import java.util.*;",
		"",
		"public class " .. class_name .. " {",
		"    public static void main(String[] args) throws IOException {",
		"        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));",
		"        ",
		"    }",
		"}",
	})
	vim.bo[buf].filetype = "java"
	vim.api.nvim_win_set_cursor(0, { 7, 8 })
end, { desc = "Java: insert template in current buffer" })
