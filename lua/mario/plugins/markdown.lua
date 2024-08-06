return {
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = "render-markdown",                                                  -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		-- config = function()
		-- 	-- 设置快捷键来启用、禁用和切换插件
		--
		-- 	-- 启用 render-markdown 插件
		-- 	vim.api.nvim_set_keymap("n", "<leader>me", ":RenderMarkdown enable<CR>", { noremap = true, silent = true })
		--
		-- 	-- 禁用 render-markdown 插件
		-- 	vim.api.nvim_set_keymap("n", "<leader>md", ":RenderMarkdown disable<CR>", { noremap = true, silent = true })
		--
		-- 	-- 切换 render-markdown 插件
		-- 	vim.api.nvim_set_keymap("n", "<leader>mt", ":RenderMarkdown toggle<CR>", { noremap = true, silent = true })
		-- end,
		keys = {
			{ "<leader>mde", "<Cmd>RenderMarkdown enable<CR>",  mode = "n", desc = ":RenderMarkdown enable<CR>" },
			{ "<leader>mdd", "<Cmd>RenderMarkdown disable<CR>", mode = "n", desc = ":RenderMarkdown disable<CR>" },
			{ "<leader>mdt", "<Cmd>RenderMarkdown toggle<CR>",  mode = "n", desc = ":RenderMarkdown toggle<CR>" },
		},
	},
}
