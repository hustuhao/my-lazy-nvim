return {
	"gbprod/yanky.nvim",
	event = "VeryLazy",
	opts = { ring = { storage = "shada", history_length = 100 } },
	keys = {
		{ "<leader>yh", "<cmd>YankyRingHistory<cr>", desc = "复制历史" },
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, remap = true, desc = "复制并记录历史" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, remap = true, desc = "在光标后粘贴" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, remap = true, desc = "在光标前粘贴" },
		{ "[y", "<Plug>(YankyCycleBackward)", remap = true, desc = "切换到上一条复制内容" },
		{ "]y", "<Plug>(YankyCycleForward)", remap = true, desc = "切换到下一条复制内容" },
	},
}
