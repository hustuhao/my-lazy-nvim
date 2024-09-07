return {
	--		https://github.com/exosyphon/nvim/blob/main/lua/plugins/telescope.lua
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = true,
		},
		{ "nvim-telescope/telescope-file-browser.nvim",   enabled = true },
		{ "nvim-telescope/telescope-dap.nvim",            enabled = true },
		{ "aaronhallaert/advanced-git-search.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", enable = true },
	},
	branch = "0.1.x",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		-- https://github.com/ayoubelmhamdi/nvim/blob/cc527e62efd24b7541d556490e12d639fd799626/lua/c_telescope.lua#L4
		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				prompt_prefix = "🔍",
				selection_caret = "» ",
				layout_config = {
					prompt_position = "bottom",
					horizontal = {
						width_padding = 0.04,
						height_padding = 0.1,
						preview_width = 0.5,
						preview_cutoff = 0,
					},
					vertical = {
						width_padding = 0.05,
						height_padding = 0.1,
						preview_height = 0.5,
					},
				},

				layout_strategy = "horizontal",
				-- layout_config = {
				-- 	prompt_position = "bottom",
				-- 	horizontal = {
				-- 		width_padding = 0.4,
				-- 		height_padding = 0.1,
				-- 		preview_width = 0.1,
				-- 		preview_cutoff = 0.1,
				-- 	},
				-- 	vertical = {
				-- 		width_padding = 0.05,
				-- 		height_padding = 1,
				-- 		preview_height = 0.5,
				-- 		preview_cutoff = 0,
				-- 	},
				-- },
				--
				-- layout_strategy = "vertical",
				-- layout_config = {
				-- 	vertical = {
				-- 		width = 0.9,
				-- 		height = 0.9,
				-- 		preview_height = 0.6,
				-- 		preview_cutoff = 0,
				-- 	},
				-- },
				-- layout_strategy = "flex",
				-- layout_config = {
				-- 	flex = {
				-- 		width = 0.9,
				-- 	},
				-- },
				-- winblend = 0,  -- 窗口透明度
				color_devicons = true, -- 使用彩色图标
				set_env = { ["COLORTERM"] = "truecolor" },
				-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,           -- move to prev result
						["<C-j>"] = actions.move_selection_next,               -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
			extensions = {
				file_browser = {
					path = "%:p:h", -- open from within the folder of your current buffer
					display_stat = false, -- don't show file stat
					grouped = true, -- group initial sorting by directories and then files
					hidden = true, -- show hidden files
					hide_parent_dir = true, -- hide `../` in the file browser
					hijack_netrw = false, -- use telescope file browser when opening directory paths
					prompt_path = true, -- show the current relative path from cwd as the prompt prefix
					use_fd = false, -- use `fd` instead of plenary, make sure to install `fd`
					heading = { treesitter = true },
					-- ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case", -- this is default
				},
			},
			pickers = {
				find_files = {
					-- theme = "ivy", -- dropdown
					-- theme = "dropdown",
					previewer = true,
				},
				live_grep = {
					-- theme = "dropdown",
					previewer = true,
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("dap")
		telescope.load_extension("advanced_git_search")
		telescope.load_extension("live_grep_args")
		local builtin = require("telescope.builtin")

		-- key maps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "-", ":Telescope file_browser<CR>")
		map("n", "<leader>ff", builtin.find_files, opts) -- Lists files in your current working directory, respects .gitignore
		map("n", "<leader>fx", builtin.treesitter, opts) -- Lists tree-sitter symbols
		map("n", "<leader>fs", builtin.spell_suggest, opts) -- Lists spell options
		map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
		map("n", "<leader>fgg", builtin.live_grep, opts) -- live grep, use telescope-live-grep-args to replace it
		map("n", "<leader>fg", "<cmd>Telescope live_grep_args<cr>", { desc = "Live Grep" })
		map("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
		map("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
		map("n", "<leader>gbu", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
		map("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
		map("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
				layout_config = { width = 0.7 },
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		map("n", "<leader>fh", builtin.help_tags, opts) -- help tags
	end,
}
