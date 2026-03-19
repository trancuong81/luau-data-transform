# Luau Generics

## Generic Functions

```lua
function reverse<T>(array: {T}): {T}
    local result: {T} = {}
    for i = #array, 1, -1 do
        table.insert(result, array[i])
    end
    return result
end

-- Type arguments inferred automatically:
local nums = reverse({1, 2, 3})        -- T inferred as number
local strs = reverse({"a", "b", "c"})  -- T inferred as string
```

## Generic Type Aliases

```lua
type Pair<A, B> = { first: A, second: B }
type Optional<T> = T | nil
type Array<T> = { T }
type Map<K, V> = { [K]: V }

-- Usage:
local p: Pair<string, number> = { first = "age", second = 30 }
```

## Built-in Generic Signatures

Many standard library functions are generic:

```lua
-- table.insert:  <T>({T}, T) -> ()
-- table.find:    <T>({T}, T) -> number?
-- table.clone:   <T>(T) -> T
```

## Limitations

- **No default type parameters**: `type Foo<T = string>` is INVALID
- Type arguments are always inferred or explicitly provided
