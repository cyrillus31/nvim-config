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
      -- vim.lsp.enable("lua_ls")
      require('lspconfig').lua_ls.setup{
	settings = {
	  Lua = {
	    runtime = {
	      version = "LuaJIT"
	    }
	  }
	}
      }


    end,
  },
}
