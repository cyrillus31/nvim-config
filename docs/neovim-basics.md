# Neovim Cheatsheet

Key notation and Neovim-specific commands and concepts.

## Key Notation

### Special Keys
| Key | Notation | Description |
|-----|----------|-------------|
| Escape | `<Esc>` | Exit insert mode |
| Tab | `<Tab>` | Tab key |
| Enter | `<CR>` | Carriage Return (Enter) |
| Space | `<Space>` | Space bar |
| Backspace | `<BS>` | Backspace |
| Home | `<Home>` | Home key |
| End | `<End>` | End key |
| Page Up | `<PageUp>` | Page Up |
| Page Down | `<PageDown>` | Page Down |

### Modifiers
| Modifier | Notation | Description |
|----------|----------|-------------|
| Control | `<C-x>` | Ctrl + x |
| Shift | `<S-x>` | Shift + x |
| Alt | `<A-x>` or `<M-x>` | Alt + x |
| Meta | `<M-x>` | Meta key |

### Function Keys
`<F1>`, `<F2>`, ..., `<F12>`

### Combining Modifiers
```vim
<C-a>     " Control + a
<C-S-x>   " Control + Shift + x
<C-A-f>   " Control + Alt + f
```

### Chords
Chords are pressed sequentially (not held):
```vim
<Space>f   " Press Space then f
<Leader>x  " Press leader key then x
```

## Keymaps in Lua

```lua
-- Normal mode
vim.keymap.set("n", "<leader>x", "<cmd>echo 'hi'<CR>")

-- Insert mode
vim.keymap.set("i", "<C-n>", "<Down>")

-- Visual mode
vim.keymap.set("v", "<leader>y", '"+y')

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Options
vim.keymap.set("n", "x", "y", {
    noremap = true,   -- Don't recursive map
    silent = true,    -- Don't echo command
    buffer = 123,     -- Buffer-local mapping
    desc = "Yank line" -- Description for which-key
})
```

## Useful Vim Commands

### Navigation
```vim
h j k l           " Left, Down, Up, Right
w / b             " Next/Previous word
0 / $             " Beginning/End of line
gg / G            " First/Last line
{ / }             " Paragraph up/down
%                 " Match bracket
/ ?               " Search forward/backward
```

### Editing
```vim
i / a             " Insert before/after cursor
I / A             " Insert at line start/end
o / O             " New line below/above
x                 " Delete character
dd / cc           " Delete/Change line
yy / p            " Yank/Paste
u / <C-r>         " Undo/Redo
.                 " Repeat last command
```

### Visual Mode
```vim
v                 " Character-wise selection
V                 " Line-wise selection
<C-v>            " Block selection
o                 " Go to other end of selection
```

### Searching
```vim
/pattern          " Search forward
?pattern          " Search backward
n / N             " Next/Previous match
* / #             " Search word under cursor (forward/backward)
:grep pattern     " Search with grep
```

### Windows & Splits
```vim
:sp / :vsp        " Split horizontal/vertical
<C-w> + h/j/k/l   " Navigate windows
<C-w> + H/J/K/L   " Move window
:close            " Close window
:only             " Close other windows
```

## Vim Registers

| Register | Description |
|----------|-------------|
| `"` | Unnamed register (last delete/yank) |
| `0` | Last yank |
| `1` to `9` | Last 9 deletes |
| `"+` | System clipboard |
| `*` | Selection clipboard |
| `_` | Black hole (delete without saving) |
| `%` | Current file name |
| `/` | Last search pattern |
| `:` | Last command |

### Using Registers
```vim
"ayy    " Yank line to register a
"ap     " Paste from register a
"+p     " Paste from system clipboard
```

## Vim Macros

```vim
qa      " Start recording macro in register a
q       " Stop recording
@a      " Play macro from register a
@@      " Repeat last macro
```

## Commonly Used Commands

```vim
:w              " Write (save)
:wq / :x / ZZ   " Write and quit
:q! / ZQ        " Quit without saving
:e filename     " Edit file
:bn / :bp       " Next/Previous buffer
:bd             " Buffer delete (close)
:ls             " List buffers
Ctrl-^          " Alternate file
```

## Neovim Lua API Quick Reference

### Options
```lua
vim.opt.number = true              -- Boolean option
vim.opt.wrap = "nowrap"            -- String option
vim.opt.listchars:append("trail=·")-- Table option (method chaining)

vim.o.number = true                -- Alternative syntax
vim.opt.number = true              -- Preferred: respects metadata
```

### Global Variables
```lua
vim.g.plugin_loaded = true
vim.g.mapleader = " "
```

### API Functions
```lua
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        print("Entered buffer:", args.buf)
    end
})

vim.api.nvim_create_user_command("MyCommand", function(opts)
    print("Args:", opts.fargs)
end, { nargs = "*" })
```

### Diagnostics
```lua
vim.diagnostic.open_float()
vim.diagnostic.goto_next()
vim.diagnostic.setqflist()
```

### LSP (Basic)
```lua
vim.lsp.buf.hover()
vim.lsp.buf.definition()
vim.lsp.buf.code_action()
vim.lsp.buf.format()
```

## Useful : Commands

| Command | Description |
|---------|-------------|
| `:h` | Help |
| `:h cmd` | Help for specific command |
| `:map` | Show all mappings |
| `:scriptnames` | Show loaded scripts |
| `:set all` | Show all options |
| `:echo &option` | Show option value |
| `:luafile %` | Execute current file as Lua |
| `:Lazy` | Open Lazy package manager |
| `:Mason` | Open Mason LSP manager |
| `:WhichKey` | Show which-key popup |

## Quick Configuration Tips

```lua
-- Set option conditionally
if vim.g.have_nerd_font then
    -- something
end

-- Check environment
vim.env.XDG_CONFIG_HOME  -- Config directory
vim.fn.executable("git") -- Check if command exists

-- Conditional plugin loading
{
    "author/plugin",
    cond = function()
        return vim.fn.has("linux") == 1
    end
}
```

## Plugin Configuration Pattern

```lua
return {
    "plugin-author/plugin-name",
    event = "VimEnter",
    dependencies = {
        "other-plugin/other",
    },
    config = function()
        require("plugin-name").setup({
            -- options
        })
    end,
}
```

## File Types

```lua
-- Check filetype
vim.bo.filetype
-- or
vim.fn.expand("%:e")

-- Set filetype
vim.bo.filetype = "lua"
```

## Auto-commands

```lua
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.opt_local.shiftwidth = 4
    end
})

-- Multiple patterns
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.lua", "*.luarc" },
    once = true,
    callback = function()
        -- do something
    end
})
```