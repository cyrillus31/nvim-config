-- debug.lua
-- https://github.com/mfussenegger/nvim-dap
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",

			-- Required dependency for nvim-dap-ui
			"nvim-neotest/nvim-nio",

			-- Installs the debug adapters for you
			{ "jay-babu/mason-nvim-dap.nvim", dependencies = { "mason-org/mason.nvim" }, lazy = false },

			-- Shows variable values inline as virtual text
			"theHamsta/nvim-dap-virtual-text",

			-- Default debugger configurations (like nvim-lspconfig):
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{
				"<leader>bc",
				function()
					require("dap").continue()
				end,
				desc = "Debug: [C]ontinue/Start",
			},
			{
				"<leader>bsi",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: [S]tep [I]nto",
			},
			{
				"<leader>bsov",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: [S]tep [Ov]er",
			},
			{
				"<leader>bsou",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: [S]tep [Ou]t",
			},
			{
				"<leader>bt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: [T]oggle Breakpoint",
			},
			{
				"<leader>bB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Debug: Set Breakpoint",
			},
			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			{
				"<leader>br",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug: See last session [R]esult.",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			print("Trying to setup  DAPs!")
			require("mason-nvim-dap").setup({
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
					-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
					"delve", -- golang
					"python", -- python as per documentation of mason-nvim-dap
				},
			})

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			-- Change breakpoint icons
			vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
			vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
			local breakpoint_icons = vim.g.have_nerd_font
					and {
						Breakpoint = "",
						BreakpointCondition = "",
						BreakpointRejected = "",
						LogPoint = "",
						Stopped = "",
					}
				or {
					Breakpoint = "●",
					BreakpointCondition = "⊜",
					BreakpointRejected = "⊘",
					LogPoint = "◆",
					Stopped = "⭔",
				}
			for type, icon in pairs(breakpoint_icons) do
				local tp = "Dap" .. type
				local hl = (type == "Stopped") and "DapStop" or "DapBreak"
				vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
			end

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- Setup virtual text to show variable values inline
			require("nvim-dap-virtual-text").setup()

			-- Install golang specific config
			require("dap-go").setup({
				delve = {
					-- On Windows delve must be run attached or it crashes.
					-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
					detached = vim.fn.has("win32") == 0,
				},
			})

			-- Install python specific config
			require("dap-python").setup()
		end,
	},
}
