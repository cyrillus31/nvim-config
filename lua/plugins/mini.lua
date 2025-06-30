-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md
return { 
  {
    'echasnovski/mini.nvim', 
    enable = true,
    version = false ,
    config = function()
      -- NOTE: It is advised to call require("mini.statusline").setup()
      local statusline = require("mini.statusline")
      statusline.setup( { use_icons = true } )
    end,
  }
}
