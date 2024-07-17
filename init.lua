require("mario.default")
require("mario.lazy")

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
