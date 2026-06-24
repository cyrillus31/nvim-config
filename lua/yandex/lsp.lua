-- Yandex Arcadia LSP configurations
-- Configures LSP servers specifically for Yandex's Arcadia development environment
-- Only applies when working in ~/arcadia directory

local function get_arcadia_root()
	local handle = io.popen("arc root 2>/dev/null")
	if not handle then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	if result and result ~= "" then
		return result:gsub("%s+$", "")
	end
	return nil
end

local arcadia_root = get_arcadia_root()
local allowed_dirs = {
	arcadia_root or vim.fn.expand("~/arcadia"),
}

local function is_allowed_dir()
	local cwd = vim.loop.cwd()
	if not cwd then
		return false
	end
	for _, dir in ipairs(allowed_dirs) do
		if vim.startswith(cwd, dir) then
			return true
		end
	end
	return false
end

if is_allowed_dir() and arcadia_root then
	-- Configure gopls using Yandex's 'ya tool' wrapper
	vim.lsp.config("gopls", {
		cmd = { "ya", "tool", "gopls", "serve" },
		settings = {
			gopls = {
				arcadiaIndexDirs = { arcadia_root .. "/library/go" },
				expandWorkspaceToModule = false,
			},
		},
	})

	-- Configure pyright with Yandex-specific Python environment
	-- Root markers define project boundaries for LSP analysis
	vim.lsp.config("pyright", {
		root_markers = {
			"pyrightconfig.json",
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			".git",
		},
		settings = {
			python = {
				pythonPath = "~/.venvs/taxi-python/bin",
				autoSearchPaths = false,
				analysis = {
					autoSearchPaths = true,
					-- diagnosticMode = "openFilesOnly",
					diagnosticMode = "all",
					useLibraryCodeForTypes = true,
				},
			},
		},
	})
end

return { {} }
