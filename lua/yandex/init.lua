local lsp = require("yandex.lsp")
local formatters = require("yandex.formatters")
local vim_go = require("yandex.vim_go")

local M = {
	unpack(lsp),
	unpack(formatters),
	-- unpack(vim_go),
}

return M
