return {
	"folke/flash.nvim",
	opts = {
		-- 保留原生 f/t/F/T 和现有 Go A/V/S 映射。
		modes = { char = { enabled = false } },
	},
	keys = {
		{
			"<leader>jj",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash 快速跳转",
		},
		{
			"<leader>jt",
			function()
				require("flash").treesitter()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash 选择语法节点",
		},
	},
}
