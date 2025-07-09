# NVIM + Lua cheatsheet

Check NeoVim's lua version with 
```vim
:lua print(_VERSION)
```

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


# General lua cheatsheet
#### General
```lua
-- length 

local myArray = { 1, 2, 3 }
if #myArray == 3 then print("ture") -- true
```
#### Tables
```lua
-- TABLE:
-- Concatenate table of strings into a sentence
local sentence = table.concat({ "Hello,", "world!" }, " " ) -- "Hello, world"


-- Append to table
local result = {}
table.insert(result, "something") -- works like append: result = { "something" }


-- Check if key exists (table returns nil otherwise)
local myTable = { key1 = "value1", key2 = "value2" }

local keyToCheck = "key1"
if myTable[keyToCheck] ~= nil then
    print(keyToCheck .. " exists in the table.")
else
    print(keyToCheck .. " does not exist in the table.")
end



-- Slice tables
array = {"a", "b", "c", "d", "e", "f"}
-- unpack the array with start/end indexes
slicedArray = {table.unpack(array, 2, 4)}

-- Join two tables
table.move(a1, f, e, t, a2)

-- function expects five arguments where a1 is the source table and a2 is the destination table.
-- f means from (First index within a1).
-- e means end (Last index within a1).
-- t means to (First index within a2).

-- Example:
local Table1 = {"1", "2", "3", "4", "5"}
local Table2 = {"1", "2"}

table.move(Table1, 1, #Table1, 3, Table2)

-- WARN: lua@5.1 uses unpack() instead of table.unpack()
-- check version with ':lua print(_VERSION)'
print(table.unpack(Table2))  -- Output: 1    2    1    2    3    4    5

```

##### Iterating over tables
```lua
-- Sample tables
local array = {10, 20, 30}         -- Sequential keys
local dict = {a=1, b=2, c=3}       -- Key-value pairs
local mixed = {10, a=1, 20, b=2}   -- Mixed table

-- 1. ipairs() - sequential array iteration
for i, v in ipairs(array) do
    -- i = index, v = value (stops at first nil)
end

-- 2. pairs() - all key-value pairs
for k, v in pairs(dict) do
    -- k = key, v = value (order not guaranteed)
end

-- 3. Numeric for - manual array iteration
for i = 1, #array do
    -- i = index, array[i] = value
end

-- 4. next() - low-level iteration
local k = nil  -- Start iteration
repeat
    k, v = next(dict, k)
    if k then -- k = key, v = value
    end
until k == nil


-- 5. Custom iterator (reverse array example)
local function reverse_iter(t, i)
    i = i - 1
    if i > 0 then return i, t[i] end
end

function reverse(t)
    return reverse_iter, t, #t + 1
end

for i, v in reverse(array) do
    -- i = decreasing index, v = value
end

---------------ITERATORS----------------
-- 6. Custom key-value iterator with filter
local function filtered_pairs(t, filter)
    local function iter(state)
        local k, v
        repeat
            k, v = next(state.t, state.k)
            state.k = k
        until k == nil or filter(k, v)
        return k, v
    end
    return iter, {t=t, k=nil}, nil
end

for k, v in filtered_pairs(dict, function(k,v) return v > 1 end) do
    -- Only pairs where value > 1
end
```

#### Strings
```lua

-- STRING:
-- Get a substring by index
local substring = string.sub("Hello, world", 8, 12) // -- string, start, end "world"

-- Iterate over each symbol in a string
for char in string.gmatch(str, ".") do
  print(char)
end
```

##### Changing Cases
```lua
-- Convert to uppercase
local str1 = "hello world"
local upperStr = string.upper(str1)
print("Uppercase: " .. upperStr)  -- Output: HELLO WORLD

-- Convert to lowercase
local str2 = "HELLO WORLD"
local lowerStr = string.lower(str2)
print("Lowercase: " .. lowerStr)  -- Output: hello world

-- Capitalize a word
function toTitleCase(str)
    return str:gsub("(%a)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

local str3 = "hello world"
local titleStr = toTitleCase(str3)
print("Title Case: " .. titleStr)  -- Output: Hello World

```

##### Bytes
```lua
-- Get byte representation of a letter
local a_bytes = string.byte("a") -- Output: a_bytes = 97
local b = "b"
local b_bytes = b:byte() -- Output: b_bytes = 98
```
#### Atoi && Itoa

```lua
-- ASCII to integer
local str = "123" 
local num = tonumber(str)



-- Integer to ASCII
local num = 123
local str = tostring(num)
```

#### Math

```lua
-- Get a valid square root which is integer
function is_valid_sqrt(num)
  local root = math.sqrt(num)
  return root == math.floor(root)
end

-- Powers
local squared = math.pow(11, 2)  // 121

-- Floor division
local floor_division_result = math.floor(a / b)
```

#### OS
```lua
-- Exit program
os.exit()
```


___
# Lua Pattern Matching Syntax
#patternmatching
___
## Character Classes
- `%a`: Any letter (a-z, A-Z)
- `%c`: Any control character
- `%d`: Any digit (0-9)
- `%l`: Any lowercase letter (a-z)
- `%u`: Any uppercase letter (A-Z)
- `%s`: Any space character (space, tab, newline)
- `%p`: Any punctuation character
- `%w`: Any alphanumeric character (letters and digits)

## Special Characters
- `.`: Matches any character except a newline.
- `*`: Matches 0 or more occurrences of the preceding element.
- `+`: Matches 1 or more occurrences of the preceding element.
- `?`: Matches 0 or 1 occurrence of the preceding element.
- `^`: Matches the start of a string.
- `$`: Matches the end of a string.
- `[]`: Matches any character inside the brackets.
- `()`: Groups patterns.

## Escaping Special Characters
- To match a special character literally, escape it with a `%`. For example, to match a dot, use `%.`.

## Common Functions

>[!Question] What does 'g' stand for in 'gmatch' and 'gsub'?
In Lua, the g in gmatch and gsub stands for "global." It indicates that these functions operate on all occurrences of a pattern within a string, rather than just the first occurrence.

- **`string.match`**: Finds the first match of a pattern in a string.
  
```lua
  local match = string.match("Hello, world!", "Hello")
```


- `string.gmatch`: Iterates over all matches of a pattern in a string.

```lua
for word in string.gmatch("one, two, three", "%a+") do
    print(word)
end
```


- `string.gsub`: Replaces occurrences of a pattern in a string.

```lua
local newStr = string.gsub("Hello, world!", "world", "Lua")
```


- `string.find`: Searches for a pattern in a string and returns the start and end indices. 

```lua
local startIdx, endIdx = string.find("Hello, world!", "world")
```


# Lua Booleans Cheatsheet
#boolean
___
## Truthy and Falsy Values

- **True**: The boolean value `true` is always considered true.
- **False**: The boolean value `false` is always considered false.

## Falsy Values
In Lua, the following values are considered false:
- `false`
- `nil`
hieve floor division by using the math.floor function in combination with the standard division operator (/).

Here's how you can perform floor division in Lua:


## Truthy Values
All other values are considered true, including:
- Any non-zero number (e.g., `1`, `-1`, `3.14`)
- Any non-empty string (e.g., `"hello"`, `" "`)
- Tables
- Functions
- Userdata

## Specific Cases
- **`nil`**: Evaluates to false.
- **`0`**: Evaluates to true (non-zero number).
- **Empty String (`""`)**: Evaluates to true.

## Example
```lua
if nil then
    print("This won't print")
end

if false then
    print("This won't print either")
end

if 0 then
    print("This will print")  -- Output: This will print
end

if "" then
    print("This will also print")  -- Output: This will also print
end

```


# Lua Ternary Operator Cheatsheet

## Ternary Operator Syntax
Lua does not have a built-in ternary operator like some other languages (e.g., Python). Instead, it uses a combination of the `and` and `or` operators to achieve similar functionality.

### Syntax
```lua
condition and value_if_true or value_if_false
```

>[!Note] How It Works
**and**: Returns the first operand if it is *false*; otherwise, it returns the second operand.
**or**: Returns the first operand if it is *true*; otherwise, it returns the second operand.


## Floor division

```lua
local number = 7
local result = (number - number % 3) / 3  -- This will give you 2
```




