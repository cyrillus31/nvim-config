vim.lsp.config("gopls", {
	cmd = { "ya", "tool", "gopls", "serve" },
	settings = {
		gopls = {
			arcadiaIndexDirs = { vim.fn.expand("~/arcadia/library/go") },
			expandWorkspaceToModule = false,
		},
	},
})

-- change what defines root markers for pyright
-- Logic: if the first root marker is not found anywhere down to the root, it looks for the next marker after that
vim.lsp.config("pyright", {
	root_markers = {  "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
	settings = {
		python = {
			pythonPath = "~/.venvs/taxi-python/bin",
			autoSearchPaths = false,
			analysis = {
				autoSearchPaths = true,
				-- diagnosticMode = "openFilesOnly",
				diagnosticMode = "all",
				useLibraryCodeForTypes = true
			},
		}
	}
})

return { {} }
