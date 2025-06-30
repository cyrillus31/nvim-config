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



# Neovim Key Combination Cheat Sheet

## Key Notation

- **Angle Brackets (`< >`)**: Used to denote special keys.
  - Example: `<C-x>` means "Control + x".

- **No Hyphen (`-`)**: Keys are written in sequence without hyphens.
  - Example: `Space f` is written as `<Space>f`.

## Common Key Combinations

### Single Modifier Keys
- **Control**: `<C-x>` (Control + x)
- **Shift**: `<S-x>` (Shift + x)
- **Alt**: `<A-x>` or `<M-x>` (Alt + x)

### Function Keys
- **F1 to F12**: `<F1>`, `<F2>`, ..., `<F12>`

### Special Keys
- **Escape**: `<Esc>`
- **Tab**: `<Tab>`
- **Enter**: `<CR>` (Carriage Return)
- **Backspace**: `<BS>`
- **Home**: `<Home>`
- **End**: `<End>`
- **Page Up**: `<PageUp>`
- **Page Down**: `<PageDown>`

### Combining Keys
- **Control + Key**: `<C-a>`, `<C-b>`, etc.
- **Shift + Key**: `<S-a>`, `<S-b>`, etc.
- **Alt + Key**: `<A-a>`, `<A-b>`, etc.
- **Multiple Keys**: 
  - Example: `Ctrl + Shift + x` is `<C-S-x>`.

### Chords
- **Sequential Key Presses**: 
  - Example: Pressing `Space` followed by `f` is `<Space>f`.

## Summary of Notation
- **Single Key**: `<KeyName>` (e.g., `<Esc>`, `<Tab>`)
- **Modifier + Key**: `<Modifier-Key>` (e.g., `<C-x>`, `<S-x>`)
- **Chords**: `<Modifier>Key` (e.g., `<Space>f`)

