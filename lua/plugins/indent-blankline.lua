-- Add indentation vertical line guides
-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
	{
		"lukas-reineke/indent-blankline.nvim",
		-- See `:help ibl`
		main = "ibl",
		opts = {
			indent = {
				-- char = "│",
				tab_char = "│",
			},
		},
	},
}
