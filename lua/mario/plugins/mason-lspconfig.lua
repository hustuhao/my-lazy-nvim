return {

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "pyright", "bashls", "lua_ls", "vimls", "jdtls", "html" },
			automatic_installation = true,
		})
	end,
}
