return {
	-- add gruvbox
	-- { "ellisonleao/gruvbox.nvim" },
	--   {
	--		"LazyVim/LazyVim",
	--		opts = {
	--			colorscheme = "darcula",
	--		},
	--	},
	-- add darcula-dark
	--	"xiantang/darcula-dark.nvim",
	--	dependencies = {
	--        "nvim-treesitter/nvim-treesitter",
	--        "nvim-treesitter/nvim-treesitter-textobjects"
	--    },
	-- Configure LazyVim to load gruvbox
	--	{
	--        "doums/darcula",
	--        config = function()
	--            vim.cmd([[colorscheme darcula]])
	--        end
	-- }
	--

	-- add darcula
	{ "doums/darcula" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "darcula",
		},
	},
}
