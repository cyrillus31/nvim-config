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
- [ ] Quality of life keymaps + whichkey plugin (moving around splits, etc.)
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
- [ ] MASON (LSP Manager)
    - [ ] lua_ls
    - [ ] gopls
    - [ ] pyright
    - [ ] Markdown
    - [ ] c (?)
    - [ ] cpp (?)
    - [ ] js/ts (?)
- [ ] nvim-lspconfig: Lua (Lua-LS), Go, Python, Markdown, C, C++, JS, TS
    - [x] folke/lazydev.nvim
- [ ] Formatting
    - [ ] On command (<space-f>)
    - [x] On save
- [ ] Autocompletion (<C-x><C-o> works by default omni completion)
- [ ] Telescope [link](https://github.com/nvim-telescope/telescope.nvim)
    - [ ] Various searches + key maps
- [ ] Harpoon (v2) [link](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [ ] Cusom floating terminal + key maps
    - [ ] Optional: [NvChad/nvterm](NvChad/nvterm)
- [ ] File tree manager
    - [ ] Oil
    - [ ] NvimTree
    - [ ] Neo-Tree [link](https://github.com/nvim-neo-tree/neo-tree.nvim)

- [ ] Custom scripts
    - [ ] Visual mode multiline append
    - [ ] Visual mode multiline prepend (not ready yet)

- [ ] From kickstart.nvim
    - [x] vim.highlight.on_yank()
    - [ ] autopairs [link](windwp/nvim-autopairs)
    - [ ] gitsigns
    - [ ] indentline
    - [ ] lints
    - [ ] debug (?)
    - [ ] whichkey setup




