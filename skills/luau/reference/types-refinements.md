# Luau Type Refinements (Narrowing)

## Three Refinement Methods

### 1. Truthy Test
```lua
local x: string? = maybeGetString()
if x then
    -- x narrowed to string (nil is falsy)
    print(string.upper(x))
end
```

### 2. Type Guard
```lua
local value: string | number = getData()
if type(value) == "number" then
    print(value + 1)        -- value narrowed to number
elseif type(value) == "string" then
    print(#value)            -- value narrowed to string
end
```

Also works with `typeof()` for userdata types.

### 3. Equality Check
```lua
local status: "ok" | "err" | "pending" = getStatus()
if status == "ok" then
    -- status narrowed to singleton "ok"
end
```

## Composability with Logical Operators

```lua
-- AND: both conditions narrow
if type(x) == "string" and #x > 0 then ... end

-- OR: either condition narrows
if type(x) == "string" or type(x) == "number" then ... end

-- NOT: flips refinement
if not x then
    -- x is nil or false
end

-- ~= flips equality refinement
if x ~= nil then
    -- x narrowed to non-nil
end
```

## Assert-Based Refinement

```lua
assert(type(x) == "number")
-- x is now narrowed to number for the rest of the scope
print(x + 1)  -- OK
```

All three refinement approaches (truthy, type guard, equality) work with `assert()`.

## Tagged Union Refinement

```lua
type Shape =
    { tag: "circle", radius: number }
    | { tag: "rect", width: number, height: number }

local function area(s: Shape): number
    if s.tag == "circle" then
        return math.pi * s.radius ^ 2    -- narrowed to circle
    else
        return s.width * s.height         -- narrowed to rect
    end
end
```
