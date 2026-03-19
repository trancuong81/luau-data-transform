# Luau Type System Overview

## Type Inference Modes

Set at the top of each file:

```lua
--!nocheck    -- Disables type checking entirely
--!nonstrict  -- Default. Unknown types become `any`. Only flags provable errors.
--!strict     -- Full type tracking. Flags potential runtime errors.
```

## Structural Type System

Luau uses structural typing — type compatibility is determined by shape, not name.
A table `{ x: number, y: number, name: string }` is compatible with `{ x: number, y: number }`.

## Type Casts

Use `::` operator:

```lua
local names = {} :: {string}
local val = someExpr :: number
```

Cast validation: operand and target must be in subtype relationship, or one must be `any`.
Multiple returns: casting a variadic function result preserves only the first return value.

## Module Interactions

- `require` paths must be statically resolvable for type checking to work
- Dynamic require paths prevent accurate type inference

## Cyclic Module Dependencies

When modules have circular imports, cast the problematic module reference to `any`:

```lua
local otherModule = require(./other) :: any
```

This breaks the type cycle at the cost of losing type safety for that import.
