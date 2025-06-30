-- Install "neovim/nvim-lspconfig" in the most straighforward way possible (https://github.com/neovim/nvim-lspconfig)
-- In config field add configuration from https://luals.github.io/wiki/configuration/
-- Add "folke/lazydev.nvim" plugin so that LSP could see what 'vim' object in the lua code is.

local function autocommands_setup(event)
	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- When you move your cursor, the highlights will be cleared (the second autocommand).
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
		local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
			buffer = event.buf,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
			end,
		})
	end
end

local function lsp_keymap_setup(event, client)
	local map = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
	end

	-- Jump to the definition of the word under your cursor.
	--  This is where a variable was first declared, or where a function is defined, etc.
	--  To jump back, press <C-t>.
	map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

	-- Find references for the word under your cursor.
	map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

	-- Jump to the implementation of the word under your cursor.
	--  Useful when your language has ways of declaring types without an actual implementation.
	map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

	-- Jump to the type of the word under your cursor.
	--  Useful when you're not sure what type a variable is and you want to see
	--  the definition of its *type*, not where it was *defined*.
	map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

	-- Fuzzy find all the symbols in your current document.
	--  Symbols are things like variables, functions, types, etc.
	map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

	-- Fuzzy find all the symbols in your current workspace.
	--  Similar to document symbols, except searches over your entire project.
	map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- Rename the variable under your cursor.
	--  Most Language Servers support renaming across files, etc.
	map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	-- Opens a popup that displays documentation about the word under your cursor
	--  See `:help K` for why this keymap.
	map('K', vim.lsp.buf.hover, 'Hover Documentation')

	-- NOTE: this is my own setup
	--- Displays signature information about the symbol under the cursor in a
	--- floating window.
	map('L', vim.lsp.buf.signature_help, 'Signature help')

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

	-- Enable inlay hints in your code, if the language server you are using supports them
	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		map('<leader>th', function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, '[T]oggle Inlay [H]ints')
	end
end

local dependencies = {
	-- lazydev
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Mason
	{ 'williamboman/mason.nvim', config = true },  -- NOTE: Must be loaded before dependants

	-- Mason-lspconfig
	'williamboman/mason-lspconfig.nvim',

	-- TODO: remove maybe later if all works
	-- 'WhoIsSethDaniel/mason-tool-installer.nvim', -- NOTE: not sure if this one is required

	-- Fidget
	{ 'j-hui/fidget.nvim',       opts = {} },
}

local function autoformat_on_save_setup(event, client)
	-- Auto-format ("lint") on save.
	-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
	if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
			buffer = event.buf,
			callback = function()
				vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
			end,
		})
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = dependencies,
		config = function()
			local lspconfig = require('lspconfig')

			-- TODO: if Mason doesn't set it up - uncomment the line below!
			-- lspconfig.lua_ls.setup({})

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})

			-- NOTE: format on save can also be achieved by 'stevearc/conform.nvim' plugin
			-- Code below is from ':help lsp'
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if not client then return end

					lsp_keymap_setup(event, client)
					autoformat_on_save_setup(event, client)
					autocommands_setup(event)
				end,
			})
		end,
	},
}
