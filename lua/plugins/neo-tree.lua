-- File explorer
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module 'neo-tree'
		---@type neotree.Config
		opts = {
			close_if_last_window = false,
			auto_close = true,
			window = { width = 40, border = "single", position = "left" },
			filesystem = {
				show_hidden = true,
				follow_current_file = { enabled = true },
			},
		},
		keys = {
			{ "<leader>T", "<CMD>Neotree toggle<CR>", desc = "Neotree Toggle", noremap = true, silent = true },
		},
	},
}
