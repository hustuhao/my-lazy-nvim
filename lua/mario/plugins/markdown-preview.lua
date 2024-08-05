-- install without yarn or npm
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		-- 设置快捷键来启用、禁用和切换 Markdown 预览

		-- 启用 Markdown 预览
		vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })

		-- 停止 Markdown 预览
		vim.api.nvim_set_keymap("n", "<leader>mps", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })

		-- 切换 Markdown 预览
		vim.api.nvim_set_keymap("n", "<leader>mpt", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
	end,
}
