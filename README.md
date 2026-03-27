# luau-data-transform

![Luau](https://img.shields.io/badge/Luau-strict_mode-blue)
![Runtime](https://img.shields.io/badge/runtime-Lune_v0.10+-green)
![Tests](https://img.shields.io/badge/tests-80%2F80_passing-brightgreen)

A type-safe data transformation pipeline in Luau, running on the [Lune](https://github.com/lune-org/lune) runtime. Ported from the OCaml reference implementation, it transforms data between source and target table schemas with 21 semantic types, 15 compound types, and dual serialization (JSON + Protobuf binary). Includes a full production-scale Carlyle use case with 5 source/target tables (1200+ fields), 89+ scalar mapping rules, 3 array mappings, and end-to-end integration tests.

## Table of Contents

- [Overview](#overview)
- [Prerequisites & Setup](#prerequisites--setup)
- [Running Tests](#running-tests)
- [Project Structure](#project-structure)
- [Architecture & Main Components](#architecture--main-components)
  - [Type System](#type-system)
  - [Source & Target Schemas](#source--target-schemas)
  - [Transform Engine](#transform-engine)
  - [Serialization Codecs](#serialization-codecs)
  - [Data Flow](#data-flow)
- [Known Issues & Limitations](#known-issues--limitations)

## Overview

This project implements a complete data transformation pipeline that:

1. **Defines typed schemas** — 6 simple types (String, Number, Boolean, Enum, MultipleCheckbox, RadioGroup) spanning 21 semantic variants, plus 15 compound types (Address, IndividualName, Money, etc.) with nested sub-fields.
2. **Transforms data between schemas** — A prototype with 6 field mappings (7-field source → 8-field target), plus a production-scale Carlyle use case with 89+ scalar mappings and 3 array mappings across 5 source tables (contact, W9, feeder, master) producing a 493-field target table.
3. **Generates typed modules from proto** — A `protoc-gen-luau` code generator produces typed Luau modules from `.proto` definitions, with a Python script (`scripts/gen_protos.py`) to generate proto + constants JSON from CUE schema exports.
4. **Serializes in two formats** — Full JSON and Protobuf binary codecs with symmetric encode/decode for all types.

## Prerequisites & Setup

**Required:** [Lune](https://github.com/lune-org/lune) v0.10+ (standalone Luau runtime)

```bash
# macOS (Homebrew)
brew install lune-org/tap/lune

# Rust / Cargo
cargo install lune-cli

# Aftman
aftman add lune-org/lune
```

**Verify installation:**

```bash
lune --version
# Expected: lune 0.10.x or higher
```

**Module resolution:** Path aliases (`@lib`, `@test`, `@proto`) are configured in `.luaurc` — no additional setup required.

## Running Tests

```bash
# Run the full test suite (80 tests)
lune run test/test_main
```

Expected output:

```
[PASS] Wire format primitives           (15 tests)
[PASS] Data type JSON codecs            (8 tests)
[PASS] Schema loading                   (3 tests)
[PASS] JSON path navigation             (4 tests)
[PASS] Transform utilities              (6 tests)
[PASS] Generic mappings                 (2 tests)
[PASS] Example field mappings           (15 tests)
[PASS] Protobuf binary round-trips      (5 tests)
[PASS] Carlyle scalar mappings          (15 tests)
[PASS] Carlyle array mappings           (6 tests)
[PASS] Carlyle integration              (2 tests — feeder + master end-to-end)

80 passed, 0 failed
```

**Run the prototype CLI transformation:**

```bash
lune run bin/main test/fixtures/values.json
```

This reads a 7-field source fixture, applies 6 field mappings, and outputs the 8-field target as JSON.

**Run the Carlyle production transform:**

```bash
# Feeder table (contact + feeder + w9 → 493-field target)
lune run bin/carlyle_transform test/fixtures/test-feeder-table-input.json

# Master table (contact + master → 493-field target)
lune run bin/carlyle_transform test/fixtures/test-master-table-input.json
```

Input JSON has optional namespaces: `contact`, `w9`, `feeder`, `master`. The transform applies 89+ scalar mappings and 3 array mappings, outputting the full target table as JSON.

## Project Structure

```
luau-data-transform/
├── bin/
│   ├── main.luau                    Prototype CLI (7-field source → 8-field target)
│   └── carlyle_transform.luau       Carlyle CLI (4 source tables → 493-field target)
│
├── lib/                             Core library
│   ├── data_types.luau              6 simple + 15 compound type definitions, constructors, JSON codecs
│   ├── source_table.luau            Prototype source schema (7 fields) + JSON codec
│   ├── target_table.luau            Prototype target schema (8 fields) + JSON codec
│   ├── source_contact_table.luau    [generated] Contact source (1 field, compound)
│   ├── source_w9_table.luau         [generated] W9 source (18 fields)
│   ├── source_feeder_table.luau     [generated] Feeder source (353 fields, 20 compounds)
│   ├── source_master_table.luau     [generated] Master source (362 fields, 20 compounds)
│   ├── full_target_table.luau       [generated] Full target (493 fields, 4 compound arrays)
│   ├── table_schema.luau            Generic TableSchema, SingleFieldType, FieldGroup wrappers
│   ├── schema.luau                  Schema loading from proto constants + snakeToCamel conversion
│   ├── carlyle_mappings.luau        Carlyle use case: 89+ scalar rules, 3 array mappers, orchestrator
│   ├── example_mappings.luau        Prototype: 6 concrete field mapping transformations
│   ├── mappings.luau                Generic mapping engine (textbox, checkbox, custom)
│   ├── json_path.luau               Path-based navigation in nested tables
│   ├── transform_utils.luau         Functional utilities (groupBy, mergeBy, deepMerge)
│   ├── test_runner.luau             Custom test framework (describe/it/expect)
│   └── pb/                          Protobuf binary codec
│       ├── wire.luau                Wire format primitives (varint, tags, WriteBuf)
│       ├── encoder.luau             Type-specific protobuf encoders
│       ├── decoder.luau             Type-specific protobuf decoders
│       └── schema_registry.luau     Message type dispatch (encode/decode by name)
│
├── scripts/
│   └── gen_protos.py                Generates .proto + _constants.json from CUE JSON exports
│
├── test/
│   ├── test_main.luau               Test orchestrator (runs all suites)
│   ├── test_wire.luau               Wire format primitive tests (15)
│   ├── test_protobuf_binary.luau    Binary round-trip tests (5)
│   ├── test_protobuf_json.luau      JSON encoding/decoding tests
│   ├── test_schema.luau             Schema loading tests
│   ├── test_json_path.luau          Path navigation tests
│   ├── test_transform_utils.luau    Utility function tests
│   ├── test_mappings.luau           Generic mapping tests
│   ├── test_example_mappings.luau   Prototype field mapping tests (15)
│   ├── test_integration.luau        Prototype pipeline integration test
│   ├── test_carlyle_scalar_mappings.luau  Carlyle scalar + array mapper tests (21)
│   ├── test_carlyle_integration.luau      Carlyle end-to-end tests (2)
│   └── fixtures/
│       ├── values.json                    Prototype source data
│       ├── transformed_values.json        Prototype expected output
│       ├── test-feeder-table-input.json   Carlyle feeder input (SV-stripped)
│       ├── test-feeder-table-output.json  Carlyle feeder expected output
│       ├── test-master-table-input.json   Carlyle master input (SV-stripped)
│       └── test-master-table-output.json  Carlyle master expected output
│
├── proto/                           Protobuf definitions
│   ├── data_types.proto             Simple + compound type message definitions
│   ├── data_types_constants.json    Type metadata (regex patterns, options, field orders)
│   └── tables/
│       ├── source_table.proto                 Prototype source (7 fields)
│       ├── source_table_constants.json
│       ├── target_table.proto                 Prototype target (8 fields)
│       ├── target_table_constants.json
│       ├── source_contact_table.proto         [generated] Contact (1 field)
│       ├── source_contact_table_constants.json
│       ├── source_w9_table.proto              [generated] W9 (18 fields)
│       ├── source_w9_table_constants.json
│       ├── source_feeder_table.proto          [generated] Feeder (353 fields)
│       ├── source_feeder_table_constants.json
│       ├── source_master_table.proto          [generated] Master (362 fields)
│       ├── source_master_table_constants.json
│       ├── full_target_table.proto            [generated] Target (493 fields)
│       └── full_target_table_constants.json
│
├── docs/
│   ├── specs/                       Design documents
│   ├── superpowers/plans/           Implementation plans
│   └── cue-json-src/               CUE schema exports (source of truth for field definitions)
│
├── .luaurc                          Path aliases (@lib, @test, @proto)
└── .gitignore
```

## Architecture & Main Components

### Type System

The type system models financial/regulatory data with two tiers:

**6 Simple Types** covering 21 semantic variants (dispatched by `typeId`):

| Type | Semantic Variants | Key Fields |
|------|-------------------|------------|
| `StringType` | String, Ssn, Ein, Aba, Email, UsZip, + 15 more | `value`, optional `regex`, optional `formatPatterns` |
| `NumberType` | Integer, Float, Percentage, Year | `value`, `decimalPlaces`, optional `minValue`/`maxValue` |
| `BooleanType` | Boolean | `value` |
| `EnumType` | ShareClass, TransactionType, SubscriptionStatus | `value`, `options` |
| `MultipleCheckboxType` | MultipleCheckbox | `selectedKeys`, `allOptionKeysInOrder`, `allOptionLabelsInOrder` |
| `RadioGroupType` | RadioGroup | `selectedKey`, `allOptionKeysInOrder`, `allOptionLabelsInOrder` |

**15 Compound Types** using a consistent SubFields + Wrapper pattern:

Each compound type has:
- A **SubFields** struct with typed properties (e.g., `AddressSubFields` has `city: StringType?`, `stateProvince: StringType?`, etc.)
- A **Wrapper** struct with `typeId`, `valueSubFields`, `subFieldKeysInOrder`, and optional `label`

Compound types include: PhoneFax, DateTime, Money, Address, IndividualName, Country, BaseContact, SubmissionContact, Signatory, BankInfo, BankAccountInfo, WireInstructions, BrokerageFirm, BrokerageAccount, ServiceContactPoint.

**Union dispatch:** Luau has no native union types. The `FieldValue` union uses duck typing with `typeId: string` as the discriminator. Lookup tables in encoder/decoder modules dispatch to the correct codec based on the `typeId` value.

**Per-type API pattern** (consistent across all types):

```lua
-- Constructor
DataTypes.makeStringType({ typeId = "Ssn", value = "123-45-6789", regex = "^\\d{3}-\\d{2}-\\d{4}$" })

-- JSON codec
DataTypes.encodeJsonStringType(value)  -->  { typeId = "Ssn", value = "123-45-6789", ... }
DataTypes.decodeJsonStringType(json)   -->  StringType

-- Protobuf binary codec
Encoder.encodePbStringType(value)      -->  binary string
Decoder.decodePbStringType(bytes)      -->  StringType
```

### Source & Target Schemas

**Prototype schemas** (hand-written):
- **SourceTableFieldsMap** (7 fields) — investor onboarding: lpSignatory compound, W9 compound, 4 checkbox/string fields
- **TargetTableFieldsMap** (8 fields) — Salesforce: commitment, investor name, regulated status, supplements, signer name, TIN type

**Production Carlyle schemas** (generated via `protoc-gen-luau` from proto definitions):

| Table | Fields | Compounds | Source |
|-------|--------|-----------|--------|
| SourceContactTable | 1 | 1 (ContactInfo, 12 sub-fields) | `docs/cue-json-src/full-source-table.json` |
| SourceW9Table | 18 | 0 | Same (namespace: w9) |
| SourceFeederTable | 353 | 20 (Signatory, Address, etc.) | Same (namespace: feeder) |
| SourceMasterTable | 362 | 20 | Same (namespace: master) |
| FullTargetTable | 493 | 4 (BeneficialOwner, Contact, ControllingPersons, FundSelection) | `docs/cue-json-src/full-target-table.json` |

Proto + constants files are generated by `scripts/gen_protos.py`, then Luau modules are generated by `protoc-gen-luau` (external Go tool) via `generate.sh`.

**TableSchema** is a generic wrapper providing:
- `fieldsMap: {[string]: SingleFieldType}` — heterogeneous typed field collection
- `fieldKeysInOrder: {string}` — preserves iteration order
- `groups: {FieldGroup}` — optional UI/reporting grouping

### Transform Engine

The transform layer has two levels of abstraction:

**Generic mapping engine** (`lib/mappings.luau`) — reusable infrastructure:
- `textboxMapping`: Gather multiple input paths, extract `.value`, concatenate
- `checkboxMapping`: Gather input paths, extract `.selectedKeys`, map through option lookup, deduplicate
- `customMapping`: Apply arbitrary transform function
- `applyMapping` / `transformAll`: Execute mappings and deep-merge results

**Prototype field mappings** (`lib/example_mappings.luau`) — 6 hand-written transformations demonstrating the patterns (commitment, investor name, regulated status, international supplements, signer name, W9 TIN type).

**Production Carlyle mappings** (`lib/carlyle_mappings.luau`) — data-driven, 1844 lines:

| Pattern | Count | Logic |
|---------|-------|-------|
| Textbox | 46 | Collect `.value` from source StringType fields, concatenate |
| RadioGroup | 34 | Collect `selectedKeys`, map through option lookup, deduplicate |
| CheckboxGroup | 6 | Same as radioGroup (3 standard + 3 boolean variant) |
| NameSplit | 3 | Split full name → first/middle/last (9 target fields) |
| Custom | 1 | Individual vs Organization detection |
| W9 conditional | ~20 | Rules conditioned on disregarded entity (w9_line2) |
| sf_ControllingPersons | 1 array | Index-based (5 indices), name splitting |
| sf_BeneficialOwner | 1 array | Index-based, 12 sub-fields including nested address |
| sf_Contact | 1 array | Iterates contact array, role/notification boolean mapping |

Orchestrated by `CarlyleMappings.transform(contact, w9, feeder, master) → FullTargetTableFieldsMap`.

**Supporting utilities:**
- `json_path.luau`: Path-based table navigation (`getPath`, `setPath`, `getString`, `getStringList`)
- `transform_utils.luau`: Functional combinators (`groupBy`, `mergeBy`, `mapValues`, `deepMerge`)

### Serialization Codecs

**JSON codec** (text-based):
- Each type has `encodeJsonXxx` and `decodeJsonXxx` functions
- Handles optional fields (omit `nil`), nested structures, repeated fields
- Preserves the distinction between `nil` and default values (`""`, `0`)

**Protobuf binary codec** (wire format) — three-layer architecture:

```
Layer 3: Schema Registry     Message name → {encode, decode} dispatch
            ↕
Layer 2: Type Codecs          encodePb*/decodePb* per type (890 + 1299 lines)
            ↕
Layer 1: Wire Primitives      varint, tags, length-delimited, WriteBuf
```

- **Wire primitives** (`wire.luau`): Stateless offset-passing design — all functions take `(buf, offset)` and return `newOffset`. `WriteBuf` provides a growable encoding buffer.
- **Type codecs** (`encoder.luau`, `decoder.luau`): One encode/decode function per type. Oneof dispatch maps `typeId` values to proto field numbers.
- **Schema registry** (`schema_registry.luau`): ~30 message types pre-registered for encode/decode by name.

### Data Flow

**Prototype pipeline** (7-field source → 8-field target):

```
values.json → decodeJsonSourceTableFieldsMap() → ExampleMappings.transform()
  → 6 field mappings → encodeJsonTargetTableFieldsMap() → stdout JSON
```

**Production Carlyle pipeline** (1200+ fields, 4 sources → 493-field target):

```
┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   contact    │  │     w9       │  │   feeder     │  │   master     │
│  (1 field)   │  │ (18 fields)  │  │(353 fields)  │  │(362 fields)  │
└──────┬───────┘  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘
       │                 │                 │                 │
       └────────────┬────┴────────┬────────┘─────────────────┘
                    ▼             ▼
     ┌─────────────────────────────────────────┐
     │     CarlyleMappings.transform()         │
     │                                         │
     │  transformScalars(feeder, master, w9)    │
     │    46 textbox + 34 radioGroup + 6 check │
     │    3 nameSplit + 1 custom + ~20 W9      │
     │                                         │
     │  mapControllingPersons(master, feeder)   │
     │  mapBeneficialOwner(master, feeder)      │
     │  mapContact(contact)                     │
     └────────────────┬────────────────────────┘
                      ▼
          FullTargetTableFieldsMap (493 fields)
```

For binary serialization, the same types can be encoded/decoded through the protobuf codec path: `Encoder.encodePb*` → binary bytes → `Decoder.decodePb*`.

## Known Issues & Limitations

### Proto3 Default Value Round-Trip Loss

Binary protobuf round-trips cannot distinguish between `nil` and proto3 default values:

- **Optional string fields** (`string?`): `nil` and `""` become indistinguishable after binary round-trip. Affected: `StringType.regex`, all compound wrapper `.label` fields.
- **Optional number fields** (`number?`): `nil` and `0` become indistinguishable. Affected: `NumberType.minValue`, `NumberType.maxValue`.

The JSON codec preserves this distinction. In practice the codebase never uses empty-string labels or zero min/max values as meaningful values, so this is acceptable for current use cases.

### Non-Deterministic Map Field Encoding

Protobuf map fields have no guaranteed wire order, and Luau table iteration for string keys is non-deterministic. This means:
- Binary output for map fields (`TableSchema.fieldsMap`, `CustomCompoundType.valueSubFields`) can produce different bytes for the same data
- Tests compare decoded values via `toEqual()`, not raw bytes

### 32-bit Varint Only

The varint codec uses `bit32` (32-bit unsigned integers). The current proto schema only uses `int32`, `bool`, `string`, and `double` — no `int64`/`uint64` fields. If 64-bit integer fields are added in the future, the varint codec would need a multi-word approach.

### No Packed Repeated Encoding

Repeated fields use standard tag-per-element encoding rather than proto3 packed encoding. This is less space-efficient for numeric repeated fields but simpler to implement and sufficient for the current schema (repeated fields are primarily strings).

### Explicit Non-Goals

These are intentional design boundaries, not bugs:

- **No `.proto` text parser** — codecs are generated by `protoc-gen-luau` from proto definitions via protoc plugin, not from parsing `.proto` files at runtime
- **No unknown field preservation** — unknown fields are skipped and discarded per proto3 forward-compatibility semantics
- **No proto2 features** — no required fields, extensions, or groups
- **No cross-language interop testing** — round-trip testing is within Luau only; no validation against OCaml binary output
