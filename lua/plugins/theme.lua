return {
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
		enabled = true,
		lazy = false,
		config = function()
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
		opts = {},
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
