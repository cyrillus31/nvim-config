-- Yandex Go development plugin configurations
-- Installs and configures fatih/vim-go plugin for enhanced Go development
-- Automatically installs Go binaries on setup
return {
	{
		"fatih/vim-go",
		config = function ()
			vim.cmd(":GoInstallBinaries")
		end
	},
}
