return {
	{
		"fatih/vim-go",
		config = function ()
			vim.cmd(":GoInstallBinaries")
		end
	},
}
