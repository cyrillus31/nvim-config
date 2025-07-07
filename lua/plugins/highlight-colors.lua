-- Highlights hex, rbg color codes
-- https://github.com/brenoprata10/nvim-highlight-colors

-- some color #0aff0f
-- some other color color #faff0f

return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				---Set virtual symbol (requires render to be set to 'virtual')
				-- virtual_symbol = "■", -- default
				-- virtual_symbol = " "
				virtual_symbol = "",
				-- virtual_symbol = "",

				---Set virtual symbol suffix (defaults to '')
				virtual_symbol_prefix = "",

				---Set virtual symbol suffix (defaults to ' ')
				virtual_symbol_suffix = " ",
				---inline mimics VS Code style
				---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
				---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
				virtual_symbol_position = "eol",
			})
		end,
	},
}

--[[
-- 'blink.cmp' integration example
require("blink.cmp").setup {
	completion = {
		menu = {
			draw = {
				components = {
					-- customize the drawing of kind icons
					kind_icon = {
						text = function(ctx)
						  -- default kind icon
						  local icon = ctx.kind_icon
							-- if LSP source, check for color derived from documentation
							if ctx.item.source_name == "LSP" then
								local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr ~= "" then
								  icon = color_item.abbr
								end
							end
							return icon .. ctx.icon_gap
						end,
						highlight = function(ctx)
							-- default highlight group
							local highlight = "BlinkCmpKind" .. ctx.kind
							-- if LSP source, check for color derived from documentation
							if ctx.item.source_name == "LSP" then
								local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr_hl_group then
								  highlight = color_item.abbr_hl_group
								end
							end
							return highlight
						end,
					},
				},
			},
		},
	},
}
--]]
