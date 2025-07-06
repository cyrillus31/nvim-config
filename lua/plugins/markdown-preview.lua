-- Markdown-preview (with browser)
-- https://github.com/iamcco/markdown-preview.nvim

-- WARN: install with yarn or npm
-- Doesn't install correctly in Docker without yarn: `dnf install -y npm && npm install -g yarn`

return {
	"iamcco/markdown-preview.nvim",
	enabled = true,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	lazy = false,
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
