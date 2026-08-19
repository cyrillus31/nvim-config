# Neovim Configuration

My personal [Neovim](https://neovim.io/) configuration, built from the ground up.

**NVIM** v0.11.2 | **LuaJIT** 2.1.1744318430 | **Lua** 5.1

---

## Installation

### Quick Start

```bash
# Backup existing config (optional but recommended)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone and install
git clone https://github.com/cyrillus31/nvim-config.git ~/.config/nvim && nvim
```

### Run Alongside Existing Config

```bash
git clone https://github.com/cyrillus31/nvim-config.git ~/.config/new-nvim-config
echo "alias newnvim='NVIM_APPNAME=new-nvim-config nvim'" >> ~/.bashrc
source ~/.bashrc
newnvim
```

### Test in Docker

```bash
./run_in_container.sh
```

### Dependencies

| Tool | Purpose |
|------|---------|
| neovim | Editor |
| git | Version control |
| ripgrep | Fast grep (Telescope) |
| fzf | Fuzzy finder |
| make | Build tools (Telescope-fzf-native) |
| npm | Package manager (markdown-preview) |
| python| Programming language|
| go | Programming language |

---

## Features

- **Plugin Management** — Lazy.nvim with auto-updates
- **Language Servers** — LSP via nvim-lspconfig + Mason
- **Smart Formatting** — conform.nvim with auto-format on save
- **Fuzzy Search** — Telescope with hidden files, globs, and custom queries
- **Syntax Highlighting** — Treesitter with context awareness
- **Debugging** — nvim-dap for Go and Python
- **Git Integration** — gitsigns, oil.nvim
- **Quick Access** — Harpoon2, buffers, recent files
- **Yandex Integration** — Arcadia-aware LSP and formatters

---

## Key Bindings

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Move between windows |
| `Tab` / `Shift+Tab` | Next/previous tab |
| `j` / `k` | Move by visual lines |
| `[d` / `]d` | Previous/next diagnostic |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>sh` | Help tags |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>sd` | Diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Buffers |
| `<leader>sa` | All files (hidden) |
| `<leader>saf` | All files |
| `<leader>sag` | Grep all (hidden) |
| `<leader>sq` | Grep with globs |

### Files

| Key | Action |
|-----|--------|
| `<leader>fe` | NvimTree |
| `<leader>of` | Oil (current dir) |
| `<leader>pv` | Oil (parent dir) |

### Editing

| Key | Action |
|-----|--------|
| `<space>sq` | Search + grep with file filters |
| `<leader>x` | Source current file |
| `<leader>vr` | Reload all buffers |
| `<leader>vs` | Save all buffers |

### Other

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlight |
| `<space>f` | Format buffer |
| `<space>?` | Which-key help |

---

## Configuration Structure

```
lua/
├── config/           # Core settings
│   ├── options.lua   # Neovim options
│   ├── lazy.lua      # Plugin manager
│   ├── keymappings.lua # Keybindings
│   ├── autocommands.lua
│   ├── commands.lua
│   └── diagnostic.lua
├── plugins/          # Plugin configurations
├── yandex/          # Yandex/Arcadia specific
└── extensions/      # External tools (non-Yandex)
```

---

## Documentation

| Document | Description |
|----------|-------------|
| [Configuration Guide](docs/configuration.md) | Overview of config structure |
| [Lua Basics](docs/lua-basics.md) | Lua introduction for beginners |
| [Neovim Cheatsheet](docs/neovim-basics.md) | Key bindings and commands |
| [Full Cheatsheet](lua_neovim_cheatsheet.md) | Extended reference |

---

## Profiles

The configuration supports two modes:

### Default Mode
Standard Neovim setup without Yandex tools.

### Yandex Mode
Loaded automatically when the `ya` command is available:
- Yandex LSP configurations (gopls, pyright)
- YaFormatter integration
- Arcadia-aware root markers

---

## TODO

- [x] Nvim-Treesitter
- [x] Lazy (Package Manager)
- [x] Status Line (Lualine or Mini)
- [x] Mason.nvim: LSP/DAP/Linter/Formatter package manager
- [x] Formatting (conform.nvim)
- [x] Autocompletion (Blink.cmp)
- [x] Telescope with key maps
- [x] Harpoon (v2)
- [x] Floating terminal (FTerm, nvterm)
- [x] File tree managers (Oil, NvimTree, Neo-Tree)
- [x] Markdown-preview
- [x] Debugging (nvim-dap-ui) — Go, Python
- [x] Which-key
- [x] Colorschemes
- [x] Autopairs, gitsigns, indent-blankline
- [x] Startup screen (dashboard-nvim)
- [ ] Filetype plugins: python.lua, go.lua
- [ ] Custom scripts
- [ ] Implement profiles
- [ ] Yandex integration improvements
- [ ] Copilot / AI coding tools

---

## Contributing

This is a personal configuration, but suggestions and improvements are welcome via issues or PRs.

---

## Acknowledgments

Based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) patterns and best practices.
