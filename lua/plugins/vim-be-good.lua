return {
	"ThePrimeagen/vim-be-good",
	config = function()
		vim.keymap.set("n", "<leader>vbg", ":enew | VimBeGood<CR>", { desc = "[V]im[B]e[G]ood" })
	end,
}
