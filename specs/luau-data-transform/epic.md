# Epic: luau-data-transform

## Goal

Port the OCaml data-transformation pipeline to Luau, running on the Lune standalone runtime. Copy protobuf schemas as the source of truth, generate or hand-write Luau type definitions with JSON+binary serialization, reimplement all transform utils and field mappings in idiomatic Luau, and port all 26 tests across 7 suites.

## Runtime & Protobuf Research Findings

### Runtime: Lune (recommended)

Two standalone Luau runtimes exist:

| Runtime | Maturity | Built-in APIs | Notes |
|---------|----------|---------------|-------|
| [Lune](https://github.com/lune-org/lune) | Stable, widely used | `fs`, `serde` (JSON/TOML/YAML), `net`, `process`, `stdio`, `task` | Built in Rust. ~5MB binary. Full docs + LSP type defs. |
| [Lute](https://github.com/luau-lang/lute) | Pre-1.0, official Luau team | `fs`, `net`, `process` (still growing) | Newer, less stable API surface. |

**Recommendation: Lune.** It has the richer standard library (especially `serde` for JSON), better documentation, and is production-stable. Key APIs we need: `fs.readFile` for loading JSON fixtures/constants, `serde.decode("json", ...)` / `serde.encode("json", ...)` for JSON round-trips, `process` for CLI entry point.

### Protobuf: Constraint Analysis

Neither Lune nor any Luau runtime supports loading native C shared libraries (`.so`/`.dylib`). All mature Lua protobuf libraries (`starwing/lua-protobuf`, `urbanairship/protobuf-lua`, `Neopallium/lua-pb`) require C modules for binary wire-format encode/decode.

**Options evaluated:**

1. **Pure-Luau protobuf wire format** -- Write a Luau implementation of protobuf binary encoding/decoding (varint, length-delimited, fixed32/64). Feasible since Luau has `string.byte`/`string.char`/`buffer` and `bit32`. This enables true binary protobuf round-trips without C dependencies.

2. **JSON-only with typed Luau tables** -- Use `.proto` files as documentation; hand-write Luau types; serialize via JSON only. Simpler but loses binary protobuf.

3. **Codegen script** -- Write a script (in any language) that reads `.proto` files and generates Luau type definitions + encode/decode functions (for either JSON or binary).

**Recommendation: Start with option 2 (JSON-only typed tables) in the first spec, with the `.proto` files copied verbatim. A later spec implements binary protobuf encode/decode in pure Luau.** This mirrors the OCaml project's actual data flow -- the integration test and CLI both use JSON, and the binary round-trip tests are a separate concern.

## Sub-Specs

### 1. project-setup

**Goal:** Initialize the Luau project with Lune runtime, directory structure, tooling configuration, and proto schema files copied from the OCaml repo. Establish the build/run/test conventions. Verify the environment works with a trivial "hello world" script and a trivial test.

**Size:** Small

**Dependencies:** none

**Acceptance Criteria:**
- [ ] Lune is installed and `lune run` executes a hello-world `.luau` script successfully
- [ ] Directory structure created: `lib/`, `test/`, `test/fixtures/`, `proto/`, `proto/tables/`, `bin/`
- [ ] All `.proto` files and `.json` constants files copied verbatim from `ocaml-data-transform/proto/` into `proto/`
- [ ] Test fixtures (`values.json`, `transformed_values.json`) copied verbatim into `test/fixtures/`
- [ ] A `.luaurc` or Lune config file is set up for module resolution (e.g., path aliases)
- [ ] `--!strict` mode is used in all `.luau` files
- [ ] A minimal test runner script exists (`lune run test`) that runs a single passing placeholder test and reports results
- [ ] `.gitignore` configured appropriately
- [ ] `README.md` documents setup prerequisites, how to run, and how to test

**Interface Contract:**
- Exports: Project directory layout convention. Module require paths (e.g., `require("../lib/json_path")` or alias-based). Lune runtime as the execution environment. Test runner invocation pattern (`lune run test/test_main`).
- Consumed by: All other specs depend on this project skeleton and runtime environment.

### 2. types-and-schema

**Goal:** Define all protobuf-equivalent Luau types (data types, table schemas, source/target table types) and implement schema loading from JSON constants files. Port `schema.ml` functionality. This is the type foundation everything else builds on.

**Size:** Standard

**Dependencies:** project-setup

**Acceptance Criteria:**
- [ ] Luau `export type` definitions for all 6 simple types (`StringType`, `NumberType`, `BooleanType`, `EnumType`, `MultipleCheckboxType`, `RadioGroupType`)
- [ ] Luau `export type` definitions for all 15 compound types (e.g., `AddressType`, `IndividualNameType`, `MoneyType`, etc.) with their `SubFields` types
- [ ] Luau `export type` for `CustomCompoundType`, `NonCustomFieldValue`, `SingleFieldType`
- [ ] Luau `export type` for `TableSchema`, `FieldGroup`
- [ ] Luau `export type` for source-table-specific types (`LpSignatoryFields`, `LpSignatoryType`, `W9Fields`, `W9Type`, `SourceTableFieldsMap`, `SourceTableSchema`)
- [ ] Luau `export type` for target-table-specific types (`TargetTableFieldsMap`, `TargetTableSchema`)
- [ ] Constructor/make functions for each type (matching OCaml's `make_*` functions generated by ocaml-protoc)
- [ ] `load_data_type_constants()` function that reads `proto/data_types_constants.json` and returns a typed map of 47 type definitions
- [ ] `load_source_table_schema()` function that reads `proto/tables/source_table_constants.json` and returns a typed source table schema (with `snake_to_camel` key conversion matching OCaml's behavior)
- [ ] `load_target_table_schema()` function that reads `proto/tables/target_table_constants.json` and returns a typed target table schema
- [ ] JSON encode/decode functions for `SourceTableFieldsMap` and `TargetTableFieldsMap` (to/from Luau tables, handling camelCase JSON keys vs snake_case field names)
- [ ] All 3 schema tests ported: `test_load_data_type_constants`, `test_load_source_table_schema`, `test_load_target_table_schema`
- [ ] All 5 protobuf tests ported as JSON round-trip tests: `StringType`, `MultipleCheckboxType`, `AddressType`, `TableSchema` round-trips (binary round-trip deferred to spec 4; these test JSON encode/decode)

**Interface Contract:**
- Exports:
  - Module `lib/data_types.luau`: All simple and compound type definitions + constructor functions. E.g., `DataTypes.makeStringType({ typeId: string, value: string?, regex: string?, formatPatterns: {string}? }) -> StringType`
  - Module `lib/table_schema.luau`: `SingleFieldType`, `TableSchema`, `FieldGroup` types + constructors
  - Module `lib/source_table.luau`: `SourceTableFieldsMap`, `SourceTableSchema` types + `decodeJsonSourceTableFieldsMap(json) -> SourceTableFieldsMap`, `makeSourceTableFieldsMap(...) -> SourceTableFieldsMap`
  - Module `lib/target_table.luau`: `TargetTableFieldsMap`, `TargetTableSchema` types + `encodeJsonTargetTableFieldsMap(fields) -> table`, `decodeJsonTargetTableFieldsMap(json) -> TargetTableFieldsMap`, `makeTargetTableFieldsMap(...) -> TargetTableFieldsMap`
  - Module `lib/schema.luau`: `loadDataTypeConstants() -> {[string]: TypeConstants}`, `loadSourceTableSchema() -> SourceTableSchema`, `loadTargetTableSchema() -> TargetTableSchema`, `findTypeConstants(constants, typeId) -> TypeConstants?`
- Consumed by: spec-3 (transform-engine uses these types as input/output), spec-4 (binary protobuf adds encode/decode for these types)

### 3. transform-engine

**Goal:** Port `json_path.ml`, `transform_utils.ml`, `mappings.ml`, `example_mappings.ml`, the CLI entry point (`main.ml`), and the integration test. This is the core data transformation logic.

**Size:** Standard

**Dependencies:** types-and-schema

**Acceptance Criteria:**
- [ ] `lib/json_path.luau` ported: `getPath(json, path) -> value?`, `setPath(json, path, value) -> json`, `getString(json, path) -> string?`, `getStringOrEmpty(json, path) -> string`, `getStringList(json, path) -> {string}`
- [ ] 4 json_path tests ported: `get nested path`, `get missing path`, `get empty path`, `set nested path`
- [ ] `lib/transform_utils.luau` ported: `identity(x) -> x`, `groupBy(items, keyFn, valueFn) -> {{key, values}}`, `mergeBy(items, keyFn, valueFn) -> {{key, value}}`, `mapValues(pairs, fn) -> pairs`, `deepMerge(objects) -> object`
- [ ] 6 transform_utils tests ported: `identity`, `group_by`, `merge_by`, `map_values`, `deep_merge`, `deep_merge overwrite`
- [ ] `lib/mappings.luau` ported: `textboxMapping(config) -> Mapping`, `checkboxMapping(config) -> Mapping`, `customMapping(config) -> Mapping`, `applyMapping(mapping, source) -> json`, `transformAll(mappings, source) -> json`
- [ ] 2 mappings tests ported: `textbox mapping`, `checkbox mapping`
- [ ] `lib/example_mappings.luau` ported: `splitName(fullname) -> NameParts`, `transform(sourceFields) -> TargetTableFieldsMap` with all 6 concrete field mappings (commitment, investor_name, regulated_status, international_supplements, signer_name, w9_tin_type)
- [ ] 15 example_mappings tests ported: `split_name` (4 tests), `commitment`, `investor_name` (2), `regulated_status` (2), `international_supplements`, `signer_name` (2), `w9_tin_type` (3)
- [ ] `bin/main.luau` CLI entry point: reads `values.json` path from args, loads source, transforms, outputs JSON to stdout
- [ ] 1 integration test ported: `typed pipeline` (reads `test/fixtures/values.json`, transforms, compares to `test/fixtures/transformed_values.json`)
- [ ] Total: 28 test cases across 7 suites (26 from OCaml + 2 JSON round-trip tests added in spec 2)

**Interface Contract:**
- Exports:
  - Module `lib/json_path.luau`: `getPath(t: table, path: {string}) -> any?`, `setPath(t: table, path: {string}, value: any) -> table`, `getString(t: table, path: {string}) -> string?`, `getStringOrEmpty(t: table, path: {string}) -> string`, `getStringList(t: table, path: {string}) -> {string}`
  - Module `lib/transform_utils.luau`: `identity<T>(x: T) -> T`, `groupBy<T,V>(items: {T}, keyFn: (T) -> string, valueFn: (T) -> V) -> {{string, {V}}}`, `mergeBy<T,V>(...)`, `mapValues(...)`, `deepMerge(objects: {table}) -> table`
  - Module `lib/mappings.luau`: `Mapping` type, `textboxMapping(config) -> Mapping`, `checkboxMapping(config) -> Mapping`, `customMapping(config) -> Mapping`, `applyMapping(mapping: Mapping, source: table) -> table`, `transformAll(mappings: {Mapping}, source: table) -> table`
  - Module `lib/example_mappings.luau`: `splitName(fullname: string) -> NameParts`, `transform(source: SourceTableFieldsMap) -> TargetTableFieldsMap`
  - CLI: `lune run bin/main <values.json>` outputs transformed JSON to stdout
- Consumed by: spec-4 (integration test may optionally verify binary round-trip of transformed output)

### 4. protobuf-binary

**Goal:** Implement pure-Luau protobuf binary wire format encoding and decoding. Add binary round-trip tests matching the OCaml protobuf test suite. This enables true protobuf interop without C dependencies.

**Size:** Standard

**Dependencies:** types-and-schema

**Acceptance Criteria:**
- [ ] `lib/pb/wire.luau`: Low-level protobuf wire format primitives -- varint encode/decode, zigzag encode/decode, fixed32/fixed64 encode/decode, length-delimited read/write. Uses Luau `buffer` library and `bit32`.
- [ ] `lib/pb/encoder.luau`: Protobuf message encoder -- takes a Luau table + schema descriptor and produces binary bytes. Supports all wire types (varint, 64-bit, length-delimited, 32-bit). Handles repeated fields, nested messages, maps, oneofs.
- [ ] `lib/pb/decoder.luau`: Protobuf message decoder -- reads binary bytes and produces a Luau table using schema descriptor. Handles unknown fields gracefully (skips them).
- [ ] `lib/pb/schema_registry.luau`: Loads `.proto` schema definitions (from the text `.proto` files or from a pre-compiled descriptor) and provides encode/decode dispatch for any registered message type.
- [ ] Binary round-trip test: `StringType` (encode to bytes, decode back, verify fields match)
- [ ] Binary round-trip test: `MultipleCheckboxType`
- [ ] Binary round-trip test: `AddressType` (nested compound type with sub-fields)
- [ ] Binary round-trip test: `TableSchema` with `map<string, SingleFieldType>` (tests map field encoding)
- [ ] JSON-then-binary interop test: decode `test/fixtures/values.json` into Luau types, encode to protobuf binary, decode back, verify equality

**Interface Contract:**
- Exports:
  - Module `lib/pb/wire.luau`: `encodeVarint(buf, value)`, `decodeVarint(bytes, offset) -> (value, newOffset)`, `encodeFixed32(buf, value)`, `decodeFixed32(bytes, offset) -> (value, newOffset)`, `encodeFixed64(buf, value)`, `decodeFixed64(bytes, offset) -> (value, newOffset)`, `zigzagEncode(n) -> n`, `zigzagDecode(n) -> n`
  - Module `lib/pb/encoder.luau`: `encode(messageType: string, data: table) -> string` (binary bytes as Luau string)
  - Module `lib/pb/decoder.luau`: `decode(messageType: string, bytes: string) -> table`
  - Module `lib/pb/schema_registry.luau`: `register(protoContent: string)`, `encode(messageType, data) -> string`, `decode(messageType, bytes) -> table`
- Consumed by: Any future consumer needing binary protobuf interop (e.g., sending/receiving protobuf over the wire via `net`).

## Dependency Graph

```
                  +-----------------+
                  | 1. project-setup|
                  +--------+--------+
                           |
                  +--------v--------+
                  | 2. types-and-   |
                  |    schema       |
                  +---+--------+----+
                      |        |
            +---------v--+  +--v-----------+
            | 3. transform|  | 4. protobuf- |
            |    engine   |  |    binary    |
            +-------------+  +-------------+
```

## Execution Order

1. **Start immediately:** `project-setup` (no dependencies)
2. **After project-setup:** `types-and-schema` (needs project skeleton + proto files)
3. **After types-and-schema (parallel):** `transform-engine` and `protobuf-binary` can run in parallel -- they both depend on types-and-schema but not on each other

## Key Design Decisions

1. **Lune over Lute:** Lune has stable `fs` + `serde` APIs needed for JSON I/O. Lute is pre-1.0.

2. **JSON-first, binary-second:** The OCaml project's primary data flow is JSON-based (constants files, test fixtures, CLI I/O). Binary protobuf is used only in round-trip tests. Spec 2 delivers working JSON serialization; spec 4 adds binary as an independent enhancement.

3. **snake_case vs camelCase:** The OCaml project has a `snake_to_camel` preprocessor because `ocaml-protoc` generates camelCase JSON keys while constants files use snake_case. The Luau port needs the same conversion. JSON fixtures (`values.json`, `transformed_values.json`) use camelCase keys -- these are the wire format. Constants files use snake_case -- these need preprocessing before decode.

4. **No `map<>` codegen bug:** The OCaml project works around an `ocaml-protoc` bug with `map<>` fields. Since we're hand-writing Luau types, this issue doesn't exist in the port.

5. **Module structure mirrors OCaml:** Each OCaml `.ml`/`.mli` file maps to one Luau `.luau` module file. The interface (`.mli`) becomes `export type` declarations at the top of each module.

## Source References

- OCaml source repo: `/Users/cuongtran/w/data-tech-stack/ocaml-data-transform/`
- Proto schemas: `proto/data_types.proto`, `proto/table_schema.proto`, `proto/tables/source_table.proto`, `proto/tables/target_table.proto`
- JSON constants: `proto/data_types_constants.json`, `proto/tables/source_table_constants.json`, `proto/tables/target_table_constants.json`
- Test fixtures: `test/fixtures/values.json`, `test/fixtures/transformed_values.json`
- Lune docs: https://lune-org.github.io/docs/
- Lune GitHub: https://github.com/lune-org/lune
