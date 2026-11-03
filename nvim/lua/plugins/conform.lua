return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				go = { "gofumpt" },
				python = { "black" },
				java = { "google-java-format" },
			},
			format_on_save = function(bufnr)
				-- Java is formatted on demand only, to avoid reformatting existing projects
				if vim.bo[bufnr].filetype == "java" then
					return
				end
				return { lsp_fallback = true, timeout_ms = 2000 }
			end,
		})
	end,
}
