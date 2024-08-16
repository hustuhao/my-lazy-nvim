return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>nf", "<Cmd>NvimTreeFindFile<cr>", desc = "NvimTree Find file" },
		{ "<leader>nt", "<Cmd>NvimTreeToggle<cr>",   desc = "Toggle NvimTree" },
	},

	config = function()
		local api = require("nvim-tree.api")
		local function opts(desc)
			return {
				desc = "nvim-tree: " .. desc,
				buffer = bufnr,
				noremap = true,
				silent = true,
				nowait = true,
			}
		end

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- custom mappings
		vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		-- Default mappings. Feel free to modify or remove as you wish.
		-- https://github.com/devins2518/dotfiles/blob/87113ef5bd47afac75bd02ed57a1e93554570e02/HM/nvim/lua/nvimTree.lua#L4
		-- BEGIN_DEFAULT_ON_ATTACH
		vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
		vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
		vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
		vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
		vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
		vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
		vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
		vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
		vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
		vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Name"))
		vim.keymap.set("n", "yrp", api.fs.copy.relative_path, opts("Copy Relative Path"))
		-- END_DEFAULT_ON_ATTACH

		require("nvim-tree").setup({})
	end,
}
