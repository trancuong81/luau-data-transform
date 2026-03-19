# Luau Table Types

## Three Table States

### Unsealed Tables
Created from table literals. Support adding new properties (updates the type).

```lua
local t = {}       -- unsealed, type is {}
t.x = 1            -- type becomes { x: number }
t.y = "hello"      -- type becomes { x: number, y: string }
```

Unsealed tables are EXACT — all properties must match the type definition.
Adding explicit type annotation seals the table.

### Sealed Tables
Tables become sealed when:
- Explicitly type-annotated
- Returned from functions

```lua
type Point = { x: number, y: number }
local p: Point = { x = 1, y = 2 }
-- p.z = 3  -- ERROR: cannot add properties to sealed table
```

Sealed tables are INEXACT — may have properties not mentioned in type.
This enables width subtyping: `{ x: number, y: number, z: number }` satisfies `{ x: number, y: number }`.

### Generic Tables
Occur with unannotated parameters. Indexing a parameter creates a table interface requirement.

## Table Indexers

```lua
-- Array shorthand
type StringArray = { string }               -- same as {[number]: string}

-- Explicit indexer
type NumberMap = { [string]: number }

-- Mixed: indexer + named fields
type SpecialArray = { [number]: string, n: number }
```

## Key Patterns for Data Transforms

```lua
-- Record type (named fields)
type Record = {
    id: number,
    name: string,
    tags: { string },
}

-- Dictionary type
type Config = { [string]: string | number | boolean }

-- Nested tables
type Schema = {
    fields: { [string]: FieldDef },
    metadata: { version: number, name: string },
}
```
