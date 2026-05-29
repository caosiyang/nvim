return {

	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {
			ensure_installed = {
				"pylint",
				"selene",
			},
			automatic_installation = true,
		},
	},

	{
		"mfussenegger/nvim-lint",
		-- event = { "BufReadPost", "BufWritePre", "BufWritePost", "BufNewFile" },
		dependencies = {
			--{ "folke/trouble.nvim", cmd = "Trouble", opts = {}, }
		},
		opts = {
			linters_by_ft = {
				python = {
					"pylint",
				},
				lua = { "selene" },
			},
		},
		config = function(_, opts)
			local lint = require("lint")

			lint.linters_by_ft = opts.linters_by_ft

			vim.keymap.set("n", "<leader>L", function()
				lint.try_lint()
				--vim.notify("Linting done.", vim.log.levels.INFO)
			end, { desc = "代码检查(nvim-lint)", noremap = true, silent = true })

			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	callback = function()
			-- 		lint.try_lint()
			-- 	end,
			-- })

			vim.diagnostic.config({
				--virtual_text = {
				--    prefix = "->",
				--    source = "always",
				--},

				float = {
					border = "single", -- 边框样式（适配 tokyonight 主题）
					source = "always", -- 显示错误来源（如 pylint/flake8）
					header = "", -- 隐藏头部（简化显示）
					prefix = "", -- 隐藏前缀
					format = function(diagnostic)
						-- diagnostic 包含所有诊断信息：message/code/severity/source 等
						return string.format(
							"[%s] %s: %s",
							diagnostic.source, -- 来源（pylint）
							diagnostic.code, -- 错误码（如 E0602）
							diagnostic.message -- 错误描述
						)
					end,
				},

				vim.keymap.set("n", "<leader>D", function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "InsertEnter", "CursorMoved" },
					})
				end, { desc = "show diagnostic information", noremap = true, silent = true }),

				--signs = {
				--    text = {
				--        Error = "E",
				--        Warn = "W",
				--        Info = "I",
				--        Hint = "H",
				--    },
				--    -- watermark
				--    severity = { min = vim.diagnostic.severity.HINT }
				--},
				--underline = true,               -- 错误行加下划线
				--update_in_insert = false,       -- 插入模式不更新（避免卡顿）
				--severity_sort = true            -- 优先显示 Error（比 Warning 靠前）
			})

			-- 打开所有错误/警告列表（需安装 folke/trouble.nvim）
			--vim.keymap.set("n", "<F9>", "<cmd>Trouble diagnostics toggle<CR>", {
			--    desc = "打开 Linter 错误/警告列表",
			--    noremap = true,
			--    silent = true
			--})
		end,
	},
}
