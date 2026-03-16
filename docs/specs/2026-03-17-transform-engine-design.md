# Transform Engine Design Spec

**Spec:** transform-engine (epic: luau-data-transform)
**Date:** 2026-03-17
**Status:** Approved
**Dependencies:** project-setup (completed), types-and-schema (completed)

## Goal

Port the core data transformation logic from OCaml to Luau: json_path utilities, transform utilities, the generic mapping engine, the 6 concrete field mappings, the CLI entry point, and the integration test. This is a faithful port — same logic, same test assertions.

## Module Structure

| Module | Responsibility | Dependencies |
|---|---|---|
| `lib/json_path.luau` | Navigate/set nested table paths | None |
| `lib/transform_utils.luau` | identity, groupBy, mergeBy, mapValues, deepMerge | None |
| `lib/mappings.luau` | Generic JSON-to-JSON mapping engine | json_path, transform_utils |
| `lib/example_mappings.luau` | 6 typed field mappings + `transform()` | data_types, source_table, target_table |
| `bin/main.luau` | CLI entry point | fs, serde, source_table, target_table, example_mappings |

## Design Decisions

### 1. Two independent abstraction levels

`mappings.luau` operates on raw Luau tables (JSON-like) via `json_path`. It provides a generic, reusable mapping engine with `textboxMapping`, `checkboxMapping`, `customMapping`.

`example_mappings.luau` operates on typed structs (`SourceTableFieldsMap` → `TargetTableFieldsMap`). It does NOT use `mappings.luau` — it directly accesses typed fields. This matches the OCaml implementation faithfully.

### 2. Pair representation for groupBy/mergeBy/mapValues

OCaml uses `(string * 'a) list` (list of tuples). Luau has no tuples, so we use 2-element arrays: `{ key, value }`. Functions like `groupBy` return `{ { string, {any} } }` — an array of `{key, values}` pairs.

### 3. deepMerge on raw tables

`deepMerge` works on raw Luau tables (dictionaries with string keys). When both sides have a nested table for the same key, it merges recursively. Otherwise, the later value overwrites. This mirrors OCaml's `deep_merge_two` exactly.

### 4. Integration test uses key-sorted JSON comparison

The integration test normalizes both actual and expected JSON by recursively sorting all object keys before comparing. This ensures deterministic comparison regardless of table iteration order.

## Module Specifications

### lib/json_path.luau

All functions operate on raw Luau tables (from `serde.decode("json", ...)`).

```lua
function JsonPath.getPath(t: {[string]: any}, path: {string}): any?
```
Navigates nested tables by key path. Returns `nil` if any key is missing or if a non-table is encountered mid-path. Empty path returns the input table itself.

```lua
function JsonPath.setPath(t: {[string]: any}, path: {string}, value: any): {[string]: any}
```
Sets a value at a nested path, creating intermediate tables as needed. Returns a new table (does not mutate input). For existing keys, the old value is replaced. Implementation: recursive function that rebuilds the path.

```lua
function JsonPath.getString(t: {[string]: any}, path: {string}): string?
```
Gets value at path; returns it only if it's a string, else `nil`.

```lua
function JsonPath.getStringOrEmpty(t: {[string]: any}, path: {string}): string
```
Like `getString` but returns `""` instead of `nil`.

```lua
function JsonPath.getStringList(t: {[string]: any}, path: {string}): {string}
```
Gets value at path; if it's an array, filters for string elements. Returns `{}` if path doesn't exist or isn't an array.

### lib/transform_utils.luau

```lua
function TransformUtils.identity(x: any): any
```
Returns input unchanged.

```lua
function TransformUtils.groupBy(items: {any}, keyFn: (any) -> string, valueFn: (any) -> any): {{any}}
```
Groups items by key. Returns array of `{key, {values}}` pairs in insertion order. Items with the same key have their values appended to the group's values list.

```lua
function TransformUtils.mergeBy(items: {any}, keyFn: (any) -> string, valueFn: (any) -> any): {{any}}
```
Like `groupBy` but keeps only the last value per key. Returns array of `{key, value}` pairs in first-seen order.

```lua
function TransformUtils.mapValues(pairs: {{any}}, fn: (string, any) -> any): {{any}}
```
Maps over `{key, value}` pairs, applying `fn(key, value)` to produce new values. Returns array of `{key, newValue}` pairs.

```lua
function TransformUtils.deepMerge(objects: {{[string]: any}}): {[string]: any}
```
Recursively merges an array of tables. Folds left starting from `{}`. For each key: if both existing and new values are tables, merge recursively; otherwise new value overwrites. If either the accumulator or the incoming object is not a table at the root level, the incoming object replaces the accumulator entirely (mirroring OCaml's `| _, other -> other` fallback branch).

### lib/mappings.luau

```lua
export type InputInfo = {{any}}  -- array of {alias: string, path: {string}} pairs
export type Mapping = {
    name: string,
    inputPaths: InputInfo,
    outputPath: {string},
    transform: (any) -> any,
}
```

Internal helpers:
- `getValue(json, path)` — `getPath` with `nil` fallback (OCaml returns `Null`, Luau returns `nil`)
- `buildOutput(value, path)` — wraps value in nested tables following path keys. Folds right: `{"a", "b"}` + value → `{a = {b = value}}`. Skips empty string keys.
- `gatherInputs(json, inputPaths)` — builds table with aliases as keys, resolved values from source

```lua
function Mappings.textboxMapping(config: {
    name: string,
    inputPaths: InputInfo,
    outputPath: {string},
}): Mapping
```
Transform: extracts `"value"` string from each input (in `inputPaths` array order), concatenates non-empty ones, wraps as `{value = concatenated}` at `outputPath`.

```lua
function Mappings.checkboxMapping(config: {
    name: string,
    inputPaths: InputInfo,
    outputPath: {string},
    optionMap: {{string}},  -- array of {sourceKey, targetKey} pairs
}): Mapping
```
Transform: extracts `"selectedKeys"` arrays from inputs, maps each key through `optionMap`, deduplicates (preserving order), wraps as `{selectedKeys = mapped}` at `outputPath`.

```lua
function Mappings.customMapping(config: {
    name: string,
    inputPaths: InputInfo,
    outputPath: {string},
    transformFn: (any) -> any,
}): Mapping
```
Transform: applies user function, wraps result at `outputPath`.

```lua
function Mappings.applyMapping(mapping: Mapping, source: any): any
function Mappings.transformAll(mappings: {Mapping}, source: any): any
```
`applyMapping` gathers inputs then calls mapping's transform. `transformAll` applies all mappings and deep-merges results.

### lib/example_mappings.luau

```lua
export type NameParts = {
    firstName: string,
    middleName: string,
    lastName: string,
}
```

```lua
function ExampleMappings.splitName(fullname: string): NameParts
```
Trims input, splits on spaces, filters empty parts.
- 0 parts → all empty
- 1 part → firstName=part, middleName="", lastName=part (first and last both equal the single word)
- 2 parts → first, middle="", last
- 3+ parts → first, middle=joined middle parts, last

```lua
function ExampleMappings.transform(src: SourceTableFieldsMap): TargetTableFieldsMap
```
Calls 6 internal (local) mapping functions:

**mapCommitment(src) → MoneyType:**
- Gets `src.lpSignatory.valueSubFields.asaCommitmentAmount.value`
- Strips commas, parses as number (0 if invalid)
- Returns MoneyType with NumberType amount

**mapInvestorName(src) → StringType:**
- Gets AML name and general info name
- Returns first non-empty (prefers AML)

**mapRegulatedStatus(src) → RadioGroupType:**
- Maps checkbox keys: `yes_...` → `"true"`, `no_...` → `"false"`
- Takes first mapped value, or `""` if none

**mapInternationalSupplements(src) → MultipleCheckboxType:**
- Merges individual + entity supplement keys
- Maps through 12-entry optionMap (6 indi + 6 entity → target labels)
- Deduplicates preserving order

**mapSignerName(src) → (StringType, StringType, StringType):**
- Prefers individual over entity authorized name
- Splits via `splitName`
- Returns first, middle, last as three StringType values

**mapW9TinType(src) → RadioGroupType:**
- If w9.valueSubFields.w9Line2 is non-empty → selectedKey = `""`
- Else if w9PartiSsn1 is non-empty → `"SSN"`
- Else → `"EIN"` (default, also when w9 is nil)

### bin/main.luau (update existing)

1. Check `process.args[1]` exists, print usage and exit(1) if not
2. `fs.readFile(process.args[1])` → `serde.decode("json", content)`
3. `SourceTable.decodeJsonSourceTableFieldsMap(json)` → source
4. `ExampleMappings.transform(source)` → target
5. `TargetTable.encodeJsonTargetTableFieldsMap(target)` → result table
6. `serde.encode("json", result)` → print to stdout

## Test Plan

### test/test_json_path.luau (4 tests)

1. **get nested path**: `{a={b={c=42}}}` path `{"a","b","c"}` → `42`
2. **get missing path**: `{a={b=1}}` path `{"a","x"}` → `nil`
3. **get empty path**: `{a=1}` path `{}` → the whole table
4. **set nested path**: `{}` set `{"a","b"}` to `"hello"` → `{a={b="hello"}}`

### test/test_transform_utils.luau (6 tests)

1. **identity**: 42 → 42, "hello" → "hello"
2. **groupBy**: `{{"a",1},{"b",2},{"a",3}}` → a=[1,3], b=[2]
3. **mergeBy**: `{{"a",1},{"b",2},{"c",3}}` → a=1, b=2, c=3 (all pairs retained, all keys distinct)
4. **mapValues**: `{{"x",1},{"y",2}}` with `*10` → x=10, y=20
5. **deepMerge**: merge `{x=1, nested={a=1}}` + `{y=2, nested={b=2}}` → `{x=1, y=2, nested={a=1, b=2}}`
6. **deepMerge overwrite**: `{x=1}` + `{x=2}` → `{x=2}`

### test/test_mappings.luau (2 tests)

1. **textbox mapping**: Input with nested value "1000000" → extracted at output path
2. **checkbox mapping**: Input with selectedKeys, mapped via optionMap → ["true"]

### test/test_example_mappings.luau (15 tests)

Split name (4): full name, two parts, empty, single word.
Commitment (1): "1,000,000" → 1000000.0 as Money.
Investor name (2): prefers AML, falls back to general.
Regulated status (2): yes→"true", no→"false".
International supplements (1): entity key → "No Supplement".
Signer name (2): split "Catherine L Ziobro", prefers individual over entity.
W9 tin type (3): no SSN→"EIN", SSN present→"SSN", line2 present→"".

Uses a `makeSource` helper factory with default values matching the OCaml test helper.

### test/test_integration.luau (1 test)

Loads `test/fixtures/values.json`, decodes → SourceTableFieldsMap, transforms, encodes → JSON, compares against `test/fixtures/transformed_values.json` (with key-sorted normalization). If `test/fixtures/values.json` does not exist, skip the test rather than failing.

## Interface Contract

This spec exports:
- `lib/json_path.luau`: `getPath`, `setPath`, `getString`, `getStringOrEmpty`, `getStringList`
- `lib/transform_utils.luau`: `identity`, `groupBy`, `mergeBy`, `mapValues`, `deepMerge`
- `lib/mappings.luau`: `Mapping` type, `textboxMapping`, `checkboxMapping`, `customMapping`, `applyMapping`, `transformAll`
- `lib/example_mappings.luau`: `NameParts` type, `splitName`, `transform`
- `bin/main.luau`: CLI entry point `lune run bin/main <values.json>`

## Luau-Specific Considerations

- `string.split(s, sep)` for splitting strings on separator
- `string.gsub(s, pattern, replacement)` for stripping commas: `string.gsub(raw, ",", "")`
- `tonumber(s)` for string→number conversion (returns nil on failure)
- Tables from `serde.decode` use 1-based arrays for JSON arrays
- `type(v) == "string"` for type checking in getPath/getString
- `type(v) == "table"` to check for nested objects/arrays
- Iteration: `for k, v in t do` for dictionary tables, `for _, v in t do` for arrays
- No tuple type: use 2-element arrays `{key, value}` for pair lists
