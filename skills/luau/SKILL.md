---
name: luau
description: >
  Luau language reference for writing correct, idiomatic code.
  Triggers on: .luau files, luau mentions, Lua-derived scripting, or data transformation in Luau.
  Covers syntax, types, standard library, performance, and common pitfalls.
  Always use this skill before writing ANY Luau code, even simple functions — Luau's operators
  (~=, .., and/or/not) and 1-based indexing differ from mainstream languages in ways that cause
  silent bugs without this reference. Also trigger when the user asks about Luau vs Lua differences,
  table manipulation, type annotations, string interpolation, or metatables.
  For detailed reference, look up files in reference/.
---

# Luau Language Skill

Luau is a fast, safe, gradually typed scripting language derived from Lua 5.1.
Single number type (double), 1-based indexing, tables as the universal data structure.

## CRITICAL PITFALLS — Read Before Writing Any Luau

These are mistakes Claude commonly makes when generating Luau from JVM/mainstream language habits.

### Operators & Syntax

| WRONG (Common Habit) | CORRECT (Luau) | Notes |
|---|---|---|
| `!=` | `~=` | Not-equal operator |
| `&&` / `\|\|` / `!` | `and` / `or` / `not` | Logical operators are WORDS |
| `+` for strings | `..` | String concatenation |
| `x++` / `x--` | `x += 1` / `x -= 1` | No increment/decrement |
| `x.length` / `x.size()` | `#x` | Length operator for tables and strings |
| `null` / `undefined` | `nil` | Only nil, no undefined |
| `a ? b : c` | `if a then b else c` | Expression form (not statement), no `end` |
| `switch/match` | `if/elseif/else/end` | No pattern matching construct |
| `${expr}` / `s"$expr"` | `` `{expr}` `` | Backtick interpolation with bare `{}` |
| `arr[0]` | `arr[1]` | **1-BASED INDEXING** |
| `// comment` | `-- comment` | Single-line comments |
| `/* block */` | `--[[ block ]]` | Block comments |
| `x?.field` / `x?.method()` | `if x then x.field else nil` | No optional chaining |
| `import` / `require("x")` | `local M = require(path)` | Require returns module table |
| `\d+`, `\w+` (regex) | `%d+`, `%w+` | Lua patterns are NOT regex |
| `for i = 0, n-1` | `for i = 1, n` | Inclusive both ends, 1-based |
| `debug.getinfo()`/`sethook()` | `debug.info()`/`debug.traceback()` | Full debug library removed |
| *(no type directive)* | `--!strict` at file top | Catches type errors at analysis time |
| `a & b` / `a \| b` / `~a` | `bit32.band(a,b)` / `bit32.bor(a,b)` / `bit32.bnot(a)` | No bitwise operator syntax |
| `string.sub(s, i, i+len)` | `string.sub(s, i, i+len-1)` | End index is inclusive |

### Operator Precedence

```lua
-- not binds TIGHTER than and/or:
not a == b       -- means (not a) == b, NOT not (a == b)
-- Fix: use parentheses
not (a == b)

-- .. (concat) is RIGHT-associative:
"a" .. "b" .. "c"  -- means "a" .. ("b" .. "c")

-- ^ (power) is right-associative and binds tighter than unary minus:
-x^2             -- means -(x^2), NOT (-x)^2
```

### Truthiness

```lua
-- EVERYTHING except false and nil is truthy — INCLUDING 0 and ""
if 0 then print("truthy!") end       -- PRINTS (unlike most languages)
if "" then print("truthy!") end       -- PRINTS (unlike JS/Python)
```

### Table Gotchas

```lua
-- Tables are BOTH arrays and maps — no separate types
local arr = {1, 2, 3}                -- array part: indexed 1..3
local map = {a = 1, b = 2}           -- hash part
local mixed = {1, 2, a = "x"}        -- both

-- #t only counts contiguous array part from index 1
local t = {[1] = "a", [3] = "c"}     -- #t may be 1 (hole at 2!)

-- Equality is REFERENCE-BASED (no structural equals)
{1, 2} == {1, 2}                     -- false

-- table.clone is SHALLOW
local copy = table.clone(original)    -- nested tables still shared
```

### Function Gotchas

```lua
-- No tail call optimization in Luau
-- Method syntax: colon defines implicit self
function Obj:method() end             -- equivalent to Obj.method(self)
obj:method()                          -- passes obj as self

-- Multiple returns
function pair() return 1, 2 end
local a, b = pair()                   -- a=1, b=2
local t = {pair()}                    -- t = {1, 2}

-- ONLY last expression in list expands multi-return
local x, y = pair(), "extra"          -- x=1, y="extra" (second return dropped!)
```

### Type Annotation Gotchas

```lua
-- Type cast uses :: (not `as` or angle brackets)
local x = value :: number

-- Optional uses ? suffix (not Optional<T>)
local name: string? = nil             -- string | nil

-- Function type arrow
type Fn = (number, string) -> boolean -- NOT (number, string) => boolean

-- Table types use : not = for fields
type T = { name: string, age: number }-- NOT { name = string }

-- Array shorthand
type Arr = { string }                 -- {[number]: string}

-- Export types
export type MyType = { ... }          -- accessible from require()
```

## Core Syntax Quick Reference

### Variables & Scope

```lua
local x = 10                          -- local (ALWAYS use local)
local x: number = 10                  -- with type annotation
local a, b, c = 1, "two", true       -- multiple assignment
-- Globals: just assign without local (AVOID in strict mode)
```

### Control Flow

```lua
-- If statement
if cond then
    -- ...
elseif other then
    -- ...
else
    -- ...
end

-- If EXPRESSION (no end!)
local val = if x > 0 then "pos" elseif x < 0 then "neg" else "zero"

-- While
while cond do
    -- ...
end

-- Repeat-until (like do-while, condition has access to loop locals)
repeat
    local line = getLine()
until line == ""

-- Numeric for (inclusive both ends!)
for i = 1, 10 do end                  -- 1,2,3,...,10
for i = 10, 1, -1 do end             -- 10,9,...,1

-- Generic for
for k, v in pairs(t) do end          -- all pairs
for i, v in ipairs(t) do end         -- array 1..N
for k, v in t do end                 -- generalized (preferred)

-- continue (works in all loops)
for i = 1, 10 do
    if i % 2 == 0 then continue end
    print(i)
end
```

### Functions

```lua
-- Named function
local function add(a: number, b: number): number
    return a + b
end

-- Anonymous / lambda
local fn = function(x: number): number return x * 2 end

-- Variadic
local function sum(...: number): number
    local total = 0
    for _, v in { ... } do total += v end
    return total
end

-- Generic
function map<T, U>(arr: {T}, f: (T) -> U): {U}
    local result: {U} = {}
    for i, v in arr do
        result[i] = f(v)
    end
    return result
end
```

### Strings

```lua
local s1 = "double quotes"
local s2 = 'single quotes'
local s3 = [[long
multiline string]]
local s4 = `interpolation: {1 + 2} = 3`  -- backticks!

-- Common operations
string.len(s)                         -- or #s
string.sub(s, 1, 5)                   -- substring (1-based, inclusive)
string.find(s, "pattern")             -- returns start, end positions
string.match(s, "(%d+)")             -- capture groups
string.gsub(s, "old", "new")         -- replace
string.split(s, ",")                  -- Luau extension: returns {string}
string.format("%s is %d", name, age)  -- printf-style
```

### Tables

```lua
-- Create
local arr = {1, 2, 3}
local map = {name = "Alice", age = 30}
local empty: {number} = {}
local preallocated = table.create(100) -- known-size optimization

-- Access
arr[1]                                -- first element (1-based!)
map.name                              -- dot syntax
map["name"]                           -- bracket syntax

-- Modify
table.insert(arr, value)              -- append
table.insert(arr, 1, value)           -- prepend
table.remove(arr, 1)                  -- remove first
arr[#arr + 1] = value                 -- manual append

-- Utilities
table.sort(arr, function(a, b) return a < b end)
table.find(arr, value)                -- returns index or nil
table.freeze(t)                       -- make immutable (shallow)
table.clone(t)                        -- shallow copy
table.concat(arr, ", ")               -- join to string
table.move(src, 1, #src, #dst+1, dst) -- append src to dst
```

## Type System Essentials

```lua
--!strict                              -- enable at file top

-- Union types
type StringOrNum = string | number

-- Tagged union (discriminated)
type Response<T, E> =
    { type: "ok", value: T }
    | { type: "err", error: E }

-- Type narrowing via refinement
local function handle(r: Response<number, string>): number
    if r.type == "ok" then
        return r.value                 -- narrowed to { type: "ok", value: number }
    else
        error(r.error)                 -- narrowed to { type: "err", error: string }
    end
end

-- Type guard
if type(x) == "string" then ... end   -- x narrowed to string
if x ~= nil then ... end              -- x narrowed to non-nil

-- typeof for richer types
typeof(setmetatable({}, {}))           -- captures metatable type
```

## Data Transform Patterns

### Result Type for Validation

```lua
type Result<T> = { ok: true, value: T } | { ok: false, error: string }

local function ok<T>(value: T): Result<T>
    return { ok = true, value = value }
end

local function err<T>(message: string): Result<T>
    return { ok = false, error = message }
end
```

### Error Accumulation

```lua
type ValidationErrors = { string }

local function validateRecord(record: { [string]: any }): (boolean, ValidationErrors)
    local errors: ValidationErrors = {}

    if type(record.name) ~= "string" or #record.name == 0 then
        table.insert(errors, "name: required non-empty string")
    end
    if type(record.age) ~= "number" then
        table.insert(errors, "age: required number")
    end

    return #errors == 0, errors
end
```

### Pipeline Safety with pcall

```lua
local function transformPipeline(input: InputRecord): Result<OutputRecord>
    local success, result = pcall(function()
        -- ... complex transform logic ...
        return transformed
    end)

    if success then
        return ok(result)
    else
        return err(`Transform failed: {result}`)
    end
end
```

### Field Mapping

```lua
type FieldMapper = (source: SourceRecord) -> Result<any>

local function mapFields(
    source: SourceRecord,
    mappings: { [string]: FieldMapper }
): (TargetRecord?, ValidationErrors)
    local target = {}
    local errors: ValidationErrors = {}

    for fieldName, mapper in mappings do
        local result = mapper(source)
        if result.ok then
            target[fieldName] = result.value
        else
            table.insert(errors, `{fieldName}: {result.error}`)
        end
    end

    if #errors > 0 then
        return nil, errors
    end
    return target :: TargetRecord, errors
end
```

## Reference Lookup

For detailed docs beyond this quick reference, read files in `reference/`:

| When you need... | Read |
|---|---|
| String/number literals, interpolation, compound ops | `reference/syntax.md` |
| Type modes, casts, structural typing | `reference/types-overview.md` |
| Primitives, unknown/never/any, singletons | `reference/types-basic.md` |
| Sealed/unsealed tables, indexers | `reference/types-tables.md` |
| Union, intersection, tagged unions | `reference/types-unions-intersections.md` |
| Generics, type parameters | `reference/types-generics.md` |
| Type narrowing, guards, assert | `reference/types-refinements.md` |
| OOP with metatables, self typing, metamethods | `reference/types-oop.md` |
| Type functions, types library | `reference/types-functions.md` |
| Standard library (math/table/string/etc) | `reference/library.md` |
| Performance optimization | `reference/performance.md` |
| Luau vs Lua 5.1 differences | `reference/compatibility.md` |
| Lint warnings | `reference/lint.md` |
| Sandbox/security model | `reference/sandbox.md` |
| Formal grammar (EBNF) | `reference/grammar.md` |
| Topic index | `reference/_index.md` |

**When to look up:** If you need function signatures, full API details, performance tips,
OOP patterns, or compatibility specifics — read the reference file rather than guessing.

## Pre-Generation Checklist

Before returning Luau code, verify: (1) `~=` not `!=`, (2) `and`/`or`/`not` not `&&`/`||`/`!`, (3) `..` not `+` for concat, (4) 1-based indexing throughout, (5) `0` and `""` are truthy. These five account for the majority of Luau generation errors.
