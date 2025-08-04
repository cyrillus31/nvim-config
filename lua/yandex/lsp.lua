vim.lsp.config("gopls", {
	cmd = { "ya", "tool", "gopls", "serve" },
	settings = {
		gopls = {
			arcadiaIndexDirs = { vim.fn.expand("~/arcadia/library/go") },
			expandWorkspaceToModule = false,
		},
	},
})

return { {} }
