-- This is an entry point for all your nvim configurataion.
-- Custom configuration is imported from ./lua/config and this is where 'Lazy' is installed.
-- ./lua/plugins directory is used to install plugins via 'Lazy'
-- Mason is installed as a dependency of 'nvim-lspconfig'

require("config.options")
require("config.lazy")
require("config.autocommands")
require("config.keymappings")
require("config.diagnostic")
