# Luau Type Functions

Type functions run at analysis time and operate on types (not runtime values).

## Defining Type Functions

```lua
type function keyof(t)
    if not t:is("table") then
        error("Expected table type")
    end

    local keys = {}
    for name, _ in t:properties() do
        table.insert(keys, types.singleton(name))
    end

    return types.unionof(table.unpack(keys))
end

-- Usage:
type Person = { name: string, age: number }
type PersonKeys = keyof<Person>   -- "name" | "age"
```

## Available Environment

Type functions have access to:
- Core functions: `assert`, `error`, `print`, `next`, `ipairs`, `pairs`, `select`, `unpack`, `getmetatable`, `setmetatable`, `rawget`, `rawset`, `rawlen`, `tonumber`, `tostring`, `type`, `typeof`
- Libraries: `math`, `table`, `string`, `bit32`, `utf8`, `buffer`
- The `types` library (see below)

## types Library Quick Reference

**Builtin type constants:**
`types.any`, `types.unknown`, `types.never`, `types.boolean`, `types.number`, `types.string`, `types.buffer`, `types.thread`

**Creating types:**
- `types.singleton(arg)` — literal type from string, boolean, or nil
- `types.generic(name?, ispack?)` — generic type parameter
- `types.copy(arg)` — deep copy

**Composing types:**
- `types.unionof(...)` — union
- `types.intersectionof(...)` — intersection
- `types.optional(arg)` — T | nil
- `types.negationof(arg)` — negation

**Complex types:**
- `types.newtable(props?, indexer?, metatable?)` — table type
- `types.newfunction(parameters?, returns?, generics?)` — function type

**Instance methods (all types):**
- `.tag` — type category string
- `:is(tagname)` — check category
- `==` — syntactic equality
