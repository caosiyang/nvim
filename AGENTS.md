# AGENTS.md

## 这是什么

使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 管理的个人 Neovim 配置。针对 Python（pyright + ruff）和 Lua（lua_ls + stylua + selene）开发设计。

## 安装方式

本仓库需要软链接到 `~/.config/nvim`（或 `XDG_CONFIG_HOME/nvim`）：

```sh
ln -s /path/to/this/repo ~/.config/nvim
```

## 目录结构

```
init.lua                       # 入口：加载 config/* 后启动 lazy
lua/
  config/
    options.lua                # vim.opt 默认值（number, tabstop=4, mouse="", leader=" "）
    autocmds.lua               # Lua 文件 2 空格缩进；BufReadPost 恢复光标位置
    keymaps.lua                # 全局快捷键（仅 <leader>m 激活；其余为注释参考）
    lazy.lua                   # lazy.nvim 引导 + { import = "plugins" }
  plugins/
    blink-cmp.lua              # 代码补全（blink.cmp + blink.lib）
    colorscheme.lua            # nightfox（默认）+ tokyonight + catppuccin
    conform.lua                # 代码格式化（ruff + stylua）
    editing.lua                # mini.pairs/surround/ai, todo-comments, indent-blankline
    git.lua                    # gitsigns, diffview, lazygit
    lint.lua                   # nvim-lint（仅 lua 的 selene；python 用 ruff LSP）
    lsp.lua                    # mason-lspconfig + nvim-lspconfig + 快捷键
    mason.lua                  # mason.nvim + mason-tool-installer（自动安装所有工具）
    neo-tree.lua               # 文件树
    telescope.lua              # 模糊查找
    treesitter.lua             # 语法高亮（含已禁用的 treesitter-context）
    trouble.lua                # 诊断/符号/LSP 列表
    ui.lua                     # lualine + which-key
    disabled/                  # lazy.nvim 不会加载；旧配置存档
      black_isort.lua          # 旧 conform：isort + black
      pylint.lua               # 旧 nvim-lint：pylint
      ruff-lint.lua            # 旧 nvim-lint：ruff（现由 ruff LSP 承担）
```

## 插件加载机制

`lua/config/lazy.lua:28` 的 `{ import = "plugins" }` 会加载 `lua/plugins/` 目录下**所有直接**的 `.lua` 文件。**不会递归加载子目录** —— 这就是 `lua/plugins/disabled/` 能安全存放旧配置而不影响运行的原因。

新增插件：在 `lua/plugins/` 下放一个 `.lua` 文件，`return { ... }` 一个 lazy.nvim spec table 即可。

## 工具安装

所有工具（LSP server、formatter、linter）由 [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) 统一安装。**单一来源**是 `lua/plugins/mason.lua`：

- `run_on_start = true` — 启动 nvim 时自动安装缺失工具
- 在该文件的 `ensure_installed` 列表中增删工具
- 修改后执行 `:Lazy sync` 或重启 nvim

## 快捷键（仅当前激活的）

| 快捷键 | 功能 |
|--------|------|
| `<leader>F` | 格式化代码（conform） |
| `<leader>L` | 手动 lint（nvim-lint） |
| `<leader>D` | 弹出诊断信息 |
| `<leader>m` | 切换鼠标 |
| `<leader>T` | neo-tree 开关 |
| `<leader>gg` / `gf` | lazygit / 当前文件 lazygit |
| `<leader>do` / `dc` | diffview 打开 / 关闭 |
| `<leader>ff/fg/fw/fs/fb/fh/fr/fd` | telescope |
| `<leader>xx/xX/cs/cl/xL/xQ` | trouble |
| `<leader>xt/xT/st/sT` | todo-comments |
| `<leader>rn` / `<F2>` | LSP 重命名 |
| `gd` / `gr` / `K` | LSP 跳转定义 / 引用 / hover |
| `]t` / `[t` | 下一个 / 上一个 TODO |
| `gsa/gsd/gsr/gsf/gsF/gsh/gsn` | mini.surround |
| `<leader>?` | which-key 缓冲本地快捷键 |

`<leader>` 是空格；`<localleader>` 是反斜杠（在 `lua/config/lazy.lua` 设置）。

## Lockfile 策略

`lazy-lock.json` **被 gitignore**（见 `.gitignore`）—— 插件始终跟随最新版。取消 `.gitignore` 中的 `lazy-lock.json` 行可固定版本。

## 常见坑点

- **headless 模式下 mason 安装会中断。** 执行 `nvim --headless "+Lazy! sync" +qa` 会中途杀掉 mason 安装（如 ruff）。首次安装务必交互式启动 nvim，或用 `:Mason` 和 `:MasonLog` 验证。
- **conform 调用 `ruff` 命令行工具，不是 ruff LSP server。** mason 会同时安装两者，但若 `:Lazy sync` 中断，命令行可能缺失。解决：交互式启动 nvim 让 mason-tool-installer 跑完，或手动 `pip install ruff`。
- **ruff LSP 与 nvim-lint 的 ruff 是故意去重的。** Python 诊断完全由 ruff LSP 承担（实时 + 快速修复）。nvim-lint 只处理 lua 的 selene。在 `lint.lua` 中重新启用 ruff 会出现重复诊断。
- **原 `lsp.lua` 的 `<leader>e` 已删除**，因为和 `<leader>D` 重复。不要在不删除一个的情况下加回。
- **`lua/plugins/disabled/` 仅作参考。** lazy.nvim 忽略子目录。要重新启用某个配置，把它移回上一级即可。

## 改动后验证

没有测试套件。验证步骤：

1. 重启 nvim（或 `:Lazy sync` 后 `:Lazy reload`）
2. `:checkhealth` 检查 LSP/mason 状态
3. 打开 `.py` 文件 → `:ConformInfo` 确认 ruff 已挂载
4. 打开 `.lua` 文件 → 用 `<leader>F` 格式化，确认 stylua 工作正常
