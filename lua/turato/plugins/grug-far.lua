return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar", "GrugFarWithin" },
	opts = { headerMaxWidth = 80 },
	keys = {
		{ "<leader>sr", "<cmd>GrugFar<cr>", desc = "项目搜索替换" },
		{ "<leader>sr", ":GrugFar<cr>", mode = "x", desc = "搜索替换选中的文本" },
		{ "<leader>sR", ":GrugFarWithin<cr>", mode = "x", desc = "仅在选中范围内替换" },
	},
}
