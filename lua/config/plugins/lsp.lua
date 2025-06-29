-- Install "neovim/nvim-lspconfig" in the most straighforward way possible (https://github.com/neovim/nvim-lspconfig)
-- In config field add configuration from https://luals.github.io/wiki/configuration/
-- Add "folke/lazydev.nvim" plugin so that LSP could see what 'vim' object in the lua code is.
return {
  {
    "neovim/nvim-lspconfig",
	   dependencies = {
	      {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
	  library = {
	    -- See the configuration section for more details
	    -- Load luvit types when the `vim.uv` word is found
	    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	  },
	},
	     },
	   },
    config = function()
      -- NOTE: the following method is recommended but I don't know to how to configure setup then.
      -- vim.lsp.enable("lua_ls")
      -- vim.lsp.config("lua_la", {
      require('lspconfig').lua_ls.setup{
	cmd = { "/home/kfedtsov/.config/lua-language-server/bin/lua-language-server" },
	settings = {
	  Lua = {
	    runtime = {
	      version = "LuaJIT"
	    }
	  }
	},
      }
    end,
  },
}
