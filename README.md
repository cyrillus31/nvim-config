# nvim-config
My own NVIM config from ground up

### How to create an alias to a different configuration
```bash
alias nvim='NVIM_APPNAME="nvim-baldingbuilder" nvim'
```

### Dependencies
##### FZF:
- ripgrep
- fzf
- wget
- unzip
- npm

### Lazy + LSP setup
Lazy -> Mason -> mason-lspconfig -> ensure_installed

### TODO
___
- [x] Quality of life keymaps + whichkey plugin (moving around splits, etc.)
    - [x] Shiftwidth, number, relativenumber
    - [x] vim.opt.clipboard = "unnamedplus"
- [ ] Filetype plugins: 'after/ftplugin'
    - [x] lua.lua
    - [ ] python.lua
    - [ ] go.lua
- [x] Nvim-Treesitter
- [x] Theme
    - [ ] Optional: Theme manager?
- [x] Lazy (Package Manager)
- [x] Status Line (Lualine or Mini)
    - [x] [mini.statusline](https://github.com/echasnovski/mini.statusline)
    - [x] [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [x] [Mason.nvim](https://github.com/mason-org/mason.nvim): LSP/DAP/Linter/Formatter package manager
    - [x] [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim): automatically install and enable LSPs with Mason
    - [x] [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim): to just install formatters automatically via Mason (but configure with conform.nvim)
    - [x] [mason-nvim-lint](https://github.com/mfussenegger/nvim-lint): to install and enable linters
    - [x] [fidget.nvim](https://github.com/j-hui/fidget.nvim): for bottom right corner LSP status updates
    - [x] Lua
        - [x] folke/lazydev.nvim (make LSP knowledgeable about global 'vim' variable and so on)
        - [x] lua_ls (lsp)
        - [x] stylua (formatter)
    - [x] Go
        - [x] gopls (lsp)
    - [x] Python
        - [x] pyright (linter)
    - [x] c / cpp
        - [x] clangd
    - [ ] js/ts (?)
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): repo with basic default LSP configurations
- [x] Formatting (done by 'conform.nvim')
    - [x] On command (<space-f>)
    - [x] On save
- [x] Autocompletion (<C-x><C-o> works by default omni completion)
    - [x] [Blink.cmp](https://github.com/Saghen/blink.cmp)
- [x] [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    - [x] Various searches + key maps
- [x] [Harpoon (v2)](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [x] Floating terminal
    - [x] [FTerm](https://github.com/numToStr/FTerm.nvim)
    - [ ] Optional: Custom floating terminal
    - [x] Optional: [NvChad/nvterm](NvChad/nvterm)
- [x] File tree manager
    - [x] [Oil](https://github.com/stevearc/oil.nvim)
    - [x] [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
    - [x] [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [x] [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [ ] DEBUGGING
    - [ ] Go
    - [ ] Python
    - [ ] Optional: Lua 
- [ ] Custom scripts
    - [x] Visual mode multiline append
    - [ ] Visual mode multiline prepend (not ready yet)
- [x] Startup screen
    - [x] [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
    - [ ] Optional: [alpha-nvim](https://github.com/goolord/alpha-nvim)
    - [ ] Optional: [startup-nvim](https://github.com/max397574/startup.nvim)

- [ ] From kickstart.nvim
    - [x] vim.highlight.on_yank()
    - [x] [autopairs](windwp/nvim-autopairs)
    - [x] [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
    - [x] [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
    - [x] whichkey setup
    - [ ] lints
    - [ ] debug (?)

## Cheatsheet
[cheatsheet.md](cheatsheet.md)


