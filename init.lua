print("balding neovim!")

require("config.lazy")


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
