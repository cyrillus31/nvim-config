-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim

local dapui_filetypes = {
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dapui_console", -- underscore!
}

-- Tabs helper object
local T = {}

T.tabnames = {}

function T.getCurrentTabIndex()
	local tab_index = vim.api.nvim_tabpage_get_number(vim.api.nvim_get_current_tabpage())
	return tab_index
end

function T.getTabName()
	local cur = T.getCurrentTabIndex()
	return tostring(T.tabnames[cur]) or ""
end

function T.changeTabname()
	T.tabnames[tostring(T.getCurrentTabIndex())] = vim.fn.input("Tab rename: ")
	for key, value in pairs(T.tabnames) do
		print(key .. "and" .. value)
	end
end

function T.set_keymaps()
	vim.keymap.set("n", "vtr", T.changeTabname, { desc = "Tab rename" })
end

return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function get_python_env()
			-- ' '
			local command = "env=$VIRTUAL_ENV_PROMPT; if [[ ! -z $env ]]; then echo $env; else echo ''; fi"
			local output = vim.fn.system(command)
			return string.sub(output, 1, -2)
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				-- theme = 'wombat',
				-- theme = 'gruvbox',
				-- theme = 'everforest',
				-- theme = 'palenight',
				--
				--
				--
				--
				-- component_separators = { left = '', right = '' },
				component_separators = { left = "", right = "" },
				-- component_separators = { left = '', right = '' }
				-- section_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				-- section_separators = { left = ' ', right = ' ' },
				-- section_separators = { left = ' ', right = ' ' },
				-- section_separators = { left = ' ', right = '' },
				section_separators = { left = "", right = " " },
				disabled_filetypes = {
					statusline = { "NvimTree", "Neotree", table.unpack(dapui_filetypes) },
					winbar = {},
				},
				ignore_focus = { "NvimTree", "Neotree", table.unpack(dapui_filetypes) },
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "diagnostics" },
				-- lualine_c = { 'filename' },
				lualine_x = { "fileformat", "filetype", get_python_env },
				-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "filename", "location" },
				lualine_y = {},
				lualine_z = {},
			},
			-- below is the line for tabs
			-- tabline = {
			-- 	lualine_a = { "tabs" },
			-- 	lualine_b = { T.getTabName() },
			-- 	-- lualine_a = { 'tabs', separator = { left = '', right = ''}, cond = function () return true end },
			-- 	lualine_c = { "filename" },
			-- },
			-- winbar = {
			--   lualine_a = { 'filename' },
			--   -- lualine_b = { 'diagnostics' },
			-- },
			inactive_winbar = {
				-- lualine_b = { 'filename' },
				-- lualine_c = { 'diagnostics' },
			},
			extensions = {},
		})
	end,
}
