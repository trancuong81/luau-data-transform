# Luau Syntax Reference

## String Literals

Three string delimiter forms: `"double"`, `'single'`, `[[long brackets]]` (with `=` for nesting: `[==[...]==]`).

Escape sequences (beyond standard Lua):
- `\xAB` — hex character code 0xAB
- `\u{ABC}` — UTF-8 sequence for U+0ABC (braces mandatory)
- `\z` — skip following whitespace and newlines

## String Interpolation (Backtick Strings)

```lua
local name = "World"
print(`Hello {name}!`)         -- Hello World!
print(`1 + 2 = {1 + 2}`)      -- 1 + 2 = 3
print(`\{escaped\}`)           -- {escaped}
```

Rules:
- Use backticks `` ` `` (NOT `${}` like JS/TS, NOT `s""` like Scala)
- Expressions inside `{expr}` — calls `tostring()` on result
- Escape backtick, `{`, `\`, and newlines with `\`
- Double braces `{{` are a PARSE ERROR (not an escape)
- Cannot use in type annotations
- Cannot call functions with backtick syntax: `print(`text`)` requires parens

## Number Literals

```lua
local dec = 1_048_576           -- decimal with underscores
local hex = 0xFFFF_FFFF         -- hexadecimal
local bin = 0b0101_0101         -- binary
```

Single 64-bit IEEE754 double type. Integers above 2^53 lose precision.

## Continue Statement

```lua
for i = 1, 10 do
    if i % 2 == 0 then
        continue  -- skip even numbers
    end
    print(i)
end
```

Works like `break` but continues to next iteration. Not a reserved keyword (backward compat).
Cannot skip over local variable declarations used later in the loop.

## Compound Assignments

```lua
x += 1
x -= 1
x *= 2
x /= 2
x //= 2   -- floor division
x %= 2
x ^= 2
x ..= "suffix"
```

- Single value on each side only
- Function calls in LHS evaluated once
- Invokes metamethods automatically

## If-Then-Else Expressions

```lua
local max = if a > b then a else b
local sign = if x > 0 then "positive" elseif x < 0 then "negative" else "zero"
```

Rules:
- MUST include `else` clause (unlike statement form)
- No `end` keyword (unlike statement form)
- Use instead of `a and b or c` idiom (which fails when b is falsy)

## Floor Division

```lua
local result = 7 // 2          -- 3 (equals math.floor(7/2))
x //= 2                        -- compound assignment
```

Metamethod: `__idiv`. For vectors: applies `math.floor` per component.

## Generalized Iteration

```lua
-- Standard table iteration (no pairs/ipairs needed)
for k, v in { a = 1, b = 2 } do
    print(k, v)
end

-- Custom iteration via __iter metamethod
local mt = {
    __iter = function(t)
        return next, t
    end
}
```

Default order: consecutive 1..#t, then unordered remaining elements.

## Type Annotation Syntax

```lua
-- Variables
local x: number = 5
local name: string = "hello"

-- Functions
function greet(name: string): string
    return `Hello {name}`
end

-- Optional
local x: number? = nil           -- number | nil

-- Type cast
local value = expr :: number

-- Type alias
type UserId = number
export type PublicType = string   -- accessible via require

-- Function types
type Callback = (number, string) -> boolean
type MultiReturn = () -> (number, string)

-- Table types
type Person = { name: string, age: number }
type StringArray = { string }    -- shorthand for {[number]: string}
type Dict = { [string]: number }

-- Union and intersection
type StringOrNumber = string | number
type Overload = ((number) -> string) & ((boolean) -> string)

-- Generics
function reverse<T>(array: {T}): {T}
    -- ...
end
```

Builtin types: `any`, `nil`, `boolean`, `number`, `string`, `thread`, `unknown`, `never`
