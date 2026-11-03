-- 4-space default; .editorconfig overrides this when a project sets its own
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

local function map(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { buffer = true, desc = desc })
end

-- run
map("<leader>jr", "<Cmd>JavaRunnerRunMain<CR>", "Java: run main")
map("<leader>js", "<Cmd>JavaRunnerStopMain<CR>", "Java: stop main")
map("<leader>jl", "<Cmd>JavaRunnerToggleLogs<CR>", "Java: toggle logs")

-- single-file run (JDK 11+ source launcher), works without a project
map("<leader>jj", function()
	vim.cmd("write")
	local file = vim.fn.shellescape(vim.fn.expand("%:p"))
	Snacks.terminal("java " .. file, { win = { position = "bottom" }, auto_close = false, start_insert = true })
end, "Java: run current file")

-- same, feeding stdin from input.txt next to the file (HackerRank style)
map("<leader>ji", function()
	vim.cmd("write")
	local file = vim.fn.shellescape(vim.fn.expand("%:p"))
	local input = vim.fn.shellescape(vim.fn.expand("%:p:h") .. "/input.txt")
	Snacks.terminal("java " .. file .. " < " .. input, { win = { position = "bottom" }, auto_close = false, start_insert = true })
end, "Java: run current file with input.txt")
