-- Key mapping to toggle linting (e.g., <leader>tl)
local function set_keymaps()
	vim.keymap.set("n", "<leader>tl", function()
		local lint = require("lint")
		for _, linter_name in ipairs(lint.get_running(vim.api.nvim_get_current_buf())) do
			local namespace = lint.get_namespace(linter_name)
			vim.diagnostic.config({ virtual_text = false }, namespace)
		end
		-- vim.api.nvim_del_autocmd(vim.api.nvim_get_autocmds({ group = "lint" })[1].id)
	end, { desc = "[T]oggle [L]inting", noremap = true, silent = true })
end

return {
	{
		"mfussenegger/nvim-lint",
		-- event = { "BufReadPre", "BufNewFile" }, -- WARN: it is advised to load the plugin on these events but configuration messes up the autoinstallation
		dependencies = "williamboman/mason.nvim",
		lazy = false,
		config = function()
			-- Confgiure linters with "nvim-lint"
			-- WARNING: "nvim-lint" doesn't have 'require("lint").setup({...})' command!
			-- Take a look at the source code!
			require("lint").linters_by_ft = {
				-- python = { "pylint" },
				-- lua = { "selene" },
				-- lua = { "luacheck" }, -- WARNING: "luacheck" requires "luarocks" package maanger for lua
				sh = { "shellcheck" },
				go = { "golangcilint" },

				-- NOTE: Below is default from nvim-lint (/home/user/.local/share/balding-nvim/lazy/nvim-lint/lua/lint.lua)
				text = nil,
				json = { "jsonlint" },
				markdown = nil,
				dockerfile = { "hadolint" },
				terraform = { "tflint" },
				-- markdown = { "vale" },
				-- text = { "vale" },
			}
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		config = function()
			-- WARNING: you don't have to provide configuration if you setup nvim-lint first!
			require("mason-nvim-lint").setup()
			-- require("mason-nvim-lint").setup({
			-- 	ensure_installed = {
			-- 		"shellcheck", -- bash
			-- 		"golangcilint", -- name 'golangci-lint' can't be used for installation
			-- 		-- "pylint",
			-- 		-- "selene",
			-- 		-- "luacheck", --WARNING: "luacheck" requires "luarocks" package maanger for lua
			-- 	},
			-- 	automatic_installation = true,
			-- 	quiet_mode = true, -- Don't show notifications on startup
			-- })

			set_keymaps()
			-- Setup an autocommand to trigger linting (https://github.com/mfussenegger/nvim-lint)
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
