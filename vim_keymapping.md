# Neovim 快捷键

![vim_cheat_sheet](pic/vim_cheat_sheet.png)

## 按键记法

- `<leader>` 为 **空格**，`<leader>ff` 表示依次按空格、f、f。
- `<localleader>` 为 **反斜杠 `\`**。
- `<C-x>`：Ctrl + x；`<A-x>`：Alt/Option + x；`<D-x>`：Command + x。
- `<CR>`：Enter；`<Esc>`：Escape；`<Tab>`：Tab。
- N：普通模式；V：可视模式；I：插入模式；O：操作符等待模式（例如按 `d` 后）。未注明模式时为 N。

## 查看快捷键

| 按键或命令 | 用途 |
| --- | --- |
| `<leader>fk` | Telescope 搜索已注册的快捷键 |
| `<leader>fh` | Telescope 搜索帮助 |
| `:h index` | 查看 Vim 原生快捷键 |
| `:verbose nmap <leader>sr` | 查看映射及其定义来源，插入模式用 `imap` |

which-key 在等待后续按键时提示映射。`<Space>?` 已用于调试表达式求值。

## 保存、补全、窗口和文件树

| 按键 | 模式 | 用途 |
| --- | --- | --- |
| `ii` | I | 退出插入模式 |
| `<C-s>` / `<D-s>` | I | 保存并退出插入模式；Command 依赖终端/GUI 支持 |
| `<C-Space>` | I | 手动触发 cmp 补全 |
| `<C-e>` | I | 取消 cmp 补全 |
| `<CR>` | I | 确认补全；未主动选择时也会接受候选 |
| `<Tab>` | I/选择模式 | 下一条补全，或跳到代码片段下一位置 |
| `<C-b>` / `<C-f>` | I | 向上/向下滚动补全文档 |
| `<C-w>w` | N | 切换到下一个窗口 |
| `<C-w>h/j/k/l` | N | 切换左/下/上/右窗口 |
| `<C-w>s` / `<C-w>v` | N | 水平/垂直分屏 |
| `<leader>nt` / `<leader>nf` | N | 开关文件树/定位当前文件 |
| `?` | 文件树 N | 文件树帮助 |

`<Tab>` 也被 FittenCode 使用，实际行为取决于补全状态和映射加载情况。部分文件树自定义键位目前被注册为全局映射，尚需单独修复作用域。

## 项目搜索替换：grug-far

配置：`lua/turato/plugins/grug-far.lua`；依赖 `rg`。

| 按键 | 模式 | 用途 |
| --- | --- | --- |
| `<leader>sr` | N | 打开项目搜索替换 |
| `<leader>sr` | V | 用选中文本预填搜索内容 |
| `<leader>sR` | V | 仅在选中范围内替换 |
| `<localleader>r` | 插件窗口 N | 执行替换 |
| `<CR>` | 插件结果区 N | 跳到匹配位置 |

填写 Search、Replace、Files Filter 和 Flags。输入时搜索并预览，执行替换后才修改文件。

## Go 测试：Neotest

配置：`lua/turato/plugins/neotest.lua`；适配器：`neotest-golang` v1（兼容当前 Treesitter master）。
依赖 Go、Treesitter Go parser；调试还需 Delve。当前只接入 Go。

| 按键 | 用途 |
| --- | --- |
| `<leader>rt` | 运行光标附近测试 |
| `<leader>rf` | 运行当前文件测试 |
| `<leader>ra` | 运行当前工作目录下全部测试，含子包 |
| `<leader>rl` | 重复上一次测试 |
| `<leader>rs` | 开关测试结果树 |
| `<leader>ro` | 查看测试输出并进入窗口 |
| `<leader>rO` | 开关测试输出面板 |
| `<leader>rx` | 停止测试 |
| `<leader>rd` | 使用 DAP 调试光标附近测试 |

使用 `-v -race -count=1 -timeout=60s`，启用竞态检查并避免测试缓存；全部测试前确认 `:pwd` 指向目标项目。保留终端的 `<leader>t`、`<leader>te`。

## 静态检查：nvim-lint

配置：`lua/turato/plugins/nvim-lint.lua`。

| 按键或命令 | 用途 |
| --- | --- |
| `<leader>cL` / `:Lint` | 手动检查当前文件 |
| `<leader>xx` / `<leader>xX` | Trouble 查看全部/当前文件诊断 |
| `[d` / `]d` | 上一个/下一个诊断问题 |

- 读取文件、保存文件、离开插入模式时自动检查。
- Go：`golangci-lint` + `cspell`；Markdown：仅 `cspell`，关闭 Markdown 格式规范检查。
- Lua、Python、JavaScript/TypeScript（含 JSX/TSX）、Shell：`cspell`。
- 缺少工具时自动检查跳过，手动检查提示。`cspell` 由 Mason 安装，`golangci-lint` 使用系统安装。
- 项目可用 `.golangci.yml`、`cspell.json` 配置规则。

## 复制历史：Yanky

配置：`lua/turato/plugins/yanky.lua`；通过 ShaDa 保存最近 100 条历史，无需 SQLite。

| 按键 | 模式 | 用途 |
| --- | --- | --- |
| `<leader>yh` | N | 选择复制历史并粘贴 |
| `y` | N/V | 复制并记录历史 |
| `p` / `P` | N/V | 光标后/前粘贴 |
| `[y` / `]y` | N | 粘贴后切换上一条/下一条历史 |

先粘贴，再按 `[y` / `]y` 替换刚粘贴的内容。`:YankyClearHistory` 清空历史。

## 快速跳转：Flash

配置：`lua/turato/plugins/flash.lua`。

| 按键 | 模式 | 用途 |
| --- | --- | --- |
| `<leader>jj` | N/V/O | 输入目标字符，再按标签跳转 |
| `<leader>jt` | N/V/O | 按标签选择 Treesitter 语法节点 |

这两个快捷键实际按 **空格 → j → j/t**，不是 `\jj` 或 `\jt`。

### `<leader>jj`：跳到屏幕上看到的位置

1. 在普通模式按 `<leader>jj`。
2. 输入目标位置的几个字符，例如 `return`、`func` 或变量名。
3. 匹配位置旁边出现字母标签，按对应标签跳转；按 `<Esc>` 取消。

适合目标已经在屏幕上，但离光标较远，或位于另一个分屏。例如跳到下方某个 `return`，无需反复按 `j`。查找未显示在屏幕上的项目文件或文本，使用 Telescope。

### `<leader>jt`：选择语法范围

1. 把光标放进目标代码，例如函数体里面。
2. 按 `<leader>jt`。
3. Flash 为光标所在的语法节点及其外层节点显示标签，例如表达式、语句、代码块、整个函数。
4. 按标签选择需要的范围；按 `<Esc>` 取消。

适合复制、删除、修改整个函数或代码块，无需手动找起止行。节点范围由对应语言的 Treesitter parser 决定。

| 按键顺序 | 用途 |
| --- | --- |
| `<leader>jt` → 标签 | 选中对应语法范围 |
| `y<leader>jt` → 标签 | 复制对应语法范围 |
| `d<leader>jt` → 标签 | 删除对应语法范围 |
| `c<leader>jt` → 标签 | 修改对应语法范围并进入插入模式 |

例如复制整个 Go 函数：光标放在函数里面，按 `y` → 空格 → `j` → `t`，再选择整个函数的标签。

`jj` 用于跳转位置，`jt` 用于选择代码范围。当前配置保留 Go 的 `A/V/S`，关闭 Flash 字符模式，保留原生 `f/t/F/T`。
