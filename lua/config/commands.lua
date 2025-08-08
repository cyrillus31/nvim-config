vim.api.nvim_create_user_command("Luaversion", function()
	print(_VERSION)
end, { desc = "Shows Lua version used." })


----------------------------------
-------SPLIT RESIZE MODE----------
----------------------------------

-- Resize splits
-- Global state flag
local resize_mode = false

function ResizeModeToggle()
	if not resize_mode then
		-- Enter resize mode: set global keymaps for h/j/k/l
		resize_mode = true
		vim.notify("Resize Mode: ON (h/j/k/l to resize, <Esc> to exit)", vim.log.levels.INFO)
		vim.keymap.set("n", "h", ":vertical resize -2<CR>", { desc = "Resize left" })
		vim.keymap.set("n", "l", ":vertical resize +2<CR>", { desc = "Resize right" })
		vim.keymap.set("n", "j", ":resize -1<CR>", { desc = "Resize down" })
		vim.keymap.set("n", "k", ":resize +1<CR>", { desc = "Resize up" })
		vim.keymap.set("n", "<Esc>", ResizeModeToggle, { desc = "Exit Resize Mode" })
	else
		-- Exit resize mode: remove global keymaps for h/j/k/l
		resize_mode = false
		vim.notify("Resize Mode: OFF", vim.log.levels.INFO)
		vim.keymap.del("n", "h")
		vim.keymap.del("n", "l")
		vim.keymap.del("n", "j")
		vim.keymap.del("n", "k")
		vim.keymap.del("n", "<Esc>")
	end
end

vim.api.nvim_create_user_command("ResizeModeToggle", ResizeModeToggle, {})

vim.keymap.set("n", "<leader>vmr", ":ResizeModeToggle <CR>", { desc = "Resize Mode Toggle" })
