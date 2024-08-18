return {
	"hustuhao/markdown-codeblock-format.nvim",
	ft = { "md", "markdown" },
	-- config = function()
	-- 	params = {
	-- 		-- Define the formatters to use for each language
	-- 		formatters = {
	-- 			lua = { "stylua" },
	-- 			python = { "black" },
	-- 			javascript = { "prettier" },
	-- 			sh = { "shfmt" },
	-- 			sql = { "sqlfmt" },
	-- 			go = { "goimports", "gofmt" },
	-- 			rust = { "rustfmt" },
	-- 			json = { "jq11" },
	-- 			yml = { "prettier" },
	-- 		},
	-- 	}
	-- 	require("mcf").setup(params)
	-- 	require("mcf.log").level = vim.log.levels.DEBUG
	-- end,

	opts = {
		-- Define the formatters to use for each language
		formatters = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			sh = { "shfmt" },
			sql = { "sqlfmt" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			json = { "jq11" },
			yaml = { "yamlfmt" },
			yml = { "yamlfmt" },
		},
	},

	keys = {
		-- Define key mappings using the 'keys' configuration in LazyVim
		{
			"<leader>fm",
			':lua require("mcf").format_selected_code()<CR>',
			mode = "v", -- Visual mode
			noremap = true,
			silent = true,
			desc = "Format selected code block", -- Description for the key mapping
		},
	},
}
