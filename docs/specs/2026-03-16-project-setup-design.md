# Spec: project-setup

**Epic:** luau-data-transform
**Date:** 2026-03-16
**Status:** Approved

## Goal

Initialize the Luau project with Lune runtime, directory structure, tooling configuration, and proto schema files copied from the OCaml reference repo. Establish build/run/test conventions that all subsequent specs depend on.

## Decisions

- **Runtime:** Lune (stable `fs` + `serde` APIs, good docs)
- **Module resolution:** Path aliases via `.luaurc` (`@lib`, `@test`, `@proto`)
- **Type mode:** `--!strict` globally via `.luaurc` + per-file directive
- **Test runner:** Custom grouped-by-suite runner with summary output

## Directory Structure

```
luau-data-transform/
├── .luaurc                    # Aliases + strict mode
├── .gitignore
├── README.md
├── bin/
│   └── main.luau              # CLI entry point (placeholder)
├── lib/
│   └── test_runner.luau       # Reusable test harness
├── test/
│   ├── test_main.luau         # Test entry: lune run test/test_main
│   ├── test_placeholder.luau  # Single passing test
│   └── fixtures/
│       ├── values.json        # From OCaml repo
│       └── transformed_values.json
├── proto/
│   ├── data_types.proto       # Copied verbatim
│   ├── data_types_constants.json
│   ├── table_schema.proto
│   └── tables/
│       ├── source_table.proto
│       ├── source_table_constants.json
│       ├── target_table.proto
│       └── target_table_constants.json
└── specs/                     # Epic docs
```

## .luaurc

```json
{
  "languageMode": "strict",
  "aliases": {
    "lib": "./lib",
    "test": "./test",
    "proto": "./proto"
  }
}
```

`languageMode: "strict"` applies globally. Each `.luau` file also includes `--!strict` at the top for standalone analysis and clarity.

## Test Runner (`lib/test_runner.luau`)

### API

```lua
local T = require("@lib/test_runner")

T.describe("suite_name", function()
    T.it("test case name", function()
        T.expect(actual).toEqual(expected)  -- deep structural equality
        T.expect(actual).toBe(expected)     -- primitive/reference equality
        T.expect(actual).toBeNil()          -- nil check
        T.expect(actual).toBeTruthy()       -- not nil and not false
    end)
end)

T.run()  -- execute, print results, exit(1) on failure
```

### Behavior

- `describe` groups tests under a named suite (e.g., `[schema]`)
- `it` registers a test case within the current suite
- `expect` returns an assertion object with comparison methods
- `toEqual` performs recursive deep comparison of tables (since `{1,2} == {1,2}` is false in Luau)
- `run` executes all suites in registration order, wraps each test in `pcall`, prints grouped output:

```
[schema]
  PASS test_load_data_type_constants
  PASS test_load_source_table_schema
  FAIL test_load_target_table_schema
    Expected 5 fields, got 4

Results: 25/26 passed, 1 failed
```

Uses `process.exit(1)` if any test fails. Lune standard library modules are imported as `require("@lune/process")`, `require("@lune/fs")`, `require("@lune/serde")`, etc.

### Test Wiring Pattern

`test_main.luau` is the entry point that requires each test file (pulling in their registrations), then calls `T.run()`:

```lua
--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")  -- registers its describe/it blocks
-- Future specs add more requires here
T.run()
```

Each test file requires the test runner and registers tests but does NOT call `T.run()`.

### Design Rationale

Kept minimal — no beforeEach/afterEach, no async support, no mocking. Just enough for the test patterns in the OCaml project (pure function assertions, JSON fixture comparison). Can be extended in later specs if needed.

## Files Copied from OCaml Repo

All copied byte-for-byte with no modifications.

**Proto schemas (4):**
- `proto/data_types.proto` — 6 simple types, 15 compound types, CustomCompoundType
- `proto/table_schema.proto` — SingleFieldType, TableSchema, FieldGroup
- `proto/tables/source_table.proto` — SourceTableFieldsMap, SourceTableSchema
- `proto/tables/target_table.proto` — TargetTableFieldsMap, TargetTableSchema

**Constants JSON (3):**
- `proto/data_types_constants.json` — 47 type definitions with regex, formatPatterns, options, subFieldKeys
- `proto/tables/source_table_constants.json` — source table field metadata
- `proto/tables/target_table_constants.json` — target table field metadata

**Test fixtures (2):**
- `test/fixtures/values.json` — sample source input (7 fields)
- `test/fixtures/transformed_values.json` — expected transformation output

## Execution Conventions

```bash
# Prerequisites
# Install Lune: https://github.com/lune-org/lune

# Run all tests
lune run test/test_main

# Run CLI (placeholder until spec 3)
lune run bin/main <values.json>
```

## .gitignore

```
.DS_Store
lune-packages/
*.luau.lock
```

## Placeholder Files

**`bin/main.luau`:** Prints usage message. Actual CLI implemented in spec 3 (transform-engine).

**`test/test_placeholder.luau`:** Single passing test that verifies the test runner works and Lune can read a JSON fixture file via `fs.readFile` + `serde.decode`.

## Interface Contract

This spec establishes conventions consumed by all subsequent specs:

| Convention | Detail |
|---|---|
| Runtime | Lune (`lune run <script>`) |
| Module imports | `require("@lib/module_name")` via `.luaurc` aliases. All cross-module imports use `@` aliases — relative `require("../lib/...")` paths are NOT used. |
| Type mode | `--!strict` on all files |
| Test pattern | `require("@lib/test_runner")`, describe/it/expect, register in test_main |
| Test execution | `lune run test/test_main` |
| File I/O | `fs.readFile(path)` + `serde.decode("json", content)` |
| Proto/constants location | `proto/` directory, read at runtime via fs |

## Acceptance Criteria

- [ ] Lune is installed and `lune run` executes a hello-world script successfully
- [ ] Directory structure created: `lib/`, `test/`, `test/fixtures/`, `proto/`, `proto/tables/`, `bin/`
- [ ] All `.proto` and `.json` constants files copied verbatim from OCaml repo
- [ ] Test fixtures copied verbatim into `test/fixtures/`
- [ ] `.luaurc` configured with aliases and strict mode
- [ ] `--!strict` directive in all `.luau` files
- [ ] Minimal test runner exists with describe/it/expect/run API
- [ ] `lune run test/test_main` runs placeholder test and reports pass
- [ ] `.gitignore` configured
- [ ] `README.md` documents prerequisites, how to run, and how to test
