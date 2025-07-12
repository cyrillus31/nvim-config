# nvim-config
My own [NeoVim](https://neovim.io/) config from ground up.

NVIM v0.11.2  
Build type: RelWithDebInfo  
LuaJIT 2.1.1744318430
Lua 5.1

## How to install

### Backup your current NeoVim files
```bash
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
# {,.bak} is a brace expansion command which translates to the same thing
```

### Clone the repository and watch Lazy install everything
```bash
git clone https://github.com/cyrillus31/nvim-config.git ~/.config/nvim && nvim
```

### Use alias to run new configuration from a different directory
```bash
git clone https://github.com/cyrillus31/nvim-config.git ~/.config/new-nvim-config
echo alias newnvim="'NVIM_APPNAME=new-nvim-config nvim'" >> ~/.bashrc
source ~/.bashrc
newnvim
```

### Test installation in a self-destructing Docker contianer with Fedora

```bash
source run_in_container.sh
```

### Dependencies
- neovim
- git
- ripgrep
- fzf
- wget
- unzip
- npm -> yarn *(for markdown-preview)*

## Cheatsheet
[lua_neovim_cheatsheet.md](lua_neovim_cheatsheet.md)

### TODO
___
- [x] Nvim-Treesitter
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
- [x] DEBUGGING
    - [x] [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
    - [x] Go
    - [x] Python
    - [ ] Optional: Lua 
- [x] [Which-key](https://github.com/folke/which-key.nvim)
- [x] Colorschemes
    - [x] [Nightfox](https://github.com/EdenEast/nightfox.nvim) *(the best theme)*
    - [x] kanagawa
    - [x] tokyonight
    - [x] catppuccin
    - [x] gruvbox
    - [x] github-nvim-theme
- [x] [autopairs](windwp/nvim-autopairs)
- [x] [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [x] [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) indentation guidelines
- [x] [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) show hex values colors as inline text
- [x] [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) autoclose **html** tags
- [x] Quality of life keymaps (moving around splits, clipbaord, etc.)
- [ ] Filetype plugins: 'after/ftplugin'
    - [x] lua.lua
    - [ ] python.lua
    - [ ] go.lua
- [ ] Custom scripts
    - [x] Visual mode multiline append
    - [ ] Visual mode multiline prepend (not ready yet)
- [x] Startup screen
    - [x] [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
    - [ ] Optional: [alpha-nvim](https://github.com/goolord/alpha-nvim)
    - [ ] Optional: [startup-nvim](https://github.com/max397574/startup.nvim)

- [x] From kickstart.nvim
    - [x] vim.highlight.on_yank()
    - [x] whichkey setup



