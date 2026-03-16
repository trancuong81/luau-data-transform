# Protobuf Binary Encoding/Decoding — Design Spec

**Date:** 2026-03-17
**Spec:** protobuf-binary (spec 4 of luau-data-transform epic)
**Dependencies:** types-and-schema (completed)
**Branch:** feat/protobuf-binary

## Goal

Implement pure-Luau protobuf binary wire format encoding and decoding for all message types defined in the project's `.proto` files. Add binary round-trip tests matching the OCaml protobuf test suite.

## Approach

**Type-specific encode/decode functions** with hand-coded field descriptors. Each message type gets its own `encodePb*` and `decodePb*` function, mirroring the existing `encodeJson*/decodeJson*` pattern in the codebase. A schema registry provides dispatch by message name.

This mirrors the OCaml project's `ocaml-protoc` generated code and keeps each encode/decode function independently readable and debuggable.

## Module Architecture

```
lib/pb/
  wire.luau           -- Wire format primitives
  encoder.luau        -- Type-specific encode functions + public API
  decoder.luau        -- Type-specific decode functions + public API
  schema_registry.luau -- Message name → encode/decode dispatch
```

All modules use `--!strict` mode.

## Module 1: Wire Format Primitives (`lib/pb/wire.luau`)

Low-level protobuf wire format operations using Luau's `buffer` library and `bit32`.

### Wire Type Constants

```
VARINT = 0            -- int32, int64, bool, enum
FIXED64 = 1           -- double, fixed64
LENGTH_DELIMITED = 2  -- string, bytes, nested messages, repeated, maps
FIXED32 = 3           -- float, fixed32
```

### WriteBuf

Growable buffer for encoding. Wraps a `buffer` with a write cursor and auto-resize.

- `WriteBuf.new(initialSize: number?) -> WriteBuf` — Default 256 bytes
- `WriteBuf:ensure(bytes: number)` — Grow (double) if needed
- `WriteBuf:tostring() -> string` — Extract final binary as Luau string

### Encoding Functions

| Function | Purpose |
|----------|---------|
| `encodeVarint(wb: WriteBuf, value: number)` | Unsigned varint (7 bits per byte, MSB continuation) |
| `encodeZigzag(n: number) -> number` | Signed → unsigned: `bit32.bxor(bit32.lshift(n, 1), bit32.arshift(n, 31))` |
| `encodeFixed32(wb: WriteBuf, value: number)` | 4 bytes little-endian |
| `encodeFixed64(wb: WriteBuf, value: number)` | 8 bytes little-endian via `buffer.writef64` |
| `encodeTag(wb: WriteBuf, fieldNumber: number, wireType: number)` | `encodeVarint(wb, bit32.bor(bit32.lshift(fieldNumber, 3), wireType))` |
| `encodeString(wb: WriteBuf, str: string)` | Length-prefixed UTF-8 |
| `encodeDouble(wb: WriteBuf, value: number)` | IEEE 754 64-bit little-endian via `buffer.writef64` |

### Decoding Functions

All take `(buf: buffer, offset: number)` and return `(value, newOffset: number)`.

| Function | Purpose |
|----------|---------|
| `decodeVarint(buf, offset) -> (number, number)` | Read unsigned varint |
| `decodeZigzag(n: number) -> number` | Unsigned → signed |
| `decodeFixed32(buf, offset) -> (number, number)` | Read 4 bytes little-endian |
| `decodeFixed64(buf, offset) -> (number, number)` | Read 8 bytes little-endian |
| `decodeTag(buf, offset) -> (fieldNumber: number, wireType: number, newOffset: number)` | Parse field tag |
| `decodeString(buf, offset) -> (string, number)` | Read length-prefixed string |
| `decodeDouble(buf, offset) -> (number, number)` | Read IEEE 754 64-bit |
| `skipField(buf, offset, wireType) -> number` | Skip unknown field |

### Design Decisions

- **`buffer` over string.byte/char**: `buffer` provides direct memory access with typed read/write operations. More efficient and clearer intent than string manipulation.
- **Stateless offset-passing**: All functions take `(buf, offset)` and return `newOffset`. No internal cursor state — simpler to reason about and compose.
- **WriteBuf for encoding**: Protobuf messages have variable length (varints, nested messages). A growable buffer avoids pre-calculating sizes.
- **Double encoding**: Uses `buffer.writef64`/`buffer.readf64` which gives IEEE 754 little-endian directly — matching protobuf's `Bits64` wire type for `double` fields.

## Module 2: Encoder (`lib/pb/encoder.luau`)

Type-specific encode functions. One per message type.

### Encoding Pattern

For each message type:
1. For each field present in the Luau table:
   a. Encode field tag (`fieldNumber`, `wireType`)
   b. Encode value (varint, fixed64, string, or nested message)
2. Repeated fields: encode each element with the same tag
3. Nested messages: encode into temporary WriteBuf, write as length-delimited bytes
4. Map fields: each entry encoded as a nested message with field 1=key, field 2=value
5. Oneofs: dispatch by `typeId` to determine field number and encoder

### Function Inventory

**Simple types (6):**
- `encodePbStringType(wb, value)` — Fields: 1=typeId, 2=value, 3=regex, 4=formatPatterns(repeated)
- `encodePbNumberType(wb, value)` — Fields: 1=typeId, 2=value(double), 3=decimalPlaces(varint), 4=minValue(double), 5=maxValue(double)
- `encodePbBooleanType(wb, value)` — Fields: 1=typeId, 2=value(varint/bool)
- `encodePbEnumType(wb, value)` — Fields: 1=typeId, 2=value, 3=options(repeated)
- `encodePbMultipleCheckboxType(wb, value)` — Fields: 1=typeId, 2=selectedKeys(repeated), 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)
- `encodePbRadioGroupType(wb, value)` — Fields: 1=typeId, 2=selectedKey, 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)

**Compound types (15):**
Each compound type has a SubFields encoder and a wrapper encoder. All wrappers share the same structure (typeId=1, valueSubFields=2, subFieldKeysInOrder=3, label=4), so a shared helper `encodeCompoundWrapper(wb, value, subFieldsEncoder)` reduces repetition.

SubFields encoders: `encodePbPhoneFaxSubFields`, `encodePbDateTimeSubFields`, `encodePbMoneySubFields`, `encodePbAddressSubFields`, `encodePbIndividualNameSubFields`, `encodePbCountrySubFields`, `encodePbBaseContactSubFields`, `encodePbSubmissionContactSubFields`, `encodePbSignatorySubFields`, `encodePbBankInfoSubFields`, `encodePbBankAccountInfoSubFields`, `encodePbWireInstructionsSubFields`, `encodePbBrokerageFirmSubFields`, `encodePbBrokerageAccountSubFields`, `encodePbServiceContactPointSubFields`

Wrapper encoders: `encodePbPhoneFaxType`, ..., `encodePbServiceContactPointType` (each a one-liner calling the shared helper)

**Union types:**
- `encodePbNonCustomFieldValue(wb, value)` — Inspects `typeId`, maps to field number (1-21), encodes as nested message
- `encodePbSingleFieldType(wb, value)` — Inspects `value.typeId` if present, maps to field number (1-22), encodes value as nested + label as field 23

**Custom compound:**
- `encodePbCustomCompoundType(wb, value)` — Fields: 1=typeId, 2=map<string, NonCustomFieldValue>, 3=subFieldKeysInOrder(repeated), 4=label

**Table schema:**
- `encodePbFieldGroup(wb, value)` — Fields: 1=label, 2=startIdx(varint), 3=endIdx(varint)
- `encodePbTableSchema(wb, value)` — Fields: 1=map<string, SingleFieldType>, 2=fieldKeysInOrder(repeated), 3=label, 4=groups(repeated nested)

**Source/Target tables:**
- `encodePbLpSignatoryFields`, `encodePbLpSignatoryType`, `encodePbW9Fields`, `encodePbW9Type`
- `encodePbSourceTableFieldsMap`, `encodePbSourceTableSchema`
- `encodePbTargetTableFieldsMap`, `encodePbTargetTableSchema`

### Public API

```lua
function Encoder.encode(messageType: string, data: table): string
```

Creates a WriteBuf, dispatches to the appropriate `encodePb*` function, returns `wb:tostring()`.

### Optional Field Handling

Fields are only encoded if present (not nil). This matches protobuf3 semantics where default values are not serialized on the wire. For strings, empty string `""` is treated as default and omitted. For numbers, `0` is default and omitted. For bools, `false` is default and omitted. For repeated fields, empty arrays are omitted.

## Module 3: Decoder (`lib/pb/decoder.luau`)

Type-specific decode functions. One per message type, mirroring the encoder.

### Decoding Pattern

For each message type:
1. Create default instance using existing `make*` constructor
2. Loop until end of buffer segment:
   a. Read field tag → `(fieldNumber, wireType)`
   b. Match `fieldNumber` to known field → decode value, set on result
   c. Repeated field → append to array
   d. Unknown field → skip by wireType
3. Return result table

### Function Inventory

Mirrors the encoder exactly: `decodePbStringType`, `decodePbNumberType`, ..., `decodePbTargetTableSchema`.

### Oneof Decoding

For `SingleFieldType` and `NonCustomFieldValue`, the field number determines the variant:
- Field 1 → decode as StringType
- Field 2 → decode as NumberType
- ...
- Field 22 → decode as CustomCompoundType (SingleFieldType only)

The decoder reads the field number, delegates to the appropriate type-specific decoder on the nested bytes.

### Map Decoding

For `map<string, SingleFieldType>` (TableSchema) and `map<string, NonCustomFieldValue>` (CustomCompoundType):
- Each map entry is a length-delimited message with field 1=key(string), field 2=value(nested message)
- Decoder reads entries and inserts `key → decoded_value` into the result table

### Public API

```lua
function Decoder.decode(messageType: string, bytes: string): table
```

Creates a buffer from the string, dispatches to the appropriate `decodePb*` function.

## Module 4: Schema Registry (`lib/pb/schema_registry.luau`)

Dispatch layer mapping message type names to encode/decode function pairs.

### Structure

```lua
local registry: {[string]: {
  encode: (WriteBuf, any) -> (),
  decode: (buffer, number, number) -> any,
}}
```

All ~30 message types pre-registered at module load time. No runtime registration API needed.

### Public API

```lua
function SchemaRegistry.encode(messageType: string, data: table): string
function SchemaRegistry.decode(messageType: string, bytes: string): table
```

Looks up message type in registry, delegates to encode/decode. Errors on unknown message type.

## Tests (`test/test_protobuf_binary.luau`)

Five test cases using the existing test runner:

### Test 1: StringType binary round-trip

Create a Ssn StringType with:
- typeId = "Ssn"
- value = "123-45-6789"
- regex = "^\\d{3}-\\d{2}-\\d{4}$"
- formatPatterns = {"000-00-0000"}

Encode to binary via `SchemaRegistry.encode("StringType", data)`, decode back via `SchemaRegistry.decode("StringType", bytes)`, verify all fields match with `toEqual`.

### Test 2: MultipleCheckboxType binary round-trip

Create with:
- typeId = "MultipleCheckboxType"
- selectedKeys = {"key1", "key2", "key3"}
- allOptionKeysInOrder = {"key1", "key2", "key3"}
- allOptionLabelsInOrder = {"Label 1", "Label 2", "Label 3"}

Encode → decode → verify arrays match.

### Test 3: AddressType binary round-trip

Create compound type with nested AddressSubFields containing a city StringType sub-field. Encode → decode → verify nested field access works correctly.

### Test 4: TableSchema binary round-trip

Create a TableSchema with `map<string, SingleFieldType>` containing multiple entries (at least one StringType and one MultipleCheckboxType variant). Encode → decode → verify map entries and oneof variant preservation.

### Test 5: JSON-then-binary interop

1. Load `test/fixtures/values.json` using `fs.readFile` + `serde.decode`
2. Decode JSON into typed Luau SourceTableFieldsMap via existing `decodeJsonSourceTableFieldsMap`
3. Encode to protobuf binary via `SchemaRegistry.encode("SourceTableFieldsMap", data)`
4. Decode binary back via `SchemaRegistry.decode("SourceTableFieldsMap", bytes)`
5. Verify decoded result equals original with `toEqual`

## Field Number Reference

All field numbers are sequential from 1, defined in the `.proto` files in `proto/`. Key mappings:

- **Simple/Compound types**: Field 1 = typeId, remaining fields type-specific
- **Compound wrappers**: 1=typeId, 2=valueSubFields, 3=subFieldKeysInOrder, 4=label
- **SingleFieldType oneof**: Fields 1-22 map to type variants, field 23=label
- **NonCustomFieldValue oneof**: Fields 1-21 map to type variants
- **TableSchema**: 1=fieldsMap(map), 2=fieldKeysInOrder, 3=label, 4=groups
- **Map entries**: implicit message with 1=key, 2=value

## Non-Goals

- No .proto text parser (hand-coded descriptors only)
- No proto3 packed repeated encoding (use standard repeated tag-per-element)
- No unknown field preservation (skip and discard)
- No protobuf2 features (required fields, extensions, groups)
- No cross-language interop testing with OCaml binary output (round-trip within Luau only)
