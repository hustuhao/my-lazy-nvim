return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			go = { "golangcilint", "cspell" },
			markdown = { "cspell" },
			lua = { "cspell" },
			python = { "cspell" },
			javascript = { "cspell" },
			typescript = { "cspell" },
			javascriptreact = { "cspell" },
			typescriptreact = { "cspell" },
			sh = { "cspell" },
		}

		local function run_lint(manual)
			if vim.bo.buftype ~= "" or vim.api.nvim_buf_get_name(0) == "" then
				return
			end
			local available, missing = {}, {}
			for _, name in ipairs(lint.linters_by_ft[vim.bo.filetype] or {}) do
				local cmd = lint.linters[name].cmd
				if type(cmd) == "function" then
					cmd = cmd()
				end
				if vim.fn.executable(cmd) == 1 then
					table.insert(available, name)
				else
					table.insert(missing, cmd)
				end
			end
			if #available > 0 then
				lint.try_lint(available)
			end
			if manual and #missing > 0 then
				vim.notify("未找到检查工具：" .. table.concat(missing, ", "), vim.log.levels.WARN)
			end
		end

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("TuratoLint", { clear = true }),
			callback = function()
				run_lint(false)
			end,
		})
		vim.api.nvim_create_user_command("Lint", function()
			run_lint(true)
		end, {
			desc = "检查当前文件",
		})
	end,
	keys = {
		{ "<leader>cL", "<cmd>Lint<cr>", desc = "检查当前文件" },
	},
}
