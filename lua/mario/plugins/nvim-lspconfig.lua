return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- 配置 pyright 或 pylsp
			--lspconfig.pyright.setup({
			--capabilities = capabilities,
			--on_attach = function(client, bufnr)
			-- 设置键位映射，比如代码导航和补全
			--	vim.api.nvim_buf_set_keymap(
			--		bufnr,
			--		"n",
			--		"gd",
			--		"<Cmd>lua vim.lsp.buf.definition()<CR>",
			--		{ noremap = true, silent = true }
			--	)
			--	vim.api.nvim_buf_set_keymap(
			--		bufnr,
			--		"n",
			--		"gr",
			--		"<Cmd>lua vim.lsp.buf.references()<CR>",
			--		{ noremap = true, silent = true }
			--	)
			--end,
			--})
		end,
	},
}
