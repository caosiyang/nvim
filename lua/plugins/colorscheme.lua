return {
	-- {
	--   "folke/tokyonight.nvim",
	--    enabeld = false,
	--   lazy = false,
	--   priority = 1000,
	--   opts = {
	--     style = "moon",
	--   },
	--   config = function(_, opts)
	--     require("tokyonight").setup(opts)
	--     vim.cmd.colorscheme("tokyonight")
	--   end
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	enabled = false,
	-- 	name = "catppuccin.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		local themes = {
	-- 			origin = "catppuccin",
	-- 			latte = "catppuccin-latte",
	-- 			frappe = "catppuccin-frappe",
	-- 			macchiato = "catppuccin-macchiato",
	-- 			mocha = "catppuccin-mocha",
	-- 		}
	-- 		vim.cmd.colorscheme(themes.origin)
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			style = "nightfox",
		},
		config = function(_, opts)
			require("nightfox").setup(opts)
			local themes = {
				nightfox = "nightfox",
				dayfox = "dayfox",
				dawnfox = "dawnfox",
				duskfox = "duskfox",
				nordfox = "nordfox",
				terafox = "terafox",
				cargonfox = "carbonfox",
			}
			vim.cmd.colorscheme(themes.nightfox)
		end,
	},
}
