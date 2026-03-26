-- Yandex Arcadia LSP configurations
-- Configures LSP servers specifically for Yandex's Arcadia development environment
-- Only applies when working in ~/arcadia directory

local allowed_dirs = {
	vim.fn.expand("~/arcadia"),
}

local function is_allowed_dir()
	local cwd = vim.loop.cwd()
	for _, dir in ipairs(allowed_dirs) do
		if vim.startswith(cwd, dir) then
			return true
		end
	end
	return false
end

if is_allowed_dir() then
	-- Configure gopls using Yandex's 'ya tool' wrapper
	vim.lsp.config("gopls", {
		cmd = { "ya", "tool", "gopls", "serve" },
		settings = {
			gopls = {
				arcadiaIndexDirs = { vim.fn.expand("~/arcadia/library/go") },
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
