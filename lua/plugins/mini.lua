-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md

-- You can find the original config in :help ministatusline
local modified_config = function()
	local ignore_filetype = {
		["NvimTree"] = true,
		["neo-tree"] = true,
		["oil"] = true,
	}

	if ignore_filetype[vim.bo.filetype] then
		return " "
	end

	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	local git = MiniStatusline.section_git({ trunc_width = 40 })
	local diff = MiniStatusline.section_diff({ trunc_width = 75 })
	local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
	local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
	local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
	local location = MiniStatusline.section_location({ trunc_width = 75 })
	local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

	return MiniStatusline.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { filename } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
		{ hl = mode_hl, strings = { search, location } },
	})
end

return {
	{
		"echasnovski/mini.nvim",
		enabled = false,
		version = false,
		config = function()
			-- NOTE: It is advised to call require("mini.statusline").setup()
			local statusline = require("mini.statusline")
			statusline.setup({
				content = {
					-- Content for active window. If nil - use default.
					active = function()
						return modified_config()
					end,
					inactive = nil,
				},
				use_icons = true,
			})
		end,
	},
}
