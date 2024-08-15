require("mario.default")
require("mario.lazy")

--vim.lsp.set_log_level(vim.log.levels.DEBUG)

-- -- 加载自定义插件
-- local opts = {
-- 	formatters = {
-- 		sh = { "shfmt" },
-- 	},
-- }
-- require("mf").setup(opts)
--
-- 添加本地插件路径
-- package.path = package.path .. ";/Users/wepie/.config/nvim/customize_plugin/mf.lua"
--
-- -- 加载本地插件
-- local success, mf = pcall(require, "mf")
-- if not success then
-- 	print("无法加载 'mf' 模块")
-- 	return
-- end

-- 设置 DiffAdd 的高亮
-- vim.api.nvim_set_hl(0, "DiffAdd", { ctermfg = 0, ctermbg = 10, fg = "none", bg = "NvimDarkGreen" }) -- LightGreen

-- 设置 DiffDelete 的高亮
-- vim.api.nvim_set_hl(0, "DiffDelete", { cterm = bold, ctermfg = 9, fg = "NvimLightRed", bg = "none" })

-- 设置 DiffChange 的高亮
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = "none", bg = "NvimDarkGray4" })
--vim.api.nvim_set_hl(0, "DiffChange", { link = "Normal", bg = "#E0E0E0" })

-- 设置 DiffText 的高亮
-- vim.api.nvim_set_hl(0, "DiffText", { ctermfg = 0, ctermbg = 14, fg = "none", bg = "NvimDarkCyan" })

-- diff-mode 中替换删除线
-- vim.opt.fillchars:append({ diff = "╱" })
