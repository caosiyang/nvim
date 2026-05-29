return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			-- 文件/字符串搜索
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: 查找文件" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: 全局搜字符串" },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Telescope: 搜光标下单词" },
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope: 当前文件搜字符串" },
			-- 缓冲区/系统
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope: 查找缓冲区" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope: 查找帮助文档" },
			-- LSP 相关
			{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope: 查找引用" },
			{ "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Telescope: 查找定义" },
		},
	},
}
