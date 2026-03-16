# Types and Schema Design Spec

**Spec:** types-and-schema (epic: luau-data-transform)
**Date:** 2026-03-16
**Status:** Approved
**Dependencies:** project-setup (completed)

## Goal

Define all protobuf-equivalent Luau types and implement schema loading from JSON constants files. Port `schema.ml` functionality. This is the type foundation for the transform engine and protobuf binary specs.

## Module Structure

| Module | Responsibility |
|---|---|
| `lib/data_types.luau` | 6 simple + 15 compound type definitions, constructors, JSON encode/decode |
| `lib/table_schema.luau` | `SingleFieldType`, `FieldGroup`, `TableSchema` types, constructors, JSON codec |
| `lib/source_table.luau` | `LpSignatoryType`, `W9Type`, `SourceTableFieldsMap`, `SourceTableSchema`, JSON codec |
| `lib/target_table.luau` | `TargetTableFieldsMap`, `TargetTableSchema`, JSON codec |
| `lib/schema.luau` | Schema loading (`loadDataTypeConstants`, `loadSourceTableSchema`, `loadTargetTableSchema`), `TypeConstants` type, `snakeToCamel` utility |

## Design Decisions

### 1. Union types: duck-typed on `typeId`

Luau lacks sum types. Since every type already carries a `typeId` field, we dispatch on it at runtime. No wrapper/tag overhead. We define a `FieldValue` type alias for documentation:

```lua
export type FieldValue = {
    typeId: string,
    [string]: any,
}
```

### 2. Constructor functions: config table pattern

OCaml uses optional named parameters. Luau equivalent is a config table with optional fields:

```lua
function DataTypes.makeStringType(config: {
    typeId: string?,
    value: string?,
    regex: string?,
    formatPatterns: {string}?,
}?): StringType
```

All fields optional with defaults (empty string for typeId/value, nil for optional fields, empty table for lists).

### 3. Field naming: camelCase everywhere

Internal Luau field names use camelCase (idiomatic for Luau, matches proto JSON encoding). The `snake_case` keys in constants files are converted on load via `snakeToCamel`.

### 4. JSON format: flat tables with `typeId`, not proto oneof wrappers

Our JSON constants files are hand-authored, not proto-serialized. They use a flat structure where every value has a `typeId` field directly:

```json
{ "typeId": "String", "value": "hello" }
{ "typeId": "Money", "valueSubFields": { "amount": {...} } }
```

This is NOT the proto JSON encoding (which uses oneof wrapper keys like `{"stringType": {...}}`). All our encode/decode functions work with this flat `typeId`-dispatched format. Proto binary wire format is deferred to spec 4.

### 5. Dual `label` fields

`SingleFieldType.label` is the field label in the table schema (e.g., "Commitment Amount"). Compound types like `MoneyType` also have a `label` field which is the display label for the compound value itself. These are distinct and both preserved in encode/decode.

## Type Definitions

### Simple Types (6)

#### StringType
```lua
export type StringType = {
    typeId: string,
    value: string,
    regex: string?,
    formatPatterns: {string},
}
```
Covers 21 CUE types: String, Ssn, Ein, Aba, Itin, Swift, Iban, Giin, UsZip, Email, PhoneFaxString, IsoCountryCode, IsoCurrencyCode, CountryString, StateProvince, City, NumberAndStreet, PostalZipCode, MoneyString, DateTimeString, TimeZoneOffset.

#### NumberType
```lua
export type NumberType = {
    typeId: string,
    value: number,
    decimalPlaces: number,
    minValue: number?,
    maxValue: number?,
}
```
Covers: Integer, Float, Percentage, Year.

#### BooleanType
```lua
export type BooleanType = {
    typeId: string,
    value: boolean,
}
```

#### EnumType
```lua
export type EnumType = {
    typeId: string,
    value: string,
    options: {string},
}
```

#### MultipleCheckboxType
```lua
export type MultipleCheckboxType = {
    typeId: string,
    selectedKeys: {string},
    allOptionKeysInOrder: {string},
    allOptionLabelsInOrder: {string},
}
```

#### RadioGroupType
```lua
export type RadioGroupType = {
    typeId: string,
    selectedKey: string,
    allOptionKeysInOrder: {string},
    allOptionLabelsInOrder: {string},
}
```

### Compound Types (15)

Each compound type follows the SubFields + wrapper pattern. The wrapper always has: `typeId`, `valueSubFields`, `subFieldKeysInOrder`, `label`.

#### PhoneFaxType
```lua
export type PhoneFaxSubFields = {
    countryCode: StringType?,
    areaCode: StringType?,
    subscriberNumber: StringType?,
}
export type PhoneFaxType = {
    typeId: string,
    valueSubFields: PhoneFaxSubFields?,
    subFieldKeysInOrder: {string},
    label: string?,
}
```

#### DateTimeType
```lua
export type DateTimeSubFields = {
    epochMs: NumberType?,
    zoneOffset: StringType?,
}
```

#### MoneyType
```lua
export type MoneySubFields = {
    amount: NumberType?,
    isoCurrencyCode: StringType?,
}
```

#### AddressType
```lua
export type AddressSubFields = {
    numberAndStreet: StringType?,
    city: StringType?,
    stateProvince: StringType?,
    country: StringType?,
    postalZipCode: StringType?,
    fullAddress: StringType?,
}
```

#### IndividualNameType
```lua
export type IndividualNameSubFields = {
    prefixName: StringType?,
    firstName: StringType?,
    middleName: StringType?,
    lastName: StringType?,
    suffixName: StringType?,
    fullName: StringType?,
    preferredName: StringType?,
    jobTitle: StringType?,
}
```

#### CountryType
```lua
export type CountrySubFields = {
    countryName: StringType?,
    isoCountryCode: StringType?,
}
```

#### BaseContactType
```lua
export type BaseContactSubFields = {
    prefixName: StringType?,
    firstName: StringType?,
    middleName: StringType?,
    lastName: StringType?,
    suffixName: StringType?,
    fullName: StringType?,
    preferredName: StringType?,
    jobTitle: StringType?,
    email: StringType?,
    phone: StringType?,
    fax: StringType?,
}
```

#### SubmissionContactType
```lua
export type SubmissionContactSubFields = {
    -- BaseContact fields (11)
    prefixName: StringType?,
    firstName: StringType?,
    middleName: StringType?,
    lastName: StringType?,
    suffixName: StringType?,
    fullName: StringType?,
    preferredName: StringType?,
    jobTitle: StringType?,
    email: StringType?,
    phone: StringType?,
    fax: StringType?,
    -- Submission-specific fields (23)
    typeOfCorrespondences: MultipleCheckboxType?,
    contactTypes: MultipleCheckboxType?,
    contactRoles: MultipleCheckboxType?,
    customId: StringType?,
    addressNumberAndStreet: StringType?,
    addressCity: StringType?,
    addressStateProvince: StringType?,
    addressCountry: StringType?,
    addressPostalZipCode: StringType?,
    addressFullAddress: StringType?,
    relationshipWithPrimary: StringType?,
    occupation: StringType?,
    companyName: StringType?,
    companyAddressNumberAndStreet: StringType?,
    companyAddressCity: StringType?,
    companyAddressStateProvince: StringType?,
    companyAddressCountry: StringType?,
    companyAddressPostalZipCode: StringType?,
    companyAddressFullAddress: StringType?,
    specifiedCompanyOrgUnit: StringType?,
    individualEmail: StringType?,
    individualPhone: StringType?,
    individualFax: StringType?,
}
```

#### SignatoryType
```lua
export type SignatorySubFields = {
    numberAndStreet: StringType?,
    city: StringType?,
    stateProvince: StringType?,
    country: StringType?,
    postalZipCode: StringType?,
    fullAddress: StringType?,
    name: StringType?,
    date: StringType?,
    title: StringType?,
    phone: StringType?,
    email: StringType?,
    signerRole: StringType?,
}
```

#### BankInfoType
```lua
export type BankInfoSubFields = {
    bankName: StringType?,
    bankLocation: StringType?,
    aba: StringType?,
    swift: StringType?,
}
```

#### BankAccountInfoType
```lua
export type BankAccountInfoSubFields = {
    bankName: StringType?,
    bankLocation: StringType?,
    aba: StringType?,
    swift: StringType?,
    accountName: StringType?,
    accountNumber: StringType?,
    iban: StringType?,
    furtherCreditName: StringType?,
    furtherCreditAccount: StringType?,
    correspondentBankAccount: StringType?,
}
```

#### WireInstructionsType
```lua
export type WireInstructionsSubFields = {
    bankName: StringType?,
    bankLocation: StringType?,
    aba: StringType?,
    swift: StringType?,
    accountName: StringType?,
    accountNumber: StringType?,
    iban: StringType?,
    furtherCreditName: StringType?,
    furtherCreditAccount: StringType?,
    correspondentBankAccount: StringType?,
    attention: StringType?,
}
```

#### BrokerageFirmType
```lua
export type BrokerageFirmSubFields = {
    firmName: StringType?,
    firmOfficeBranchLocation: StringType?,
}
```

#### BrokerageAccountType
```lua
export type BrokerageAccountSubFields = {
    firmName: StringType?,
    firmOfficeBranchLocation: StringType?,
    dtcNumber: StringType?,
    crestParticipantId: StringType?,
    bicCode: StringType?,
    beneficiaryAccountNumber: StringType?,
    beneficiaryAccountName: StringType?,
    intermediaryAccountName: StringType?,
    intermediaryAccountNumber: StringType?,
    intermediaryBicCode: StringType?,
    securitiesSettlementInstructions: StringType?,
    attention: StringType?,
}
```

#### ServiceContactPointType
```lua
export type ServiceContactPointSubFields = {
    name: StringType?,
    officeBranchLocation: StringType?,
    phone: StringType?,
    email: StringType?,
}
```

### CustomCompoundType

```lua
export type CustomCompoundType = {
    typeId: string,
    valueSubFields: {[string]: FieldValue}?,
    subFieldKeysInOrder: {string},
    label: string?,
}
```

`FieldValue` is the union of all non-custom field types, dispatched on `typeId`.

### Table Schema Types

```lua
-- lib/table_schema.luau
export type SingleFieldType = {
    value: FieldValue?,
    label: string,
}

export type FieldGroup = {
    label: string,
    startIdx: number,
    endIdx: number,
}

export type TableSchema = {
    fieldsMap: {[string]: SingleFieldType},
    fieldKeysInOrder: {string},
    label: string,
    groups: {FieldGroup},
}
```

Note: OCaml uses `(string * SingleFieldType) list` for `fieldsMap` (ordered list of pairs). In Luau we use a `{[string]: SingleFieldType}` dictionary since ordering is provided by `fieldKeysInOrder`. This simplifies lookups.

### Source Table Types

```lua
-- lib/source_table.luau
export type LpSignatoryFields = {
    asaCommitmentAmount: StringType?,
    individualSubscribernameSignaturepage: StringType?,
    entityAuthorizednameSignaturepage: StringType?,
}

export type LpSignatoryType = {
    typeId: string,
    valueSubFields: LpSignatoryFields?,
    subFieldKeysInOrder: {string},
    label: string?,
}

export type W9Fields = {
    w9PartiSsn1: StringType?,
    w9PartiEin1: StringType?,
    w9Line2: StringType?,
}

export type W9Type = {
    typeId: string,
    valueSubFields: W9Fields?,
    subFieldKeysInOrder: {string},
    label: string?,
}

export type SourceTableFieldsMap = {
    lpSignatory: LpSignatoryType?,
    asaFullnameInvestornameAmlquestionnaire: StringType?,
    asaFullnameInvestornameGeneralinfo1: StringType?,
    luxsentityRegulatedstatusPart2Duediligencequestionnaire: MultipleCheckboxType?,
    indiInternationalsupplementsPart1Duediligencequestionnaire: MultipleCheckboxType?,
    entityInternationalsupplementsPart1Duediligencequestionnaire: MultipleCheckboxType?,
    w9: W9Type?,
}

export type SourceTableSchema = {
    fieldsMap: SourceTableFieldsMap?,
    fieldKeysInOrder: {string},
    label: string,
}
```

### Target Table Types

```lua
-- lib/target_table.luau
export type TargetTableFieldsMap = {
    sfAgreementNullCommitmentC: MoneyType?,
    sfAccountSubscriptionInvestorName: StringType?,
    sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC: RadioGroupType?,
    sfAgreementNullWlcInternationalSupplementsC: MultipleCheckboxType?,
    sfAgreementNullSignerFirstName: StringType?,
    sfAgreementNullSignerMiddleName: StringType?,
    sfAgreementNullSignerLastName: StringType?,
    sfTaxFormW9UsTinTypeC: RadioGroupType?,
}

export type TargetTableSchema = {
    fieldsMap: TargetTableFieldsMap?,
    fieldKeysInOrder: {string},
    label: string,
}
```

## Schema Loading

### TypeConstants

```lua
-- lib/schema.luau
export type TypeConstants = {
    typeId: string,
    regex: string?,
    formatPatterns: {string},
    options: {string},
    minValue: number?,
    maxValue: number?,
    subFieldKeysInOrder: {string},
}
```

### Loading Functions

```lua
function Schema.loadDataTypeConstants(): {[string]: TypeConstants}
```
Reads `proto/data_types_constants.json` via `fs.readFile` + `serde.decode("json", ...)`. The JSON already uses camelCase keys (e.g., `typeId`, `formatPatterns`, `subFieldKeysInOrder`), so no `snakeToCamel` conversion is needed. **Exception:** the JSON uses short keys `"min"` and `"max"` for min/max values, which must be mapped to `minValue` and `maxValue` in the `TypeConstants` Luau type. Returns a map of 47 type entries keyed by typeId.

```lua
function Schema.loadSourceTableSchema(): SourceTableSchema
```
Reads `proto/tables/source_table_constants.json`, applies `snakeToCamel` recursively to all keys, then decodes into typed `SourceTableSchema`. The decode must dispatch on `typeId` to construct the correct field types within `fieldsMap`.

```lua
function Schema.loadTargetTableSchema(): TargetTableSchema
```
Same pattern as source, reading `proto/tables/target_table_constants.json`.

### Helper Functions

```lua
function Schema.findTypeConstants(constants: {[string]: TypeConstants}, typeId: string): TypeConstants?
function Schema.hasRegex(tc: TypeConstants): boolean
function Schema.typeCount(constants: {[string]: TypeConstants}): number
```

### snakeToCamel Utility

```lua
function Schema.snakeToCamel(s: string): string
```
Converts `snake_case` to `lowerCamelCase`. Applied recursively to all JSON object keys when loading table constants (mirroring OCaml's `camelcase_keys`).

## JSON Encode/Decode

### What "JSON codec" means in this spec

Since we use Lune's `serde.decode("json", ...)` which returns Luau tables, our "decode" functions convert from those raw tables to our typed structures. Our "encode" functions convert typed structures back to tables suitable for `serde.encode("json", ...)`.

**All decode functions expect camelCase keys.** The `snakeToCamel` conversion is applied upstream by the `load*` functions in `schema.luau` before passing the raw table to any decode function. JSON round-trip tests naturally produce camelCase since the encode functions output camelCase keys.

### Key functions

```lua
-- lib/data_types.luau
function DataTypes.encodeJsonStringType(st: StringType): {[string]: any}
function DataTypes.decodeJsonStringType(json: {[string]: any}): StringType
-- (similar for all 6 simple + 15 compound types)

-- lib/source_table.luau
function SourceTable.decodeJsonSourceTableFieldsMap(json: {[string]: any}): SourceTableFieldsMap
function SourceTable.encodeJsonSourceTableFieldsMap(fm: SourceTableFieldsMap): {[string]: any}
function SourceTable.decodeJsonSourceTableSchema(json: {[string]: any}): SourceTableSchema

-- lib/target_table.luau
function TargetTable.decodeJsonTargetTableFieldsMap(json: {[string]: any}): TargetTableFieldsMap
function TargetTable.encodeJsonTargetTableFieldsMap(fm: TargetTableFieldsMap): {[string]: any}
function TargetTable.decodeJsonTargetTableSchema(json: {[string]: any}): TargetTableSchema

-- lib/table_schema.luau
function TableSchema.encodeJsonSingleFieldType(sft: SingleFieldType): {[string]: any}
function TableSchema.decodeJsonSingleFieldType(json: {[string]: any}): SingleFieldType
function TableSchema.encodeJsonTableSchema(ts: TableSchema): {[string]: any}
function TableSchema.decodeJsonTableSchema(json: {[string]: any}): TableSchema
```

### Dispatch on typeId

Our JSON uses the flat `typeId`-dispatched format (see Design Decision 4), not proto oneof wrappers. Decode functions examine `typeId` directly:

```lua
-- In decodeJsonSingleFieldType:
local typeId = json.value and json.value.typeId
if typeId == "String" or typeId == "Ssn" or ... then
    field.value = DataTypes.decodeJsonStringType(json.value)
elseif typeId == "Money" then
    field.value = DataTypes.decodeJsonMoneyType(json.value)
...
```

For `CustomCompoundType.valueSubFields`, each sub-field value also uses the flat format with `typeId`. The decode iterates over the map and dispatches each value by its `typeId` — same dispatch logic as `SingleFieldType`.

For source/target table schemas, since the fields are statically known, each field is decoded with the appropriate type-specific decoder directly (no runtime dispatch needed).

## Test Plan

### Test file: `test/test_schema.luau` (3 tests)

**test_load_data_type_constants:**
- Load constants, verify 47 types
- Find "Ssn", verify it has regex
- Verify `hasRegex` returns true for Ssn

**test_load_source_table_schema:**
- Load schema, verify label = "subdoc"
- Verify 7 field keys
- Check `asaFullnameInvestornameGeneralinfo1` has typeId "String"
- Check `lpSignatory` has typeId "CustomCompound" and 3 sub-field keys
- Check sub-field `asaCommitmentAmount` has typeId "String"
- Check checkbox field has 2 option keys and 2 option labels

**test_load_target_table_schema:**
- Load schema, verify label = "target"
- Verify 8 field keys
- Check commitment field has typeId "Money"
- Check tin type field has typeId "RadioGroup" with options ["SSN", "EIN"]
- Check signer first name has typeId "String"
- Check international supplements has 6 option keys

### Test file: `test/test_protobuf_json.luau` (5 tests)

These adapt the OCaml protobuf tests as JSON round-trips (binary deferred to spec 4). The OCaml originals test binary protobuf encoding; here we verify JSON encode/decode preserves all fields.

**test_string_type_json_roundtrip (Ssn):**
- Create StringType with typeId="Ssn", value="123-45-6789", regex, formatPatterns
- Encode to JSON table, decode back, verify all fields match
- (Adapted from OCaml's `test_string_type_binary_roundtrip`)

**test_string_type_json_roundtrip (Email):**
- Create StringType with typeId="Email", value="test@example.com"
- Encode, decode, verify typeId and value
- (Direct port of OCaml's `test_string_type_json_roundtrip`)

**test_multiple_checkbox_json_roundtrip:**
- Create MultipleCheckboxType with selectedKeys, allOptionKeysInOrder, allOptionLabelsInOrder
- Encode, decode, verify selectedKeys list matches

**test_address_json_roundtrip:**
- Create AddressType with city sub-field (StringType "Springfield")
- Encode, decode, verify typeId, city value, subFieldKeysInOrder

**test_table_schema_json_roundtrip:**
- Create TableSchema with one StringType field
- Encode, decode, verify label, fieldsMap length, field key, field label, string value

## Interface Contract

This spec exports (consumed by transform-engine and protobuf-binary):

- `lib/data_types.luau`: All type definitions (`StringType`, `NumberType`, `BooleanType`, `EnumType`, `MultipleCheckboxType`, `RadioGroupType`, all 15 compound types + `CustomCompoundType`, `FieldValue`). Constructor functions (`makeStringType`, etc.). JSON encode/decode per type.
- `lib/table_schema.luau`: `SingleFieldType`, `FieldGroup`, `TableSchema`. Constructors and JSON codec.
- `lib/source_table.luau`: `LpSignatoryFields/Type`, `W9Fields/Type`, `SourceTableFieldsMap`, `SourceTableSchema`. Constructors and JSON codec.
- `lib/target_table.luau`: `TargetTableFieldsMap`, `TargetTableSchema`. Constructors and JSON codec.
- `lib/schema.luau`: `TypeConstants`, `loadDataTypeConstants()`, `loadSourceTableSchema()`, `loadTargetTableSchema()`, `findTypeConstants()`, `hasRegex()`, `typeCount()`, `snakeToCamel()`.

## Luau-Specific Considerations

- `--!strict` at top of every file
- Use `~=` for not-equal, `..` for string concat, `#t` for table length
- Tables are 1-based; string lists from JSON will be 1-based arrays naturally
- `type()` returns lowercase strings: "string", "number", "table", "boolean", "nil"
- Optional fields represented as `T?` (nilable) in type annotations
- Modules return a table at end of file: `return DataTypes`
- Use `string.byte`/`string.char` for character manipulation in `snakeToCamel`
- Deep equality is reference-based for tables; use test runner's `toEqual` for assertions
