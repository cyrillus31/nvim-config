return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		enabled = true,
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						async = false,
						timeout_ms = 5000,
						lsp_fallback = true,
						callback = function(bufnr, formatters)
							for _, formatter in pairs(formatters) do
								if formatter.name == "yaformatter" then
									vim.cmd(":e!") -- reload buffer after formatting. Required for "yaformatter".
									break
								end
							end
						end,
					})
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			async = true,
			notify_on_error = true,
			notify_no_formatters = true,
			timeout_ms = 2000,
			format_on_save = {
				lsp_fallback = true,
				ignore_filetypes = { "python", "py" }, -- <--- This is what you need
			},
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
				-- python = { "black", "isort" }, -- can't be used at Yandex
				go = { "gofmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },

				python = { "yaformatter", "black", "isrot", stop_after_first = true }, -- NOTE: yadnex
			},
			formatters = {
				yaformatter = {
					command = "ya",
					args = { "tool", "tt", "format", "$FILENAME" },
				},
			},
		},
	},
}
