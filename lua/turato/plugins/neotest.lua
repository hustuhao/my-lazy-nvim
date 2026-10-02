return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"nvim-treesitter/nvim-treesitter",
		-- v2 需要 Treesitter main；当前配置仍使用 master/configs API。
		{ "fredrikaverpil/neotest-golang", version = "^1" },
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang")({
					go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>rt",
			function()
				require("neotest").run.run()
			end,
			desc = "运行光标附近测试",
		},
		{
			"<leader>rf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "运行当前文件测试",
		},
		{
			"<leader>ra",
			function()
				require("neotest").run.run(vim.fn.getcwd())
			end,
			desc = "运行当前目录全部测试",
		},
		{
			"<leader>rl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "重复上一次测试",
		},
		{
			"<leader>rs",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "测试结果树",
		},
		{
			"<leader>ro",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "查看测试输出",
		},
		{
			"<leader>rO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "测试输出面板",
		},
		{
			"<leader>rx",
			function()
				require("neotest").run.stop()
			end,
			desc = "停止测试",
		},
		{
			"<leader>rd",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "调试光标附近测试",
		},
	},
}
