return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"python",
				"lua",
				"bash",
				"json",
				"markdown",
				"yaml",
				"toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"python",
					"lua",
					"bash",
					"json",
					"markdown",
					"yaml",
					"toml",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
