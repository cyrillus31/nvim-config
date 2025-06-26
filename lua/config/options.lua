vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 20

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

--[[ Preview substitutions live, as you type!
vim.opt.inccommand is a setting in Neovim (and Vim) that controls the behavior of the command-line interface when using certain commands, particularly for substitutions. When enabled, it provides a live preview of the changes that would be made by a substitution command as you type it.
Usage
Value: The inccommand option can be set to different values:
nosplit: This is the default behavior, where no live preview is shown.
split: This shows the live preview in a split window.
screen: This shows the live preview in the current window.
--]]
vim.opt.inccommand = 'split'

-- Highlight which line your cursor is on
vim.opt.cursorline = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false
vim.g.have_nerd_font = true
