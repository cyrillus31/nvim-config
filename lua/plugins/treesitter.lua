--[[
- Treesitter docs:
  https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#quickstart

- Advent on Neovim by TJ DeVries:
  https://www.youtube.com/watch?v=MpnjYb-t12A&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=6&ab_channel=TJDeVries

NOTE: Uses the `main` branch (nvim-treesitter rewrite for Nvim 0.12+).
The archived `master` branch is incompatible with Nvim 0.12 (e.g. the
`attempt to call method 'range'` error from old custom injection directives).
--]]
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local nts = require("nvim-treesitter")
			nts.setup({})

			-- Install parsers asynchronously (no-op if already installed).
			-- There is no `ensure_installed`/`auto_install` on the main branch.
			nts.install({
				"go",
				"python",
				"c",
				"cpp",
				"javascript",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"html",
			})

			-- Enable treesitter highlighting (Nvim built-in) for filetypes that
			-- actually have a parser installed. No-op otherwise (e.g. the
			-- dashboard, file trees, ...).
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if vim.treesitter.language.add(vim.bo.filetype) then
						vim.treesitter.start()
					end
				end,
			})
		end,
	},
}
