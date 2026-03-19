# Luau Performance Guide

## Interpreter Architecture

- Portable C-based interpreter, performance comparable to LuaJIT's assembly
- Bytecode core loop ~16 KB (fits in instruction cache)
- Compiler: AST → bytecode, ~950K lines/sec throughput

## Table Access Optimization

**Do:**
```lua
t.field              -- constant field name, uses inline caching
```

**Avoid:**
```lua
t["field"]           -- string indexing, slower
t[variable]          -- dynamic, no inline cache
```

Store data fields directly in tables; put methods in metatables.

## Global Import Resolution

```lua
local max = math.max -- resolved at load time ("imports" optimization)
```

**Breaks when:** `loadstring`, `getfenv`, `setfenv` used (marks environment "impure").

**Best practice:** Assign frequently-used globals to locals at module top.

## Method Call Optimization

```lua
-- Optimized: self lookup via __index metatable
function Class:method() end
obj:method()
```

Best when `__index` points directly to a table (not a function).

## Fastcall Builtins

Direct calls bypass normal stack frames. Supported: `assert`, `type`, `typeof`, `rawget/set/equal`, `getmetatable/setmetatable`, `tonumber/tostring`, all `math.*` (except noise/random/randomseed), `bit32.*`, select `string.*`/`table.*`.

## Table Creation

**Object-like (use literals):**
```lua
local obj = { x = 1, y = 2 }  -- triggers "table templates" optimization
```

**Array-like (use table.create):**
```lua
local t = table.create(100)
for i = 1, 100 do
    t[i] = i * i              -- direct indexing, preallocated
end
```

**Appending:** `table.insert(t, value)` is fastest.

## Table Length (#)

- O(log N) worst case, typically O(1) after insert/remove
- `#t` guaranteed to reference array part

## Iteration

Specialized bytecode for:
- `for k, v in pairs(t) do` — all pairs
- `for i, v in ipairs(t) do` — numeric 1..N
- `for k, v in next, t do` — equivalent to pairs
- `for k, v in t do` — generalized (recommended unless need Lua 5.x compat)

## Upvalue Optimization

Non-reassigned upvalues captured by value (no allocation):
```lua
local config = { threshold = 10 }  -- immutable upvalue (the variable, not the table)
local function check(v)
    return v > config.threshold     -- fast access
end
```

## Closure Caching

Identical closures with no/immutable upvalues are reused (same object). Saves allocation.

## Compiler Optimization Level 2 (-O2)

- Function inlining (local functions, non-recursive)
- Loop unrolling (compile-time bounded: `for i=1,4 do`)
- Constant folding of builtin calls
- Argument/return count inference

## Memory & GC

- Avoid temporary table/userdata creation in tight loops (increases GC assist overhead)
- `table.create` with known size reduces reallocations
- `table.freeze` prevents accidental modification (and may enable future optimizations)

## GC Tuning

Incremental GC with PID controller for heap sizing. Key behaviors:
- Proportional pacing targets heap-size percentage
- Atomic phase minimized via incremental remark
- Paged sweeper: 16 KB pages, 2-3x faster than linked-list sweep
