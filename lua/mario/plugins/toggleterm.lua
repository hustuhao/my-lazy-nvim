return {

	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{
			"<leader>te",
			function()
				require("toggleterm.terminal").Terminal
					:new({
						direction = "float",
					})
					:toggle()
			end,
			desc = "Lazydocker",
		},
		{
			"<leader>t",
			function()
				require("toggleterm.terminal").Terminal
					:new({
						direction = "horizontal",
					})
					:toggle()
			end,
			desc = "LazyHorizontalTerm",
		},
	},
	opts = {
		highlights = {
			NormalNC = { link = "NormalNC" },
			StatusLine = { link = "StatusLine" },
			StatusLineNC = { link = "StatusLineNC" },
			WinBar = { link = "WinBar" },
			WinBarNC = { link = "WinBarNC" },
		},
		size = 10,
		on_create = function()
			vim.opt.foldcolumn = "0"
			vim.opt.signcolumn = "no"
		end,
		-- shade_terminals = false,
		-- shading_factor = 100,
		direction = "float",
		float_opts = { border = "rounded" },
	},
	config = function()
		require("toggleterm").setup({
			shade_terminals = false,
			-- shell = "zsh --login",
		})
		-- key maps
	end,
}
