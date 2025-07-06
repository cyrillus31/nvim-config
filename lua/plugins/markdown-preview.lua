-- Markdown-preview (with browser)
-- https://github.com/iamcco/markdown-preview.nvim

-- WARN: install with yarn or npm
-- Doesn't install correctly in Docker container with Fedora and npm
return {
	"iamcco/markdown-preview.nvim",
	enabled = false,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	lazy = false,
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
