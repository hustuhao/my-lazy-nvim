local handlers = {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- Next, you can provide targeted overrides for specific servers.
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	["dockerls"] = function()
		local lspconfig = require("lspconfig")
		settings = {
			docker = {
				languageserver = {
					formatter = {
						ignoreMultilineInstructions = true,
					},
				},
			},
		}
		lspconfig.dockerls.setup({
			filetypes = { "dockerfile", "Dockerfile", "df" },
		})
	end,
	--[[
	["marksman"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.marksman.setup({
			filetypes = { "markdown", "MD", "md" },
		})
	end,
	--]]
}

return {

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"pyright",
				"bashls",
				"lua_ls",
				"vimls",
				"jdtls",
				"html",
				"docker_compose_language_service",
				"dockerls",
				"dockerfile-language-server",
				"marksman", -- use markdown.nvim
				"sqlfmt",
				"prettier",
				"prettierd",
				"yamlfmt",
			},
			automatic_installation = true,
			handlers = handlers,
		})
	end,
}
