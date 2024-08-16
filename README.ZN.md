# Neovim 使用 lazy.nvim 和 go.nvim 配置 Go 开发环境

* [YouTube Video](https://youtu.be/n5_WLgxwkU8)
* [Blog post](https://mariocarrion.com/2024/05/20/neovim-migrating-to-lazy-and-go-nvim.html)

❗️❗️此配置需要 Neovim **v0.10.0**❗️❗️


## 插件

- [barbar](https://github.com/romgrk/barbar.nvim): 选项卡线
- [cmp](https://github.com/hrsh7th/nvim-cmp): 代码补全
- [colorscheme](https://github.com/doums/darcula): Jetbrain darcula 颜色主题配置
- [conform](https://github.com/stevearc/conform.nvim): 轻量级且强大的格式化插件
- [Comment](https://github.com/numToStr/Comment.nvim): 注释插件
- [Catppuccin](https://github.com/catppuccin/nvim): 一个主题
- [diffview](https://github.com/sindrets/diffview.nvim):轻松浏览任何git版本的所有修改文件的差异。
- [fittencode](https://github.com/luozhiya/fittencode.nvim): AI编程助手
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): 代码片段补全
- [lualine](https://github.com/nvim-lualine/lualine.nvim): 状态线
- [lsp_signature](https://github.com/ray-x/lsp_signature.nvim): 基于lsp显示函数签名
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): 语言高亮
- [telescope](https://github.com/nvim-telescope/telescope.nvim):一个高度可扩展的列表模糊查找器。
- [toggleterm](https://github.com/akinsho/toggleterm.nvim): 切换终端
- [trouble](https://github.com/folke/trouble.nvim):显示解决代码引起的所有问题。
- [navigator](https://github.com/ray-x/navigator.lua): 代码分析和导航
- [mason](https://github.com/williamboman/mason.nvim): 便捷的包管理器，轻松管理 LSP server，DAP server，linter 和 formatter
- [outline](https://github.com/hedyhli/outline.nvim):由LSP驱动的、在代码编辑器中快速浏览和导航代码元素的侧边栏
- [plenary](https://github.com/nvim-lua/plenary.nvim):一个使用协程进行异步编程的lua模块


## 支持新的语言

### Mason

使用 Mason 轻松安装 LSP server，DAP server，linter 和 formatter

只需要在输入命令 Mason，然后选择需要安装的组件即可。

### DEBUG 配置

位置：lua/turato/plugins/dap

在 settting 目录中添加相应的配置后，需要在 nvim-dap.lua 中引用


