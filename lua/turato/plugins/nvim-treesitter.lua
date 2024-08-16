return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
		{
			"nvim-treesitter/nvim-treesitter-context", -- Show code context
			opts = { enable = true, mode = "topline", line_numbers = true },
		},
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		--https://github.com/LazyVim/LazyVim/discussions/2536
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = { "markdown" },
		-- 	callback = function(ev)
		-- 		-- treesitter-context is buggy with Markdown files
		-- 		require("treesitter-context").disable()
		-- 	end,
		-- })

		treesitter.setup({
			ensure_installed = {
				"csv",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"javascript",
				"json",
				"lua",
				-- "markdown",
				-- "markdown_inline",
				"proto",
				"python",
				"rego",
				"ruby",
				"sql",
				"svelte",
				"yaml",
				"php",
				"c",
				"cpp",
			},
			indent = { enable = true },
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				disable = { "csv" }, -- preferring chrisbra/csv.vim
				additional_vim_regex_highlighting = { "ruby" },
			},
			textobjects = { select = { enable = true, lookahead = true } },
		})
	end,
}
