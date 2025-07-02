-- Key mapping to toggle linting (e.g., <leader>tl)
vim.api.nvim_set_keymap(
	"n",
	"<leader>tl",
	":lua Toggle_linting()<CR>",
	{ desc = "Toggle linting", noremap = true, silent = true }
)

function Toggle_linting()
	linting_enabled = not linting_enabled -- Toggle the state
	if linting_enabled then
		print("Linting enabled")
		-- Re-enable linting by setting up the autocommand again
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
			group = "lint", -- Use a group to avoid duplicate autocommands
		})
	else
		print("Linting disabled")
		-- Clear the autocommand to disable linting
		vim.api.nvim_del_autocmd(vim.api.nvim_get_autocmds({ group = "lint" })[1].id)
	end
end

return {}

-- return {
-- 	{ "mfussenegger/nvim-lint" },
-- 	{
-- 		"rshkarin/mason-nvim-lint",
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 			"mfussenegger/nvim-lint",
-- 		},
-- 		config = function()
-- 			-- 1)
-- 			-- Confgiure linters with "nvim-lint"
-- 			-- WARNING: "nvim-lint" doesn't have 'setup' command!
-- 			-- Take a look at the source code!
-- 			require("lint").linters_by_ft = {
-- 				-- python = { "pylint" },
-- 				-- lua = { "selene" },
-- 				-- lua = { "luacheck" }, -- WARNING: "luacheck" requires "luarocks" package maanger for lua
-- 				-- go = { "golangcilint" },
-- 				-- NOTE: Below is default from nvim-lint
-- 				-- (/home/user/.local/share/balding-nvim/lazy/nvim-lint/lua/lint.lua)
-- 				text = { "vale" },
-- 				json = { "jsonlint" },
-- 				markdown = { "vale" },
-- 				dockerfile = { "hadolint" },
-- 				terraform = { "tflint" },
-- 			}
--
-- 			-- 2)
-- 			-- Setup download of linters with "mason-nvim-lint"
-- 			require("mason-nvim-lint").setup({
-- 				ensure_installed = {
-- 					-- "golangcilint", -- 'golangci-lint' can't be used for installation
-- 					-- "pylint",
-- 					-- "selene",
-- 					-- "luacheck", --WARNING: "luacheck" requires "luarocks" package maanger for lua
-- 				},
-- 				automatic_installation = true,
-- 				quiet_mode = true, -- Don't show notifications on startup
-- 			})
--
-- 			-- 3)
-- 			-- Setup an autocommand to trigger linting (https://github.com/mfussenegger/nvim-lint)
-- 			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
-- 			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
-- 				group = lint_augroup,
-- 				callback = function()
-- 					require("lint").try_lint()
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
