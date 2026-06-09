-- Code linter (for languages without LSP linter)
return {
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			linters_by_ft = {
				lua = { "selene" },
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			lint.linters_by_ft = opts.linters_by_ft

			vim.keymap.set("n", "<leader>L", function()
				lint.try_lint()
			end, { desc = "代码检查(nvim-lint)", noremap = true, silent = true })

			vim.diagnostic.config({
				float = {
					border = "single", -- 边框样式（适配主题）
					source = "always", -- 显示错误来源（如 pylint/ruff）
					header = "", -- 隐藏头部（简化显示）
					prefix = "", -- 隐藏前缀
					format = function(diagnostic)
						-- diagnostic 包含所有诊断信息：message/code/severity/source 等
						return string.format(
							"[%s] %s: %s",
							diagnostic.source, -- 来源
							diagnostic.code, -- 错误码
							diagnostic.message -- 错误描述
						)
					end,
				},
			})
		end,
	},
}
