# NVIM + Lua cheatsheet

## General

`opts = {}` is the same as calling `require('fidget').setup({})`
```lua
{ 'j-hui/fidget.nvim',       opts = {} }
```

## Utility functions


### `vim.tbl_keys`

**Description**: Retrieves the keys of a Lua table.

**Usage**:
```lua
local keys = vim.tbl_keys(table)
```

**Parameters**:
- `table`: The Lua table from which to extract keys.

**Returns**: A list (array) of keys from the provided table.

**Example**:
```lua
local my_table = { a = 1, b = 2, c = 3 }
local keys = vim.tbl_keys(my_table)  -- keys = { 'a', 'b', 'c' }
```

**Use Cases**:
- Iterating over table keys.
- Dynamic configurations.
- Debugging table contents.


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
