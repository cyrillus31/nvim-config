print("!!!!!--BALDING NEOVIM--!!!!!")

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- =========Testing ground============ -- 
