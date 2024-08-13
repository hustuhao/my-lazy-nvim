return {
	"hustuhao/markdown-codeblock-format.nvim",
	config = function()
		local opts = {
			-- Define the formatters to use for each language
			formatters = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				sh = { "shfmt" },
				sql = { "sqlfmt" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt" },
				json = { "jq" },
			},
		}
		require("turato.mcf").setup(opts)
		--require("turato.log").level = vim.log.levels.DEBUG
	end,
	keys = {
		-- Define key mappings using the 'keys' configuration in LazyVim
		{
			"<leader>fm",
			':lua require("turato.mcf").format_selected_code()<CR>',
			mode = "v", -- Visual mode
			noremap = true,
			silent = true,
			desc = "Format selected code block", -- Description for the key mapping
		},
	},
}
