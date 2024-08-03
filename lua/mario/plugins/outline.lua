return {
	-- https://github.com/hedyhli/outline.nvim
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
		require("outline").setup({})
	end,
}
