-- This is an entry point for all your nvim configurataion.
-- Custom configuration is imported from ./lua/config and this is where 'Lazy' is installed.
-- ./lua/plugins directory is used to install plugins via 'Lazy'
-- Mason is installed as a dependency of 'nvim-lspconfig'

require("config.options")
require("config.lazy")
require("config.autocommands")
require("config.commands")
require("config.keymappings")
require("config.diagnostic")


-- change what defines root markers for pyright
-- Logic: if the first root marker is not found anywhere down to the root, it looks for the next marker after that
vim.lsp.config("pyright", {
	root_markers = {  "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }
})
