# Neovim Configuration Guide

This document provides an overview of the Neovim configuration structure, explaining where components are located and how they work together.

## Directory Structure

```
nvim/
├── init.lua              # Entry point - loads all config modules
├── lua/
│   ├── config/           # Core configuration files
│   │   ├── options.lua   # Neovim settings (options, UI, behavior)
│   │   ├── lazy.lua      # Plugin manager bootstrap and setup
│   │   ├── keymappings.lua # Custom keybindings
│   │   ├── autocommands.lua # Custom autocommands
│   │   ├── commands.lua  # Custom commands
│   │   └── diagnostic.lua # Diagnostic settings
│   ├── plugins/          # Plugin configurations (managed by Lazy)
│   ├── functions/        # Custom Lua functions
│   ├── utils/            # Utility functions
│   ├── yandex/           # Yandex-specific configurations
│   └── extensions/       # Non-Yandex specific tools/configurations
├── docs/                 # Documentation
│   ├── lua-basics.md     # Lua introduction for beginners
│   ├── neovim-basics.md  # Neovim-specific cheatsheet
│   └── configuration.md  # This file
└── after/
    └── ftplugin/         # Filetype-specific settings
```

## Configuration Flow

### 1. Entry Point (init.lua)
The `init.lua` file is the entry point that loads all configuration modules in order:

```lua
require("config.options")      -- Neovim settings
require("config.lazy")         -- Plugin manager
require("config.autocommands") -- Autocommands
require("config.commands")     -- Custom commands
require("config.keymappings")  -- Keybindings
require("config.diagnostic")   -- Diagnostic settings
```

### 2. Core Configuration (lua/config/)

#### options.lua
Contains all Neovim settings including:
- Indentation (shiftwidth, tabstop)
- UI appearance (numbers, colors, borders)
- Search behavior
- Cursor settings
- Whitespace display

#### lazy.lua
Bootstraps the Lazy.nvim plugin manager and sets up:
- Plugin specification path (`lua/plugins/`)
- Change detection settings
- Plugin update checker

#### keymappings.lua
All custom keybindings. Key categories:
- Window navigation (`<C-hjkl>`)
- Diagnostic navigation (`[d`, `]d`)
- Terminal handling
- Vim operations (save, reload)
- Custom search (`<leader>sq`)

#### autocommands.lua
Custom autocommands for events like:
- File type detection
- Buffer events
- Custom behaviors on specific events

#### commands.lua
Custom Ex commands defined with `vim.api.nvim_create_user_command`.

#### diagnostic.lua
Diagnostic configuration for LSP diagnostics display.

### 3. Plugins (lua/plugins/)

Each file in `lua/plugins/` configures a specific plugin. Plugins are loaded by Lazy from these files.

#### Plugin File Structure
Most plugin files follow this pattern:
```lua
return {
    "plugin-author/plugin-name",
    event = "VimEnter",  -- or other triggers like "BufReadPre"
    dependencies = { ... },
    config = function()
        -- Plugin configuration
    end,
}
```

#### Key Plugins

| Plugin | File | Purpose |
|--------|------|---------|
| Telescope | `telescope.lua` | Fuzzy finder, search, grep |
| LSP Config | `lspconfig.lua` | Language Server Protocol |
| Treesitter | `treesitter.lua` | Syntax highlighting |
| Lualine | `lualine.lua` | Status line |
| Harpoon | `harpoon2.lua` | Quick file access |
| Oil | `oil.lua` | File browser (git operations) |
| Conform | `autoformat.lua` | Code formatting |
| Which-key | `which-key.lua` | Keybinding helper |

#### LSP/DAP Tools

| Tool | File | Purpose |
|------|------|---------|
| Mason | (via lspconfig) | LSP/DAP/Linter/Formatter manager |
| clangd | `lspconfig.lua` | C/C++ LSP |
| pyright | `lspconfig.lua` | Python LSP |
| gopls | `lspconfig.lua` | Go LSP |
| nvim-dap | `debug_(DAP).lua` | Debugger |

### 4. Yandex-Specific (lua/yandex/)

Contains configurations specific to Yandex's Arcadia environment:
- `lsp.lua` - LSP configurations for gopls and pyright
- `formatters.lua` - Formatter configurations (yaformatter)
- `vim_go.lua` - Go plugin configurations
- `init.lua` - Combines all Yandex modules

**Important**: These are only loaded when the `ya` command is available.

### 5. Extensions (lua/extensions/)

Non-Yandex specific tools and configurations:
- Custom tool integrations
- External service configurations
- Development environment setups

This directory provides a way to add functionality without Yandex dependencies.

### 6. Filetype Plugins (after/ftplugin/)

Filetype-specific settings in `after/ftplugin/`:
- `lua.lua` - Lua-specific settings

## Quick Adjustments

### Adding a Plugin
1. Create a new file in `lua/plugins/` (e.g., `my-plugin.lua`)
2. Follow the plugin structure pattern
3. Lazy will automatically load it on next restart

### Changing Keybindings
Edit `lua/config/keymappings.lua` - all custom keymaps are defined there.

### Modifying Plugin Settings
Find the plugin file in `lua/plugins/` and edit the `config` function.

### Adding Custom Commands
Edit `lua/config/commands.lua` to add new Ex commands.

### Conditional Loading

To load plugins only in specific environments:

```lua
cond = function()
    return vim.fn.executable("ya") == 1
end
```

## Profiles / Environment Detection

The configuration supports different profiles:

### Yandex Profile
- Loaded when `ya` command is available
- Uses Yandex LSP configurations
- Includes Yandex-specific formatters

### Default Profile
- Standard Neovim configuration
- Works without Yandex tools

### Custom Profiles
Add new directories under `lua/` and load conditionally in `init.lua`.

## Tips

1. **Reload Configuration**: Press `<space>x` to source the current file
2. **Debug Keymaps**: Use `:WhichKey` or press `?` in Telescope
3. **Check Plugin Status**: `:Lazy` to see plugin list and status
4. **Update Plugins**: `:Lazy update` or `:Lazy sync`