return {
	-- 配置 conform.nvim 插件
	{
		"stevearc/conform.nvim",
		config = function()
			-- 配置 Conform 插件
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettierd", "prettier" },
					go = { "goimports" },
					sh = { "shfmt" },
					sql = { "sqlfmt" },
					md = { "shfmt" },
					json = { "jq" },
					yaml = { "yamlfmt" },
					yml = { "yamlfmt" },
				},
				formatters = {},
				-- to format on save
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
