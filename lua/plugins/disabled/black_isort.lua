-- ========================================
-- 被 ruff 替代的旧格式化配置（black + isort）
-- 恢复方法：将 formatter.lua 中 ruff 配置换回以下内容
-- ========================================
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "isort", "black" },
			lua = { "stylua" },
		},
		format_on_save = false,
	},
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 1000 })
			end,
			mode = { "n", "v" },
			desc = "Conform: format code",
			noremap = true,
			silent = true,
		},
		{
			"<leader>I",
			function()
				require("conform").format({ formatters = { "isort" }, async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Conform: format imports",
			noremap = true,
			silent = true,
		},
	},
},
