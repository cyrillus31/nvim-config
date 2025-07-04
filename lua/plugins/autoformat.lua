return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		enabled = true,
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			format_on_save = true,
			-- format_on_save = function(bufnr)
			--   -- Disable "format_on_save lsp_fallback" for languages that don't
			--   -- have a well standardized coding style. You can add additional
			--   -- languages here or re-enable it for the disabled ones.
			--   local disable_filetypes = { c = true, cpp = true, python = true, py = true }
			--   return {
			--     timeout_ms = 500,
			--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			--   }
			-- end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "black", "isort" },
				go = { "gofmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
