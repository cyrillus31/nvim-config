-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim
-- NOTE: assests:
-- │
--   
--   
--  
--  
--  
--  

-- These debugui-related filetypes can be used to be excluded from lualine focus
local dapui_filetypes = {
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dapui_console", -- underscore!
}

local function get_python_env()
	-- ' '
	local command = "env=$VIRTUAL_ENV_PROMPT; if [[ ! -z $env ]]; then echo $env; else echo ''; fi"
	local output = vim.fn.system(command)
	return string.sub(output, 1, -2)
end

return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				-- COMPONENT SEPARATORS:
				component_separators = { left = "", right = "│" },
				-- component_separators = { left = '', right = '' },
				-- component_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },

				-- SELECTION SEPARATORS:
				section_separators = { left = "", right = " " },
				-- section_separators = { left = "", right = "" },
				-- section_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				-- section_separators = { left = ' ', right = ' ' },
				-- section_separators = { left = ' ', right = ' ' },
				-- section_separators = { left = ' ', right = '' },
				disabled_filetypes = {
					statusline = { "NvimTree", "Neotree", unpack(dapui_filetypes) },
					winbar = {},
				},
				ignore_focus = { "NvimTree", "Neotree", unpack(dapui_filetypes) },
				always_divide_middle = false,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" } } },
				lualine_b = { "branch", "filename" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "fileformat", "filetype", get_python_env },
				lualine_y = { "lsp_status" },
				lualine_z = { "progress", { "location", separator = { right = "" } } },
			},
			inactive_sections = {
				-- lualine_a = {},
				-- lualine_b = {},
				lualine_b = { "filename" },
				lualine_c = { "location" },
				-- lualine_x = { "filename", "location" },
				-- lualine_y = {},
				-- lualine_z = {},
			},
			-- below is the line for tabs
			-- tabline = {
			-- 	lualine_a = { "tabs" },
			-- 	lualine_b = { T.getTabName() },
			-- 	-- lualine_a = { 'tabs', separator = { left = '', right = ''}, cond = function () return true end },
			-- 	lualine_c = { "filename" },
			-- },
			winbar = {
				-- lualine_a = { 'filename' },
				-- lualine_b = { 'diagnostics' },
			},
			inactive_winbar = {
				-- lualine_b = { "filename" },
				-- lualine_c = { 'diagnostics' },
			},
			extensions = {},
		})
	end,
}
