# luau-data-transform

![Luau](https://img.shields.io/badge/Luau-strict_mode-blue)
![Runtime](https://img.shields.io/badge/runtime-Lune_v0.10+-green)
![Tests](https://img.shields.io/badge/tests-57%2F57_passing-brightgreen)

A type-safe data transformation pipeline in Luau, running on the [Lune](https://github.com/lune-org/lune) runtime. Ported from the OCaml reference implementation, it transforms data between source and target table schemas with 21 semantic types, 15 compound types, and dual serialization (JSON + Protobuf binary).

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
2. **Transforms data between schemas** — 6 concrete field mappings convert a 7-field source table (investor data) to an 8-field target table (Salesforce fields), with logic for name splitting, currency parsing, checkbox merging, and radio-group coercion.
3. **Serializes in two formats** — Full JSON and Protobuf binary codecs with symmetric encode/decode for all types.

The pipeline is designed for real-world scale: production tables have ~1000 fields, many requiring per-field options and constants. The type system and codec architecture support this through consistent patterns (constructor + encoder + decoder per type) and a `typeId`-based dispatch union.

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
# Run the full test suite (57 tests)
lune run test/test_main
```

Expected output:

```
[PASS] Wire format primitives        (15 tests)
[PASS] Data type JSON codecs         (8 tests)
[PASS] Schema loading                (3 tests)
[PASS] JSON path navigation          (4 tests)
[PASS] Transform utilities           (6 tests)
[PASS] Generic mappings              (2 tests)
[PASS] Example field mappings        (15 tests)
[PASS] Protobuf binary round-trips   (5 tests)

57 passed, 0 failed
```

**Run the CLI transformation:**

```bash
lune run bin/main test/fixtures/values.json
```

This reads a source JSON fixture, applies all 6 field mappings, and outputs the transformed target table as pretty-printed JSON.

## Project Structure

```
luau-data-transform/
├── bin/
│   └── main.luau                    CLI entry point (JSON in → transform → JSON out)
│
├── lib/                             Core library
│   ├── data_types.luau              6 simple + 15 compound type definitions, constructors, JSON codecs
│   ├── source_table.luau            Source schema types (LpSignatory, W9) + JSON codec
│   ├── target_table.luau            Target schema types (8 Salesforce fields) + JSON codec
│   ├── table_schema.luau            Generic TableSchema, SingleFieldType, FieldGroup wrappers
│   ├── schema.luau                  Schema loading from proto constants + snakeToCamel conversion
│   ├── example_mappings.luau        6 concrete field mapping transformations
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
├── test/
│   ├── test_main.luau               Test orchestrator (runs all suites)
│   ├── test_wire.luau               Wire format primitive tests (15)
│   ├── test_protobuf_binary.luau    Binary round-trip tests (5)
│   ├── test_protobuf_json.luau      JSON encoding/decoding tests
│   ├── test_schema.luau             Schema loading tests
│   ├── test_json_path.luau          Path navigation tests
│   ├── test_transform_utils.luau    Utility function tests
│   ├── test_mappings.luau           Generic mapping tests
│   ├── test_example_mappings.luau   Field mapping tests (15)
│   ├── test_integration.luau        Full pipeline integration test
│   └── fixtures/
│       ├── values.json              Sample source table data
│       └── transformed_values.json  Expected transformation output
│
├── proto/                           Protobuf definitions (source of truth, from OCaml repo)
│   ├── data_types.proto             Simple + compound type message definitions
│   ├── data_types_constants.json    Type metadata (regex patterns, options, field orders)
│   └── tables/
│       ├── source_table.proto
│       ├── source_table_constants.json
│       ├── target_table.proto
│       └── target_table_constants.json
│
├── docs/
│   └── specs/                       Design documents and implementation plans
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

**SourceTableFieldsMap** (7 fields) models investor onboarding data:
- `lpSignatory` — Custom compound: commitment amount, subscriber/entity names
- `w9` — Custom compound: SSN, EIN, Line 2
- 4 checkbox/string fields for regulatory questionnaires and investor names

**TargetTableFieldsMap** (8 fields) maps to Salesforce fields:
- Commitment (Money), investor name (String), regulated status (RadioGroup), international supplements (MultipleCheckbox), signer first/middle/last name (3x String), W9 TIN type (RadioGroup)

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

**Concrete field mappings** (`lib/example_mappings.luau`) — domain logic:

| Mapping | Logic |
|---------|-------|
| `mapCommitment` | Extract string amount → strip commas → parse as number → wrap in MoneyType |
| `mapInvestorName` | Coalesce AML questionnaire name, fallback to general info name |
| `mapRegulatedStatus` | Map `yes_*`/`no_*` checkbox keys → `"true"`/`"false"` RadioGroup |
| `mapInternationalSupplements` | Merge individual + entity supplement checkboxes through 12-entry lookup table |
| `mapSignerName` | Extract full name → split into first/middle/last via word boundaries |
| `mapW9TinType` | Detect SSN vs EIN based on W9 field presence and values |

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

```
                    ┌─────────────────────┐
                    │   values.json       │
                    │   (source fixture)  │
                    └─────────┬───────────┘
                              │ fs.readFile + serde.decode("json")
                              ▼
                    ┌─────────────────────┐
                    │ decodeJsonSource-   │
                    │ TableFieldsMap()    │  ← Type validation
                    └─────────┬───────────┘
                              │
                              ▼
              ┌───────────────────────────────┐
              │   ExampleMappings.transform() │
              │                               │
              │  1. mapCommitment      → Money │
              │  2. mapInvestorName    → String│
              │  3. mapRegulatedStatus → Radio │
              │  4. mapIntlSupplements → Check │
              │  5. mapSignerName  → 3×String  │
              │  6. mapW9TinType      → Radio │
              └───────────────┬───────────────┘
                              │
                              ▼
                    ┌─────────────────────┐
                    │ encodeJsonTarget-   │
                    │ TableFieldsMap()    │
                    └─────────┬───────────┘
                              │ serde.encode("json", ..., true)
                              ▼
                    ┌─────────────────────┐
                    │   stdout (JSON)     │
                    └─────────────────────┘
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

- **No `.proto` text parser** — codecs are hand-coded from proto definitions, not generated
- **No unknown field preservation** — unknown fields are skipped and discarded per proto3 forward-compatibility semantics
- **No proto2 features** — no required fields, extensions, or groups
- **No cross-language interop testing** — round-trip testing is within Luau only; no validation against OCaml binary output
