vim.api.nvim_create_user_command("Luaversion", function()
	print(_VERSION)
end, { desc = "Shows Lua version used." })
