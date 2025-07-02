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
- [x] MASON (LSP Manager)
    - [x] Lua
        - [x] lua_ls (lsp)
        - [x] stylua (formatter)
    - [x] Go
        - [x] gopls (lsp)
    - [x] Python
        - [x] pyright (linter)
    - [x] c
        - [x] clangd
    - [ ] Markdown
    - [ ] cpp (?)
    - [ ] js/ts (?)
- [x] nvim-lspconfig: Lua (Lua-LS), Go, Python, C, C++ (Optional: Markdown, JS, TS)
    - [x] folke/lazydev.nvim
- [x] Formatting (done by 'conform.nvim')
    - [x] On command (<space-f>)
    - [x] On save
- [ ] Autocompletion (<C-x><C-o> works by default omni completion)
- [x] [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    - [x] Various searches + key maps
- [ ] [Harpoon (v2)](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [ ] Cusom floating terminal + key maps
    - [ ] Optional: [NvChad/nvterm](NvChad/nvterm)
- [x] File tree manager
    - [x] Oil
    - [x] NvimTree
    - [x] Neo-Tree [link](https://github.com/nvim-neo-tree/neo-tree.nvim)

- [ ] Custom scripts
    - [x] Visual mode multiline append
    - [x] Visual mode multiline prepend (not ready yet)

- [ ] From kickstart.nvim
    - [x] vim.highlight.on_yank()
    - [x] autopairs [link](windwp/nvim-autopairs)
    - [ ] gitsigns
    - [ ] indentline
    - [ ] lints
    - [ ] debug (?)
    - [x] whichkey setup

## Cheatsheet
[cheatsheet.md](cheatsheet.md)


