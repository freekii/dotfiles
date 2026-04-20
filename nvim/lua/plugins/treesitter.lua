return {
	"nvim-treesitter/nvim-treesitter",
	-- Branch is now main by default, but you can be explicit
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local ts = require("nvim-treesitter")

		-- 1. Setup global Treesitter settings
		ts.setup({
			-- In the new 'main' branch, setup options are drastically simplified.
			-- Most old 'modules' are gone; it primarily handles the install directory now.
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- 2. Ensure parsers are installed
		-- This call is now the standard way to manage your language list.
		ts.install({
			"typescript",
			"yaml",
			"terraform",
			"javascript",
			"graphql",
			"json",
			"kotlin",
			"java",
			"lua",
		})

		-- 3. Core Highlighting (Enabled via Neovim API in new versions)
		-- Many users now enable highlighting via an autocmd or a simple loop
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Only start if a parser is actually available for this filetype
				if pcall(vim.treesitter.start) then
					vim.treesitter.start()
				end
			end,
		})

		-- 4. Your existing Autopairs logic
		local npairs = require("nvim-autopairs")
		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})
	end,
}
