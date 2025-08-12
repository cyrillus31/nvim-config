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
		RESIZE_MOD_NOTIFICATION = "Resize Mode: ON (h/j/k/l to resize, <Esc> or q to exit)"
		vim.notify(RESIZE_MOD_NOTIFICATION, vim.log.levels.INFO)
		vim.keymap.set("n", "h", ":vertical resize -2<CR>:lua print(RESIZE_MOD_NOTIFICATION)<CR>", { desc = "Resize left" })
		vim.keymap.set("n", "l", ":vertical resize +2<CR>:lua print(RESIZE_MOD_NOTIFICATION)<CR>", { desc = "Resize right" })
		vim.keymap.set("n", "j", ":resize -1<CR>:lua print(RESIZE_MOD_NOTIFICATION)<CR>", { desc = "Resize down" })
		vim.keymap.set("n", "k", ":resize +1<CR>:lua print(RESIZE_MOD_NOTIFICATION)<CR>", { desc = "Resize up" })
		vim.keymap.set("n", "<Esc>", ResizeModeToggle, { desc = "Exit Resize Mode" })
		vim.keymap.set("n", "q", ResizeModeToggle, { desc = "Exit Resize Mode" })
	else
		-- Exit resize mode: remove global keymaps for h/j/k/l
		resize_mode = false
		vim.notify("Resize Mode: OFF", vim.log.levels.INFO)
		vim.keymap.del("n", "h")
		vim.keymap.del("n", "l")
		vim.keymap.del("n", "j")
		vim.keymap.del("n", "k")
		vim.keymap.del("n", "<Esc>")
		vim.keymap.del("n", "q")
		RESIZE_MOD_NOTIFICATION = ""
	end
end

vim.api.nvim_create_user_command("ResizeModeToggle", ResizeModeToggle, {})

vim.keymap.set("n", "<leader>vmr", ":ResizeModeToggle <CR>", { desc = "Resize Mode Toggle" })
