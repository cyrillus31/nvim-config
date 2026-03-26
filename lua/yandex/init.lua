-- Yandex-specific Neovim configurations
-- This module combines LSP, formatter, and plugin configurations for Yandex's Arcadia environment
-- Only loaded when the 'ya' command is available (checked in lua/plugins/yandex.lua)

local lsp = require("yandex.lsp")          -- LSP configurations for Arcadia (gopls, pyright)
local formatters = require("yandex.formatters")  -- Formatter configurations
local vim_go = require("yandex.vim_go")     -- Go plugin configurations

local M = {
	unpack(lsp),
	unpack(formatters),
	-- unpack(vim_go),  -- Currently disabled
}

return M
