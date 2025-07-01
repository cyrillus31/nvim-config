local M = {}

function M.multiline_append()
	local first_line = vim.fn.line("'<")
	local last_line = vim.fn.line("'>")
	local to_append = vim.fn.input("Text to append:\n")
	for i = first_line, last_line do
		local line_text = vim.fn.getline(i)
		vim.fn.setline(i, line_text .. to_append)
	end
end

function M.multiline_prepend()
	local first_line = vim.fn.line("'<")
	local last_line = vim.fn.line("'>")
	local to_prepend = vim.fn.input("Text to prepend:\n")
	for i = first_line, last_line do
		local line_text = vim.fn.getline(i)
		vim.fn.setline(i, to_prepend .. line_text)
	end
end

return M
