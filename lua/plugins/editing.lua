return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		opts = {},
		cmd = { "TodoTrouble", "TodoTelescope" },
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
			{
				"<leader>xT",
				"<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
				desc = "Todo/Fix/Fixme (Trouble)",
			},
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			scope = { enabled = false },
		},
	},
}
