local layouts = {
	{
		elements = {
			-- Elements can be strings or table with id and size keys.
			{ id = "scopes", size = 0.25 },
			"breakpoints",
			"stacks",
			"watches",
		},
		size = 40, -- 40 columns
		position = "left",
	},
	{
		elements = {
			"repl",
			"console",
		},
		size = 0.25, -- 25% of total lines
		position = "bottom",
	},
}

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},

		-- https://github.com/Alexis12119/nvim-config
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			ui.setup({
				layouts = layouts,
			})
			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			--   type = "server",
			--   port = "${port}",
			--   executable = {
			--     command = "dlv",
			--     args = { "dap", "-l", "127.0.0.1:${port}" },
			--   },
			-- }

			local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			-- ui
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end

			-- load settings for debugger
			-- local settings_path = "turato.plugins.dap.settings"
			-- local settings_dir = vim.fn.stdpath("config") .. "/lua/turato/plugins/dap/settings/"
			--
			-- for _, file in ipairs(vim.fn.readdir(settings_dir, [[v:val =~ '\.lua$']])) do
			-- 	local module_name = file:gsub("%.lua$", "")
			-- 	require(settings_path .. "." .. module_name)
			-- end

			-- NOTE: Make sure to install the needed files/exectubles through mason
			-- require("plugins.dap.settings.cpptools")
			-- require("plugins.dap.settings.netcoredbg")
			-- require("plugins.dap.settings.godot")
			require("turato.plugins.dap.settings.bash-debug-adapter")
			-- require("plugins.dap.settings.php-debug-adapter")
			-- require("plugins.dap.settings.dart-debug-adapter")
			-- require("plugins.dap.settings.chrome-debug-adapter")
			-- require("plugins.dap.settings.firefox-debug-adapter")
			require("turato.plugins.dap.settings.java-debug")
			require("turato.plugins.dap.settings.debugpy")
			-- require("plugins.dap.settings.go-debug-adapter")
			require("turato.plugins.dap.settings.js-debug")
		end,
	},
}
