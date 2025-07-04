local M = {}

-- Function to load all Lua modules from a specified directory realtive to ~/.config/nvim
function M.load_modules_from_directory(directory)
	directory = vim.fn.stdpath("config") .. "/" .. directory
	local combined = {}

	-- Use vim.uv (vim.loop is deprecated) to read the directory
	local handle = vim.uv.fs_scandir(directory)
	if not handle then
		return combined -- Return empty if the directory cannot be scanned
	end

	-- Iterate through the directory entries
	while true do
		local name, type = vim.uv.fs_scandir_next(handle)
		if not name then
			break
		end -- Break if there are no more entries

		if type == "file" and name:match("%.lua$") and name ~= "init.lua" then -- Check if it's a .lua file
			local module_name = name:sub(1, -5) -- Remove the .lua extension
			local module_path = directory:gsub("/", ".") .. "." .. module_name -- Use dot notation for require
			local module = require(module_path) -- Require the module
			table.insert(combined, module) -- Insert the module table into combined
		end
	end

	return combined
end

return M
