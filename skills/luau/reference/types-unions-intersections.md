# Luau Union and Intersection Types

## Union Types (`|`)

A value that is ONE OF the types:

```lua
type StringOrNumber = string | number

local function display(value: string | number)
    -- Cannot call number-specific or string-specific methods directly
    -- Must refine first:
    if type(value) == "string" then
        print(string.upper(value))  -- OK: narrowed to string
    else
        print(value + 1)            -- OK: narrowed to number
    end
end
```

**Limitation:** Cannot call a union of two or more function types (ambiguous signature).

### Tagged Unions (Discriminated Unions)

Multiple table types sharing a tag field for discrimination:

```lua
type Result<T, E> =
    { type: "ok", value: T }
    | { type: "err", error: E }

local function process(result: Result<number, string>)
    if result.type == "ok" then
        print(result.value + 1)     -- narrowed to { type: "ok", value: number }
    else
        print(result.error)         -- narrowed to { type: "err", error: string }
    end
end
```

### Optional Shorthand

```lua
type MaybeString = string?   -- equivalent to: string | nil
```

## Intersection Types (`&`)

A value that is ALL OF the types simultaneously:

```lua
-- Joining tables
type Named = { name: string }
type Aged = { age: number }
type Person = Named & Aged    -- { name: string, age: number }

-- Overloaded function signatures (builtin only)
type Overloaded = ((number) -> string) & ((boolean) -> string)
```

**Limitations:**
- Cannot intersect incompatible primitives (`string & number` is `never`)
- User-defined function overloading is NOT supported
- Overloaded signatures exist only for some builtins and Roblox APIs
