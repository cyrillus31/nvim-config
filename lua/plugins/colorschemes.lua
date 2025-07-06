return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		config = function()
			require("nightfox").setup({
				options = {
					dim_inactive = true,
				},
			})
			-- Dark themes:
			vim.cmd.colorscheme("terafox")
			-- vim.cmd.colorscheme("nightfox")
			-- vim.cmd.colorscheme("duskfox")
			-- vim.cmd.colorscheme("nordfox")
			-- vim.cmd.colorscheme("carbonfox")
			--
			-- Light themes:
			-- vim.cmd.colorscheme("dayfox")
			-- vim.cmd.colorscheme("dawnfox")
			--
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		config = function()
			require("kanagawa").setup({
				dimInactive = true,
			})
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		enabled = false,
		lazy = false,
		name = "github-theme",
		config = function()
			vim.cmd.colorscheme("github_dark_dimmed")
		end,
	},
}
