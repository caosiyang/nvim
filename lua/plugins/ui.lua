-- UI components
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- refer to https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
			options = {
				theme = "auto",
				theme = "dracula",
				theme = "onedark",
				theme = "material",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
