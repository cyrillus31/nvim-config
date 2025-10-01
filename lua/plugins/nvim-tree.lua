local opts = {
	filters = {
		dotfiles = false, -- use H to turn on dotfiles
		exclude = { vim.fn.stdpath 'config' .. '/lua/custom' },
		custom = { "__pycache__", ".mypy_cache", ".pytest_cache" },
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		adaptive_size = true,
		side = 'left',
		width = { max = 35 },
		preserve_window_proportions = true,
	},
	git = {
		enable = true,
		ignore = false,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
    -- root_folder_label = ":~:s?$?/..?",
  	decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut", },
		root_folder_label = ":t",
		highlight_git = true,
		highlight_opened_files = 'none',
		full_name = true,
		hidden_display = "all",

		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
        diagnostics = true,
			},

			glyphs = {
				default = '󰈚',
				symlink = '',
				folder = {
					default = '',
					empty = '',
					empty_open = '',
					open = '',
					symlink = '',
					symlink_open = '',
					arrow_open = '',
					arrow_closed = '',
				},
				git = {
					unstaged = '✗',
					staged = '✓',
					unmerged = '',
					renamed = '➜',
					untracked = '★',
					deleted = '',
					ignored = '◌',
				},
			},
		},
	},
}


return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup(opts)
		vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'nvimtree toggle window' })
		vim.keymap.set('n', '<leader>n', '<cmd> NvimTreeFocus <CR>', { desc = 'nvimtree focus window' })
	end,
}
