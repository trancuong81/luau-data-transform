# Luau Basic Types

## 10 Primitive Types

`nil`, `string`, `number`, `boolean`, `table`, `function`, `thread`, `userdata`, `vector`, `buffer`

Note: `table` and `function` have dedicated syntax in type annotations rather than being used by name.

## Special Types

### `unknown` (top type)
Union of all types. Variables typed `unknown` CANNOT be used without type refinement first.

```lua
local x: unknown = getValue()
-- x + 1  -- ERROR: cannot use unknown as number
if type(x) == "number" then
    print(x + 1)  -- OK after refinement
end
```

### `never` (bottom type)
No value inhabits `never`. Useful when refinements prove a condition is impossible.

### `any`
Like `unknown` but bypasses type checking entirely. Avoid in strict code.

## Function Types

```lua
-- In strict mode, Luau infers generic types:
function f(x) return x end  -- inferred as <A>(A) -> A

-- In nonstrict mode:
function f(x) return x end  -- inferred as (any) -> any

-- Explicit annotation:
function add(a: number, b: number): number
    return a + b
end
```

## Variadic Types

```lua
function sum(...: number): number
    local total = 0
    for _, v in { ... } do
        total += v
    end
    return total
end
```

In type annotations: `...T` means many elements of type T.

## Type Packs

Represent multiple return values or variadic parameters:

```lua
type Tuple<T...> = (T...) -> T...
```

`T...` = generic type pack (zero or more types)
`...T` = variadic (many elements of single type T)

## Singleton (Literal) Types

```lua
type Success = true
type Failure = false
type StatusMessage = "ok" | "error" | "pending"
```

Only `string` and `boolean` literals supported. Numbers are NOT supported as singleton types.
