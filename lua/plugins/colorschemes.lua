return {
	{
		"EdenEast/nightfox.nvim",
		enabled = false,
		config = function()
			require("nightfox").setup({
				options = {
					dim_inactive = true,
				},
			})
			-- Dark themes:
			-- vim.cmd.colorscheme("terafox")
			vim.cmd.colorscheme("nightfox")
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
		enabled = true,
		lazy = false,
		config = function()
			require("kanagawa").setup({
				dimInactive = true,
				compile = false,             -- enable compiling the colorscheme
				undercurl = true,            -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true},
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,         -- do not set background color
				terminalColors = true,       -- define vim.g.terminal_color_{0,17}
				colors = {                   -- add/modify theme and palette colors
						palette = {},
						theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
						return {}
				end,
				theme = "wave",              -- Load "wave" theme
				background = {               -- map the value of 'background' option to a theme
						dark = "wave",           -- wave | dragon | lotus
						light = "lotus"
				},
			})
			-- vim.cmd.colorscheme("kanagawa-wave")
			vim.cmd.colorscheme("kanagawa")
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
			require("github-theme").setup({
				options = {
					dim_inactive = true,
				}
			})
			-- vim.cmd.colorscheme("github_dark_dimmed")
			vim.cmd.colorscheme("github_dark")
		end,
	},
	{
			"scottmckendry/cyberdream.nvim",
			enabled = false,
			lazy = false,
			priority = 1000,
			config = function ()
				require("cyberdream").setup({
					variant = "default", -- light | auto
					transparent = true,
					italic_comments = true,
				})
				vim.cmd.colorscheme("cyberdream")
			end
	}
}
