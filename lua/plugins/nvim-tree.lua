local opts = {
	filters = {
		dotfiles = true, -- use H to turn on dotfiles
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
		width = 20,
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
		root_folder_label = false,
		highlight_git = true,
		highlight_opened_files = 'none',

		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
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
