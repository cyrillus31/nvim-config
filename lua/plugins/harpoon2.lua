-- Harpoon (v2) by ThePrimeagen
-- Plugin for navigation
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

local function telescope_setup()
	-- basic telescope configuration
	local harpoon = require("harpoon")
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end

	vim.keymap.set("n", "<leader>ht", function()
		toggle_telescope(harpoon:list())
	end, { desc = "[H]arpoon [T]elescope" })
end
return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			-- Key mappings
			local harpoon = require("harpoon")
			harpoon.setup()
			telescope_setup()

			-- Setup key bindings
			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "[H]arpoon [A]dd" })

			vim.keymap.set("n", "<leader>hm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "[H]arpoon [M]enu" })
		end,
	},
}
