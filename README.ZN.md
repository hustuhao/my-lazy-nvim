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


 ● barbar.nvim 15.83ms  start
    ● catppuccin 4.86ms  start
    ● cmp-nvim-lsp 0.1ms  nvim-cmp
    ● cmp_luasnip 0.06ms  nvim-cmp
    ● Comment.nvim 2.46ms  start
    ● conform.nvim 1.36ms  start
    ● csv.vim 1.04ms  start
    ● darcula-dark.nvim 0.06ms  start
    ● diffview.nvim 5.97ms  gitsigns.nvim
    ● fittencode.nvim 12.85ms  start
    ● friendly-snippets 0.12ms  LuaSnip
    ● gitsigns.nvim 9.02ms  barbar.nvim
    ● go.nvim 0.13ms  navigator.lua
    ● guihua.lua 0.44ms  navigator.lua
    ● lazy.nvim 16.93ms  init.lua
    ● LazyVim 8.47ms  start
    ● lsp_signature.nvim 3.39ms  navigator.lua
    ● lspkind-nvim 0.1ms  nvim-cmp
    ● lualine.nvim 11.81ms  start
    ● LuaSnip 22.54ms  nvim-cmp
    ● mason-lspconfig.nvim 0.03ms  start
    ● mason.nvim 4.06ms  nvim-dap
    ● mini.nvim 0.25ms  render-markdown
    ● navigator.lua 65.75ms  start
    ● nvim 0.22ms  lualine.nvim
    ● nvim-cmp 40.15ms  navigator.lua
    ● nvim-dap 18.69ms  start
    ● nvim-dap-go 2.68ms  nvim-dap
    ● nvim-dap-ui 0.05ms  nvim-dap
    ● nvim-dap-virtual-text 0.17ms  nvim-dap
    ● nvim-lspconfig 5.67ms  nvim-cmp
    ● nvim-nio 0.16ms  nvim-dap
    ● nvim-surround 2.57ms  VeryLazy
    ● nvim-tree.lua 28.09ms  start
    ● nvim-treesitter 12.47ms  navigator.lua
    ● nvim-treesitter-context 1.12ms  nvim-treesitter
    ● nvim-treesitter-textobjects 8.64ms  nvim-treesitter
    ● nvim-web-devicons 0.87ms  nvim-tree.lua
    ● outline.nvim 3.72ms  start
    ● plenary.nvim 0.57ms 󰢱 plenary.async  telescope-live-grep-args.nvim
    ● render-markdown 6ms  start
    ● telescope-file-browser.nvim 0.24ms  telescope.nvim
    ● telescope-fzf-native.nvim 0.05ms  telescope.nvim
    ● telescope-live-grep-args.nvim 15.17ms  telescope.nvim
    ● telescope.nvim 22.37ms  start
    ● vim-clang-format 1.09ms  start
    ● which-key.nvim 3.43ms  start
    ○ markdown-preview.nvim  MarkdownPreviewToggle  MarkdownPreview  MarkdownPreviewStop  markdown 
    ○ toggleterm.nvim  <leader>te  <leader>t  TermExec  ToggleTerm 

  Disabled (1)
    



## 支持新的语言

### Mason

使用 Mason 轻松安装 LSP server，DAP server，linter 和 formatter

只需要在输入命令 Mason，然后选择需要安装的组件即可。
