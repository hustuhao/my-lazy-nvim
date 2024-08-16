return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"sindrets/diffview.nvim",
	},
	config = function()
		require("gitsigns").setup()
	end,
}
