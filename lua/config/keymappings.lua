vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "j", "gj", { desc = "Move down a visual line" })
vim.keymap.set("n", "k", "gk", { desc = "Move down a visual line" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- Splits
vim.keymap.set("n", "<S-A-l>", ":vertical resize +5 <CR>")
vim.keymap.set("n", "<S-A-h>", ":vertical resize -5 <CR>")
vim.keymap.set("n", "<S-A-k>", ":resize +1 <CR>")
vim.keymap.set("n", "<S-A-j>", ":resize -1 <CR>")

--Terminal
-- This won"t work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<C-t>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Functions
local f = "require('functions.text_manipulation')"
vim.keymap.set("x", "<s-a>", "<Esc><Cmd>lua " .. f .. ".multiline_append()<CR>")
-- vim.keymap.set("x", "I", "<Esc><Cmd>lua " .. f .. ".multiline_prepend()<CR>")

-- Tabs
vim.keymap.set("n", "<Tab>", "<cmd> tabnext <CR>", { desc = "next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd> tabprevious <CR>", { desc = "next tab" })

-- Vim
vim.keymap.set("n", "<leader>vr", ":bufdo e<CR>", { desc = "[R]eload all buffers (:bufdo e)" })
vim.keymap.set("n", "<leader>vs", ":wa<CR>", { desc = "[S]ave all buffers (:wa)" })
