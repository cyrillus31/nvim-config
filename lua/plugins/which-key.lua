return {
	{
		-- Useful plugin to show you pending keybinds.
		'folke/which-key.nvim',
		event = 'VimEnter', -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require('which-key').setup()

			-- Document existing key chains
			local wk = require 'which-key'
			wk.add {
				-- NOTE: config below is directly from my Kickstart setup
				-- { '<leader>c',  group = '[C]ode' },
				-- { '<leader>c_', hidden = true },
				-- { '<leader>d',  group = '[D]ocument' },
				-- { '<leader>d_', hidden = true },
				-- { '<leader>g',  group = '[G]it hunk' },
				-- { '<leader>g_', hidden = true },
				-- { '<leader>r',  group = '[R]ename' },
				-- { '<leader>r_', hidden = true },
				-- { '<leader>s',  group = '[S]earch' },
				-- { '<leader>s_', hidden = true },
				-- { '<leader>t',  group = '[T]oggle' },
				-- { '<leader>t_', hidden = true },
				-- { '<leader>w',  group = '[W]orkspace' },
				-- { '<leader>w_', hidden = true },
				-- { '<leader>b',  group = '[B]uffers' },
				-- { '<leader>b_', hidden = true },
				-- { '<leader>h',  group = '[H]arpoon' },
				-- { '<leader>h_', hidden = true },
				-- { '<leader>B',  group = 'De[B]ug' },
				-- { '<leader>B_', hidden = true },
			}
			-- visual mode
			wk.add {
				-- { '<leader>g', desc = '[G]it hunk', mode = 'v' },
			}
		end,
	},
}
