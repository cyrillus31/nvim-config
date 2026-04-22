# Lua Basics for Neovim

A quick introduction to Lua for those familiar with programming but new to Lua.

## Basics

### Hello World
```lua
print("Hello, Neovim!")
```

### Variables
```lua
local name = "Neovim"  -- local variable
global = "works too"   -- global (avoid this)
```

### Data Types
```lua
nil           -- nothing/absence of value
boolean       -- true, false
number        -- 42, 3.14
string        -- "hello", 'hello'
table         -- arrays and dictionaries
function      -- functions
userdata      -- C data
thread        -- coroutines
```

### Comments
```lua
-- single line
--[[
    multi-line
    comment
]]
```

## Tables (The Key Data Structure)

Tables in Lua are versatile - they serve as arrays, dictionaries, objects, and more.

### Arrays (Sequential Tables)
```lua
local fruits = { "apple", "banana", "orange" }

-- Access by index (1-based!)
print(fruits[1])  -- "apple"
print(#fruits)    -- 3 (length)

-- Iterate
for i, v in ipairs(fruits) do
    print(i, v)
end
```

### Dictionaries (Key-Value Tables)
```lua
local person = { name = "John", age = 30 }

-- Access by key
print(person.name)     -- "John"
print(person["age"])  -- 30

-- Iterate
for k, v in pairs(person) do
    print(k, v)
end
```

### Mixed Tables
```lua
local mixed = { "a", "b", name = "test", 1, 2 }
```

## Functions

```lua
-- Basic function
local function greet(name)
    return "Hello, " .. name .. "!"
end

-- Multiple return values
local function divide(a, b)
    return math.floor(a / b), a % b  -- quotient, remainder
end

-- Variadic
local function sum(...)
    local total = 0
    for _, v in ipairs({...}) do
        total = total + v
    end
    return total
end

print(sum(1, 2, 3))  -- 6
```

## Control Flow

### If-Then-Else
```lua
if score > 90 then
    print("A")
elseif score > 80 then
    print("B")
else
    print("C")
end
```

### Ternary Alternative
```lua
local result = condition and value_if_true or value_if_false
```

### Loops
```lua
-- While loop
local i = 1
while i <= 5 do
    print(i)
    i = i + 1
end

-- For loop (numeric)
for i = 1, 10, 2 do  -- start, end, step
    print(i)
end

-- For loop (generic with pairs/ipairs)
for k, v in pairs(table) do
    print(k, v)
end
```

## Operators

```lua
-- Arithmetic
+, -, *, /, % (modulo), ^ (power)

-- Comparison
==, ~= (not equal), <, >, <=, >=

-- Logical
and, or, not

-- String
..  -- concatenation
#   -- length
```

## String Manipulation

```lua
local s = "hello world"

-- Concatenation
local combined = "hello" .. " " .. "world"

-- Length
print(#s)  -- 11

-- String methods (Lua 5.3+)
print(s:upper())      -- HELLO WORLD
print(s:sub(1, 5))    -- hello
print(s:find("world"))-- 8 13

-- Formatting
local name = "World"
local formatted = string.format("Hello, %s!", name)
```

## Pattern Matching

```lua
-- Character classes
%a  -- any letter
%d  -- any digit
%s  -- any space
%w  -- any alphanumeric

-- Quantifiers
*    -- 0 or more
+    -- 1 or more
?    -- 0 or 1

-- Examples
local text = "test123"
if text:match("%d+") then
    print("contains numbers")
end

-- gmatch - iterate matches
for word in text:gmatch("%w+") do
    print(word)
end

-- gsub - replace
local replaced = text:gsub("%d+", "NUM")
```

## Modules (Require)

```lua
-- mymodule.lua
local M = {}

function M.greet(name)
    return "Hello, " .. name
end

return M

-- In another file:
local mymodule = require("mymodule")
print(mymodule.greet("World"))
```

## Neovim-Specific Lua

### The `vim` Global
Neovim provides the `vim` global with many utilities:

```lua
vim.fn        -- Call Vim functions
vim.api       -- Neovim API
vim.opt       -- Set options (vim.opt.number = true)
vim.g         -- Global variables
vim.b         -- Buffer variables
vim.w         -- Window variables
vim.t         -- Tab variables
vim.o         -- Option values
vim.bo        -- Buffer options
vim.wo        -- Window options
vim.go        -- Global options
```

### Common Patterns

```lua
-- Set option
vim.opt.number = true
vim.opt.shiftwidth = 4

-- Call Vim function
vim.fn.input("Prompt: ")

-- Create keymap
vim.keymap.set("n", "<leader>x", "<cmd>echo 'hi'<CR>")

-- Check if executable exists
if vim.fn.executable("git") == 1 then
    print("git exists")
end
```

### Keymap Modes
```lua
vim.keymap.set("n", ... )  -- normal mode
vim.keymap.set("i", ... )  -- insert mode
vim.keymap.set("v", ... )  -- visual mode
vim.keymap.set("x", ... )  -- visual only (not command mode)
vim.keymap.set("t", ... )  -- terminal mode
```

## Tables: Common Operations

```lua
-- Insert
local t = {}
table.insert(t, "item")  -- append

-- Remove
table.remove(t, 1)  -- remove by index

-- Length
print(#t)

-- Keys
local keys = vim.tbl_keys(my_table)

-- Filter
local filtered = vim.tbl_filter(function(v) return v > 0 end, t)

-- Map
local doubled = vim.tbl_map(function(v) return v * 2 end, t)
```

## Error Handling

```lua
-- pcall (protected call)
local success, result = pcall(dangerous_function, arg)
if not success then
    print("Error: " .. result)
end

-- Simple assert
assert(condition, "error message")
```

## Metatables (Advanced)

```lua
local Point = {}
Point.__index = Point

function Point.new(x, y)
    local self = setmetatable({}, Point)
    self.x = x
    self.y = y
    return self
end

function Point:__add(other)
    return Point.new(self.x + other.x, self.y + other.y)
end
```

## Quick Reference

| Concept | Syntax |
|---------|--------|
| Array | `{1, 2, 3}` |
| Dict | `{a = 1, b = 2}` |
| Length | `#t` |
| Iterate array | `ipairs(t)` |
| Iterate dict | `pairs(t)` |
| Function | `function() end` |
| Local func | `local function() end` |
| Optional arg | `arg = arg or default` |
| Require | `local m = require("module")` |
| Ternary | `a and b or c` |