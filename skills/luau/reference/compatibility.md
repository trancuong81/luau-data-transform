# Luau vs Lua 5.1 Compatibility

## Based On

Luau is based on Lua 5.1 and incorporates all its features, with selective additions from later versions and some removals for sandboxing.

## Implementation Limits

| Limit | Value |
|---|---|
| Local variables per function | 200 |
| Upvalues per function | 200 (Lua 5.1: 60) |
| Registers per function | 255 |
| Constants per function | 2^23 |
| Instructions per function | 2^23 |
| Stack depth | 20,000 Lua calls/thread |

## Features REMOVED from Lua 5.1

- `io` library (file access)
- `os` library (except `clock`, `date`, `difftime`, `time`)
- `package` library (file access, native modules)
- `debug` library (memory safety issues) — replaced with limited `debug.info`, `debug.traceback`
- `loadfile`, `dofile` (filesystem access)
- `loadstring` with bytecode (security)
- `string.dump` (bytecode access)
- `newproxy` restricted to true/false/nil
- `module` function (global override risk)

## Features ADDED from Lua 5.2+

**Adopted:**
- Yieldable `pcall`/`xpcall`
- UTF-8 support (`\u` escapes, `utf8` library)
- `string.pack` / `string.unpack` / `string.packsize`
- Floor division `//` operator
- `table.move`
- `coroutine.isyieldable`
- Improved `math.random` (PRNG)

**Rejected:**
- 64-bit integers (Luau uses double for all numbers)
- Bitwise operators syntax (`&`, `|`, `~`, `<<`, `>>`) — use `bit32` library
- Ephemeron tables
- `goto` statement
- Table finalizers (`__gc`)
- Generational GC modes
- To-be-closed variables (`<close>`)

## Luau-Specific Additions (not in any Lua)

- Gradual type system with annotations
- `if/then/else` expressions
- String interpolation (backtick strings)
- `continue` statement
- Compound assignments (`+=`, `-=`, etc.)
- Generalized iteration (`for k,v in t`)
- `table.create`, `table.find`, `table.freeze`, `table.clone`, `table.clear`
- `string.split`
- `buffer` library
- `vector` type and library
- `bit32.countlz`, `bit32.countrz`, `bit32.byteswap`
- `math.clamp`, `math.sign`, `math.round`, `math.lerp`, `math.noise`
- Type functions
- `@native` attribute for native code generation

## Key Behavioral Differences from Lua 5.1

- **No tail call optimization** (simplifies implementation)
- **Mixed table literals** follow program order (not Lua 5.x convention)
- **`__eq` metamethod** invoked even for raw-equal objects
- **Function closures** may be reused when upvalues match (changes identity)
- **`os.time`** returns UTC timestamps (not local time)
