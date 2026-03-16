# Types and Schema Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Define all protobuf-equivalent Luau types, implement JSON encode/decode, and schema loading from JSON constants files.

**Architecture:** 5 Luau modules mirroring OCaml's generated code structure. Types use duck-typing on `typeId` for unions. JSON codec converts between Luau tables and the flat `typeId`-dispatched JSON format. Schema loading reads constants files with `snakeToCamel` key conversion.

**Tech Stack:** Luau language, Lune runtime, `@lune/fs` + `@lune/serde`

**Spec:** `docs/specs/2026-03-16-types-and-schema-design.md`

---

## File Map

| File | Action | Responsibility |
|---|---|---|
| `lib/data_types.luau` | Create | 6 simple + 15 compound + CustomCompound type defs, constructors, JSON codec, typeId dispatch |
| `lib/table_schema.luau` | Create | SingleFieldType, FieldGroup, TableSchema types, constructors, JSON codec |
| `lib/source_table.luau` | Create | LpSignatory, W9, SourceTableFieldsMap/Schema types, constructors, JSON codec |
| `lib/target_table.luau` | Create | TargetTableFieldsMap/Schema types, constructors, JSON codec |
| `lib/schema.luau` | Create | TypeConstants, snakeToCamel, camelcaseKeys, load functions, helpers |
| `test/test_protobuf_json.luau` | Create | 5 JSON round-trip tests |
| `test/test_schema.luau` | Create | 3 schema loading tests |
| `test/test_main.luau` | Modify | Wire in new test files |

---

## Chunk 1: Core Types and Round-Trip Tests

## Task 1: Simple type definitions, constructors, and JSON codec

**Files:**
- Create: `lib/data_types.luau`

**Depends on:** None

This task creates the `data_types` module with all 6 simple types. Each type gets: export type, constructor, JSON encode, JSON decode. Also includes the `decodeFieldValueByTypeId` dispatch function stub (completed in Task 2).

**Luau key reminders:** `--!strict` at top. `~=` for not-equal. `or` for defaults (not `||`). Tables use `{}` not `[]`. String interpolation uses backticks: `` `{var}` ``. Module = table returned at end. Use `string.byte`/`string.sub` for char ops. 1-based indexing.

- [ ] **Step 1: Write `lib/data_types.luau` with simple type definitions and codecs**

```lua
--!strict
local DataTypes = {}

-- ============================================================
-- Simple Type Definitions (6)
-- ============================================================

export type StringType = {
	typeId: string,
	value: string,
	regex: string?,
	formatPatterns: {string},
}

export type NumberType = {
	typeId: string,
	value: number,
	decimalPlaces: number,
	minValue: number?,
	maxValue: number?,
}

export type BooleanType = {
	typeId: string,
	value: boolean,
}

export type EnumType = {
	typeId: string,
	value: string,
	options: {string},
}

export type MultipleCheckboxType = {
	typeId: string,
	selectedKeys: {string},
	allOptionKeysInOrder: {string},
	allOptionLabelsInOrder: {string},
}

export type RadioGroupType = {
	typeId: string,
	selectedKey: string,
	allOptionKeysInOrder: {string},
	allOptionLabelsInOrder: {string},
}

-- ============================================================
-- Simple Type Constructors
-- ============================================================

function DataTypes.makeStringType(config: {
	typeId: string?,
	value: string?,
	regex: string?,
	formatPatterns: {string}?,
}?): StringType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		value = c.value or "",
		regex = c.regex,
		formatPatterns = c.formatPatterns or {},
	}
end

function DataTypes.makeNumberType(config: {
	typeId: string?,
	value: number?,
	decimalPlaces: number?,
	minValue: number?,
	maxValue: number?,
}?): NumberType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		value = c.value or 0,
		decimalPlaces = c.decimalPlaces or 0,
		minValue = c.minValue,
		maxValue = c.maxValue,
	}
end

function DataTypes.makeBooleanType(config: {
	typeId: string?,
	value: boolean?,
}?): BooleanType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		value = if c.value ~= nil then c.value else false,
	}
end

function DataTypes.makeEnumType(config: {
	typeId: string?,
	value: string?,
	options: {string}?,
}?): EnumType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		value = c.value or "",
		options = c.options or {},
	}
end

function DataTypes.makeMultipleCheckboxType(config: {
	typeId: string?,
	selectedKeys: {string}?,
	allOptionKeysInOrder: {string}?,
	allOptionLabelsInOrder: {string}?,
}?): MultipleCheckboxType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		selectedKeys = c.selectedKeys or {},
		allOptionKeysInOrder = c.allOptionKeysInOrder or {},
		allOptionLabelsInOrder = c.allOptionLabelsInOrder or {},
	}
end

function DataTypes.makeRadioGroupType(config: {
	typeId: string?,
	selectedKey: string?,
	allOptionKeysInOrder: {string}?,
	allOptionLabelsInOrder: {string}?,
}?): RadioGroupType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		selectedKey = c.selectedKey or "",
		allOptionKeysInOrder = c.allOptionKeysInOrder or {},
		allOptionLabelsInOrder = c.allOptionLabelsInOrder or {},
	}
end

-- ============================================================
-- Simple Type JSON Encode/Decode
-- ============================================================

function DataTypes.encodeJsonStringType(st: StringType): {[string]: any}
	local result: {[string]: any} = {
		typeId = st.typeId,
		value = st.value,
	}
	if st.regex ~= nil then
		result.regex = st.regex
	end
	if #st.formatPatterns > 0 then
		result.formatPatterns = st.formatPatterns
	end
	return result
end

function DataTypes.decodeJsonStringType(json: {[string]: any}): StringType
	return {
		typeId = json.typeId or "",
		value = json.value or "",
		regex = json.regex,
		formatPatterns = json.formatPatterns or {},
	}
end

function DataTypes.encodeJsonNumberType(nt: NumberType): {[string]: any}
	local result: {[string]: any} = {
		typeId = nt.typeId,
		value = nt.value,
		decimalPlaces = nt.decimalPlaces,
	}
	if nt.minValue ~= nil then
		result.minValue = nt.minValue
	end
	if nt.maxValue ~= nil then
		result.maxValue = nt.maxValue
	end
	return result
end

function DataTypes.decodeJsonNumberType(json: {[string]: any}): NumberType
	return {
		typeId = json.typeId or "",
		value = json.value or 0,
		decimalPlaces = json.decimalPlaces or 0,
		minValue = json.minValue,
		maxValue = json.maxValue,
	}
end

function DataTypes.encodeJsonBooleanType(bt: BooleanType): {[string]: any}
	return {
		typeId = bt.typeId,
		value = bt.value,
	}
end

function DataTypes.decodeJsonBooleanType(json: {[string]: any}): BooleanType
	return {
		typeId = json.typeId or "",
		value = if json.value ~= nil then json.value else false,
	}
end

function DataTypes.encodeJsonEnumType(et: EnumType): {[string]: any}
	return {
		typeId = et.typeId,
		value = et.value,
		options = et.options,
	}
end

function DataTypes.decodeJsonEnumType(json: {[string]: any}): EnumType
	return {
		typeId = json.typeId or "",
		value = json.value or "",
		options = json.options or {},
	}
end

function DataTypes.encodeJsonMultipleCheckboxType(mc: MultipleCheckboxType): {[string]: any}
	return {
		typeId = mc.typeId,
		selectedKeys = mc.selectedKeys,
		allOptionKeysInOrder = mc.allOptionKeysInOrder,
		allOptionLabelsInOrder = mc.allOptionLabelsInOrder,
	}
end

function DataTypes.decodeJsonMultipleCheckboxType(json: {[string]: any}): MultipleCheckboxType
	return {
		typeId = json.typeId or "",
		selectedKeys = json.selectedKeys or {},
		allOptionKeysInOrder = json.allOptionKeysInOrder or {},
		allOptionLabelsInOrder = json.allOptionLabelsInOrder or {},
	}
end

function DataTypes.encodeJsonRadioGroupType(rg: RadioGroupType): {[string]: any}
	return {
		typeId = rg.typeId,
		selectedKey = rg.selectedKey,
		allOptionKeysInOrder = rg.allOptionKeysInOrder,
		allOptionLabelsInOrder = rg.allOptionLabelsInOrder,
	}
end

function DataTypes.decodeJsonRadioGroupType(json: {[string]: any}): RadioGroupType
	return {
		typeId = json.typeId or "",
		selectedKey = json.selectedKey or "",
		allOptionKeysInOrder = json.allOptionKeysInOrder or {},
		allOptionLabelsInOrder = json.allOptionLabelsInOrder or {},
	}
end

-- Compound types and typeId dispatch added in Task 2

return DataTypes
```

- [ ] **Step 2: Write initial JSON round-trip tests for simple types**

Create `test/test_protobuf_json.luau`:

```lua
--!strict
local T = require("@lib/test_runner")
local DataTypes = require("@lib/data_types")

T.describe("json roundtrip", function()
	T.it("StringType roundtrip (Ssn)", function()
		local original = DataTypes.makeStringType({
			typeId = "Ssn",
			value = "123-45-6789",
			regex = "^\\d{3}-\\d{2}-\\d{4}$",
			formatPatterns = { "000-00-0000" },
		})
		local json = DataTypes.encodeJsonStringType(original)
		local decoded = DataTypes.decodeJsonStringType(json)
		T.expect(decoded.typeId).toBe("Ssn")
		T.expect(decoded.value).toBe("123-45-6789")
		T.expect(decoded.regex).toBe("^\\d{3}-\\d{2}-\\d{4}$")
		T.expect(#decoded.formatPatterns).toBe(1)
		T.expect(decoded.formatPatterns[1]).toBe("000-00-0000")
	end)

	T.it("StringType roundtrip (Email)", function()
		local original = DataTypes.makeStringType({
			typeId = "Email",
			value = "test@example.com",
		})
		local json = DataTypes.encodeJsonStringType(original)
		local decoded = DataTypes.decodeJsonStringType(json)
		T.expect(decoded.typeId).toBe("Email")
		T.expect(decoded.value).toBe("test@example.com")
	end)

	T.it("MultipleCheckboxType roundtrip", function()
		local original = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = { "opt1", "opt3" },
			allOptionKeysInOrder = { "opt1", "opt2", "opt3" },
			allOptionLabelsInOrder = { "Option 1", "Option 2", "Option 3" },
		})
		local json = DataTypes.encodeJsonMultipleCheckboxType(original)
		local decoded = DataTypes.decodeJsonMultipleCheckboxType(json)
		T.expect(#decoded.selectedKeys).toBe(2)
		T.expect(decoded.selectedKeys[1]).toBe("opt1")
		T.expect(decoded.selectedKeys[2]).toBe("opt3")
	end)
end)
```

- [ ] **Step 3: Wire tests and run**

Update `test/test_main.luau` to include the new test file:

```lua
--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")
require("@test/test_protobuf_json")
T.run()
```

Run: `lune run test/test_main`

Expected:
```
[placeholder]
  PASS can read and parse JSON fixture

[json roundtrip]
  PASS StringType roundtrip (Ssn)
  PASS StringType roundtrip (Email)
  PASS MultipleCheckboxType roundtrip

Results: 4/4 passed, 0 failed
```

- [ ] **Step 4: Commit**

```bash
git add lib/data_types.luau test/test_protobuf_json.luau test/test_main.luau
git commit -m "feat: add simple data types with constructors, JSON codec, and roundtrip tests"
```

---

## Task 2: Compound type definitions, constructors, JSON codec, and typeId dispatch

**Files:**
- Modify: `lib/data_types.luau`
- Modify: `test/test_protobuf_json.luau`

**Depends on:** Task 1

Adds all 15 compound types (SubFields + wrapper), CustomCompoundType, the `FieldValue` type alias, and the `decodeFieldValueByTypeId` dispatch function. Each compound type follows the same pattern — representative examples are shown in full, remaining types listed with field definitions.

**Pattern for each compound type:**
1. `export type XxxSubFields = { field1: StringType?, ... }`
2. `export type XxxType = { typeId: string, valueSubFields: XxxSubFields?, subFieldKeysInOrder: {string}, label: string? }`
3. `DataTypes.makeXxxSubFields(config?) -> XxxSubFields`
4. `DataTypes.makeXxxType(config?) -> XxxType`
5. `DataTypes.encodeJsonXxxSubFields(sf) -> table`
6. `DataTypes.decodeJsonXxxSubFields(json) -> XxxSubFields`
7. `DataTypes.encodeJsonXxxType(t) -> table`
8. `DataTypes.decodeJsonXxxType(json) -> XxxType`

For SubFields encode/decode, each sub-field is a StringType (or occasionally NumberType/MultipleCheckboxType) that's encoded/decoded recursively.

- [ ] **Step 1: Add compound type definitions to `lib/data_types.luau`**

Insert before `return DataTypes`. Below shows the pattern with 3 representative types (PhoneFax, Money, Address). Apply the same pattern for all 15:

```lua
-- ============================================================
-- FieldValue type alias (duck-typed union on typeId)
-- ============================================================

export type FieldValue = {
	typeId: string,
	[string]: any,
}

-- ============================================================
-- Compound Type Definitions (15)
-- Each has SubFields + wrapper Type
-- ============================================================

-- Helper: encode/decode a StringType sub-field if present
local function encodeOptionalStringField(field: StringType?): {[string]: any}?
	if field == nil then
		return nil
	end
	return DataTypes.encodeJsonStringType(field)
end

local function decodeOptionalStringField(json: any): StringType?
	if json == nil then
		return nil
	end
	return DataTypes.decodeJsonStringType(json)
end

local function encodeOptionalNumberField(field: NumberType?): {[string]: any}?
	if field == nil then
		return nil
	end
	return DataTypes.encodeJsonNumberType(field)
end

local function decodeOptionalNumberField(json: any): NumberType?
	if json == nil then
		return nil
	end
	return DataTypes.decodeJsonNumberType(json)
end

local function encodeOptionalMultipleCheckboxField(field: MultipleCheckboxType?): {[string]: any}?
	if field == nil then
		return nil
	end
	return DataTypes.encodeJsonMultipleCheckboxType(field)
end

local function decodeOptionalMultipleCheckboxField(json: any): MultipleCheckboxType?
	if json == nil then
		return nil
	end
	return DataTypes.decodeJsonMultipleCheckboxType(json)
end

-- 1. PhoneFaxType
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

function DataTypes.makePhoneFaxSubFields(config: {
	countryCode: StringType?,
	areaCode: StringType?,
	subscriberNumber: StringType?,
}?): PhoneFaxSubFields
	local c = config or {}
	return {
		countryCode = c.countryCode,
		areaCode = c.areaCode,
		subscriberNumber = c.subscriberNumber,
	}
end

function DataTypes.makePhoneFaxType(config: {
	typeId: string?,
	valueSubFields: PhoneFaxSubFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): PhoneFaxType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function DataTypes.encodeJsonPhoneFaxSubFields(sf: PhoneFaxSubFields): {[string]: any}
	local result: {[string]: any} = {}
	result.countryCode = encodeOptionalStringField(sf.countryCode)
	result.areaCode = encodeOptionalStringField(sf.areaCode)
	result.subscriberNumber = encodeOptionalStringField(sf.subscriberNumber)
	return result
end

function DataTypes.decodeJsonPhoneFaxSubFields(json: {[string]: any}): PhoneFaxSubFields
	return {
		countryCode = decodeOptionalStringField(json.countryCode),
		areaCode = decodeOptionalStringField(json.areaCode),
		subscriberNumber = decodeOptionalStringField(json.subscriberNumber),
	}
end

function DataTypes.encodeJsonPhoneFaxType(t: PhoneFaxType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = DataTypes.encodeJsonPhoneFaxSubFields(t.valueSubFields)
	end
	return result
end

function DataTypes.decodeJsonPhoneFaxType(json: {[string]: any}): PhoneFaxType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then DataTypes.decodeJsonPhoneFaxSubFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

-- 2. DateTimeType
export type DateTimeSubFields = {
	epochMs: NumberType?,
	zoneOffset: StringType?,
}
export type DateTimeType = {
	typeId: string,
	valueSubFields: DateTimeSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}
-- Constructor/codec: same pattern. SubFields has epochMs (NumberType) and zoneOffset (StringType).
-- Use decodeOptionalNumberField for epochMs, decodeOptionalStringField for zoneOffset.

-- 3. MoneyType
export type MoneySubFields = {
	amount: NumberType?,
	isoCurrencyCode: StringType?,
}
export type MoneyType = {
	typeId: string,
	valueSubFields: MoneySubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}
-- Constructor/codec: amount uses NumberType, isoCurrencyCode uses StringType.

-- 4. AddressType
export type AddressSubFields = {
	numberAndStreet: StringType?,
	city: StringType?,
	stateProvince: StringType?,
	country: StringType?,
	postalZipCode: StringType?,
	fullAddress: StringType?,
}
export type AddressType = {
	typeId: string,
	valueSubFields: AddressSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}
-- Constructor/codec: all sub-fields are StringType.

-- 5. IndividualNameType
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
export type IndividualNameType = {
	typeId: string,
	valueSubFields: IndividualNameSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 6. CountryType
export type CountrySubFields = {
	countryName: StringType?,
	isoCountryCode: StringType?,
}
export type CountryType = {
	typeId: string,
	valueSubFields: CountrySubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 7. BaseContactType
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
export type BaseContactType = {
	typeId: string,
	valueSubFields: BaseContactSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 8. SubmissionContactType
export type SubmissionContactSubFields = {
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
export type SubmissionContactType = {
	typeId: string,
	valueSubFields: SubmissionContactSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}
-- Constructor/codec: 11 StringType + 3 MultipleCheckboxType + 20 StringType sub-fields.
-- Use encodeOptionalMultipleCheckboxField for typeOfCorrespondences, contactTypes, contactRoles.

-- 9. SignatoryType
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
export type SignatoryType = {
	typeId: string,
	valueSubFields: SignatorySubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 10. BankInfoType
export type BankInfoSubFields = {
	bankName: StringType?,
	bankLocation: StringType?,
	aba: StringType?,
	swift: StringType?,
}
export type BankInfoType = {
	typeId: string,
	valueSubFields: BankInfoSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 11. BankAccountInfoType
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
export type BankAccountInfoType = {
	typeId: string,
	valueSubFields: BankAccountInfoSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 12. WireInstructionsType
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
export type WireInstructionsType = {
	typeId: string,
	valueSubFields: WireInstructionsSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 13. BrokerageFirmType
export type BrokerageFirmSubFields = {
	firmName: StringType?,
	firmOfficeBranchLocation: StringType?,
}
export type BrokerageFirmType = {
	typeId: string,
	valueSubFields: BrokerageFirmSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 14. BrokerageAccountType
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
export type BrokerageAccountType = {
	typeId: string,
	valueSubFields: BrokerageAccountSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- 15. ServiceContactPointType
export type ServiceContactPointSubFields = {
	name: StringType?,
	officeBranchLocation: StringType?,
	phone: StringType?,
	email: StringType?,
}
export type ServiceContactPointType = {
	typeId: string,
	valueSubFields: ServiceContactPointSubFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}
```

**Implementation instructions for all 15 compound types:**

For each compound type, implement the same 4-function pattern shown for PhoneFaxType:
- `makeXxxSubFields(config?)` — returns SubFields with nil defaults
- `makeXxxType(config?)` — returns wrapper with empty string/table defaults
- `encodeJsonXxxSubFields(sf)` / `decodeJsonXxxSubFields(json)` — iterate each sub-field using the appropriate `encodeOptional*Field` / `decodeOptional*Field` helper
- `encodeJsonXxxType(t)` / `decodeJsonXxxType(json)` — encode/decode wrapper, delegating sub-fields to SubFields codec

**Sub-field type mapping** (which helper to use per sub-field):
- Most sub-fields are `StringType` → use `encodeOptionalStringField` / `decodeOptionalStringField`
- `DateTimeSubFields.epochMs` → use `encodeOptionalNumberField` / `decodeOptionalNumberField`
- `MoneySubFields.amount` → use `encodeOptionalNumberField` / `decodeOptionalNumberField`
- `SubmissionContactSubFields.typeOfCorrespondences`, `.contactTypes`, `.contactRoles` → use `encodeOptionalMultipleCheckboxField` / `decodeOptionalMultipleCheckboxField`

- [ ] **Step 2: Add CustomCompoundType and typeId dispatch**

Append to `lib/data_types.luau` before `return DataTypes`:

```lua
-- ============================================================
-- CustomCompoundType
-- ============================================================

export type CustomCompoundType = {
	typeId: string,
	valueSubFields: {[string]: FieldValue}?,
	subFieldKeysInOrder: {string},
	label: string?,
}

function DataTypes.makeCustomCompoundType(config: {
	typeId: string?,
	valueSubFields: {[string]: FieldValue}?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): CustomCompoundType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

-- ============================================================
-- typeId dispatch: decode any field value by its typeId
-- ============================================================

-- Set of typeIds that map to StringType
local STRING_TYPE_IDS: {[string]: boolean} = {
	String = true, Ssn = true, Ein = true, Aba = true, Itin = true,
	Swift = true, Iban = true, Giin = true, UsZip = true, Email = true,
	PhoneFaxString = true, IsoCountryCode = true, IsoCurrencyCode = true,
	CountryString = true, StateProvince = true, City = true,
	NumberAndStreet = true, PostalZipCode = true, MoneyString = true,
	DateTimeString = true, TimeZoneOffset = true,
}

-- Set of typeIds that map to NumberType
local NUMBER_TYPE_IDS: {[string]: boolean} = {
	Integer = true, Float = true, Percentage = true, Year = true,
}

-- Compound type typeId → codec function name mapping
local COMPOUND_TYPE_CODECS: {[string]: {decode: string, encode: string}} = {
	PhoneFax = { decode = "decodeJsonPhoneFaxType", encode = "encodeJsonPhoneFaxType" },
	DateTime = { decode = "decodeJsonDateTimeType", encode = "encodeJsonDateTimeType" },
	Money = { decode = "decodeJsonMoneyType", encode = "encodeJsonMoneyType" },
	Address = { decode = "decodeJsonAddressType", encode = "encodeJsonAddressType" },
	IndividualName = { decode = "decodeJsonIndividualNameType", encode = "encodeJsonIndividualNameType" },
	Country = { decode = "decodeJsonCountryType", encode = "encodeJsonCountryType" },
	BaseContact = { decode = "decodeJsonBaseContactType", encode = "encodeJsonBaseContactType" },
	SubmissionContact = { decode = "decodeJsonSubmissionContactType", encode = "encodeJsonSubmissionContactType" },
	Signatory = { decode = "decodeJsonSignatoryType", encode = "encodeJsonSignatoryType" },
	BankInfo = { decode = "decodeJsonBankInfoType", encode = "encodeJsonBankInfoType" },
	BankAccountInfo = { decode = "decodeJsonBankAccountInfoType", encode = "encodeJsonBankAccountInfoType" },
	WireInstructions = { decode = "decodeJsonWireInstructionsType", encode = "encodeJsonWireInstructionsType" },
	BrokerageFirm = { decode = "decodeJsonBrokerageFirmType", encode = "encodeJsonBrokerageFirmType" },
	BrokerageAccount = { decode = "decodeJsonBrokerageAccountType", encode = "encodeJsonBrokerageAccountType" },
	ServiceContactPoint = { decode = "decodeJsonServiceContactPointType", encode = "encodeJsonServiceContactPointType" },
}

-- Set of typeIds that map to EnumType
local ENUM_TYPE_IDS: {[string]: boolean} = {
	ShareClass = true, TransactionType = true, SubscriptionStatus = true,
}

function DataTypes.decodeFieldValueByTypeId(json: {[string]: any}): FieldValue
	local typeId = json.typeId or ""

	if STRING_TYPE_IDS[typeId] then
		return DataTypes.decodeJsonStringType(json) :: any
	elseif NUMBER_TYPE_IDS[typeId] then
		return DataTypes.decodeJsonNumberType(json) :: any
	elseif typeId == "Boolean" then
		return DataTypes.decodeJsonBooleanType(json) :: any
	elseif ENUM_TYPE_IDS[typeId] then
		return DataTypes.decodeJsonEnumType(json) :: any
	elseif typeId == "MultipleCheckbox" then
		return DataTypes.decodeJsonMultipleCheckboxType(json) :: any
	elseif typeId == "RadioGroup" then
		return DataTypes.decodeJsonRadioGroupType(json) :: any
	elseif typeId == "CustomCompound" or typeId == "CustomCompoundType" then
		return DataTypes.decodeJsonCustomCompoundType(json) :: any
	else
		local codec = COMPOUND_TYPE_CODECS[typeId]
		if codec then
			local decoder = (DataTypes :: any)[codec.decode]
			return decoder(json)
		end
		return json :: any
	end
end

function DataTypes.encodeFieldValueByTypeId(value: FieldValue): {[string]: any}
	local typeId = (value :: any).typeId or ""

	if STRING_TYPE_IDS[typeId] then
		return DataTypes.encodeJsonStringType(value :: any)
	elseif NUMBER_TYPE_IDS[typeId] then
		return DataTypes.encodeJsonNumberType(value :: any)
	elseif typeId == "Boolean" then
		return DataTypes.encodeJsonBooleanType(value :: any)
	elseif ENUM_TYPE_IDS[typeId] then
		return DataTypes.encodeJsonEnumType(value :: any)
	elseif typeId == "MultipleCheckbox" then
		return DataTypes.encodeJsonMultipleCheckboxType(value :: any)
	elseif typeId == "RadioGroup" then
		return DataTypes.encodeJsonRadioGroupType(value :: any)
	elseif typeId == "CustomCompound" or typeId == "CustomCompoundType" then
		return DataTypes.encodeJsonCustomCompoundType(value :: any)
	else
		local codec = COMPOUND_TYPE_CODECS[typeId]
		if codec then
			local encoder = (DataTypes :: any)[codec.encode]
			return encoder(value)
		end
		return value :: any
	end
end

function DataTypes.encodeJsonCustomCompoundType(t: CustomCompoundType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		local encoded: {[string]: any} = {}
		for key, value in t.valueSubFields do
			encoded[key] = DataTypes.encodeFieldValueByTypeId(value)
		end
		result.valueSubFields = encoded
	end
	return result
end

function DataTypes.decodeJsonCustomCompoundType(json: {[string]: any}): CustomCompoundType
	local subFields: {[string]: FieldValue}? = nil
	if json.valueSubFields ~= nil then
		local decoded: {[string]: FieldValue} = {}
		for key, value in json.valueSubFields :: {[string]: any} do
			decoded[key] = DataTypes.decodeFieldValueByTypeId(value)
		end
		subFields = decoded
	end
	return {
		typeId = json.typeId or "",
		valueSubFields = subFields,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end
```

- [ ] **Step 3: Add AddressType JSON roundtrip test**

Add to `test/test_protobuf_json.luau`:

```lua
	T.it("AddressType roundtrip", function()
		local cityField = DataTypes.makeStringType({ typeId = "City", value = "Springfield" })
		local subFields = DataTypes.makeAddressSubFields({ city = cityField })
		local original = DataTypes.makeAddressType({
			typeId = "Address",
			valueSubFields = subFields,
			subFieldKeysInOrder = {
				"numberAndStreet", "city", "stateProvince",
				"country", "postalZipCode", "fullAddress",
			},
		})
		local json = DataTypes.encodeJsonAddressType(original)
		local decoded = DataTypes.decodeJsonAddressType(json)
		T.expect(decoded.typeId).toBe("Address")
		T.expect(decoded.valueSubFields).toBeTruthy()
		local decodedCity = (decoded.valueSubFields :: any).city
		T.expect(decodedCity.value).toBe("Springfield")
		T.expect(#decoded.subFieldKeysInOrder).toBe(6)
	end)
```

- [ ] **Step 4: Run tests**

Run: `lune run test/test_main`

Expected: 5/5 passed (4 from Task 1 + 1 new AddressType test)

- [ ] **Step 5: Commit**

```bash
git add lib/data_types.luau test/test_protobuf_json.luau
git commit -m "feat: add compound types, CustomCompound, typeId dispatch, and address roundtrip test"
```

---

## Task 3: Table schema types and JSON codec

**Files:**
- Create: `lib/table_schema.luau`
- Modify: `test/test_protobuf_json.luau`

**Depends on:** Task 2 (needs DataTypes for typeId dispatch)

- [ ] **Step 1: Write `lib/table_schema.luau`**

```lua
--!strict
local DataTypes = require("@lib/data_types")

local TableSchema = {}

-- ============================================================
-- Type Definitions
-- ============================================================

export type SingleFieldType = {
	value: DataTypes.FieldValue?,
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

-- ============================================================
-- Constructors
-- ============================================================

function TableSchema.makeSingleFieldType(config: {
	value: DataTypes.FieldValue?,
	label: string?,
}?): SingleFieldType
	local c = config or {}
	return {
		value = c.value,
		label = c.label or "",
	}
end

function TableSchema.makeFieldGroup(config: {
	label: string?,
	startIdx: number?,
	endIdx: number?,
}?): FieldGroup
	local c = config or {}
	return {
		label = c.label or "",
		startIdx = c.startIdx or 0,
		endIdx = c.endIdx or 0,
	}
end

function TableSchema.makeTableSchema(config: {
	fieldsMap: {[string]: SingleFieldType}?,
	fieldKeysInOrder: {string}?,
	label: string?,
	groups: {FieldGroup}?,
}?): TableSchema
	local c = config or {}
	return {
		fieldsMap = c.fieldsMap or {},
		fieldKeysInOrder = c.fieldKeysInOrder or {},
		label = c.label or "",
		groups = c.groups or {},
	}
end

-- ============================================================
-- JSON Encode/Decode
-- ============================================================

function TableSchema.encodeJsonSingleFieldType(sft: SingleFieldType): {[string]: any}
	local result: {[string]: any} = { label = sft.label }
	if sft.value ~= nil then
		result.value = DataTypes.encodeFieldValueByTypeId(sft.value)
	end
	return result
end

function TableSchema.decodeJsonSingleFieldType(json: {[string]: any}): SingleFieldType
	local value: DataTypes.FieldValue? = nil
	if json.value ~= nil then
		value = DataTypes.decodeFieldValueByTypeId(json.value)
	end
	return {
		value = value,
		label = json.label or "",
	}
end

function TableSchema.encodeJsonTableSchema(ts: TableSchema): {[string]: any}
	local fieldsMapEncoded: {[string]: any} = {}
	for key, sft in ts.fieldsMap do
		fieldsMapEncoded[key] = TableSchema.encodeJsonSingleFieldType(sft)
	end
	local groupsEncoded: {{[string]: any}} = {}
	for _, g in ts.groups do
		table.insert(groupsEncoded, {
			label = g.label,
			startIdx = g.startIdx,
			endIdx = g.endIdx,
		})
	end
	return {
		fieldsMap = fieldsMapEncoded,
		fieldKeysInOrder = ts.fieldKeysInOrder,
		label = ts.label,
		groups = groupsEncoded,
	}
end

function TableSchema.decodeJsonTableSchema(json: {[string]: any}): TableSchema
	local fieldsMap: {[string]: SingleFieldType} = {}
	if json.fieldsMap ~= nil then
		for key, value in json.fieldsMap :: {[string]: any} do
			fieldsMap[key] = TableSchema.decodeJsonSingleFieldType(value)
		end
	end
	local groups: {FieldGroup} = {}
	if json.groups ~= nil then
		for _, g in json.groups :: {{[string]: any}} do
			table.insert(groups, {
				label = g.label or "",
				startIdx = g.startIdx or 0,
				endIdx = g.endIdx or 0,
			})
		end
	end
	return {
		fieldsMap = fieldsMap,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
		groups = groups,
	}
end

return TableSchema
```

- [ ] **Step 2: Add TableSchema JSON roundtrip test**

Add to `test/test_protobuf_json.luau` (need to require TableSchema):

```lua
local TableSchema = require("@lib/table_schema")

-- Inside the describe block:
	T.it("TableSchema roundtrip", function()
		local strVal = DataTypes.makeStringType({ typeId = "String", value = "hello" })
		local field = TableSchema.makeSingleFieldType({
			value = strVal :: any,
			label = "Test Field",
		})
		local schema = TableSchema.makeTableSchema({
			fieldsMap = { field1 = field },
			fieldKeysInOrder = { "field1" },
			label = "Test Schema",
		})
		local json = TableSchema.encodeJsonTableSchema(schema)
		local decoded = TableSchema.decodeJsonTableSchema(json)
		T.expect(decoded.label).toBe("Test Schema")
		T.expect(#decoded.fieldKeysInOrder).toBe(1)
		T.expect(decoded.fieldKeysInOrder[1]).toBe("field1")
		local decodedField = decoded.fieldsMap.field1
		T.expect(decodedField).toBeTruthy()
		T.expect(decodedField.label).toBe("Test Field")
		T.expect(decodedField.value).toBeTruthy()
		T.expect((decodedField.value :: any).typeId).toBe("String")
		T.expect((decodedField.value :: any).value).toBe("hello")
	end)
```

- [ ] **Step 3: Run tests**

Run: `lune run test/test_main`

Expected: 6/6 passed

- [ ] **Step 4: Commit**

```bash
git add lib/table_schema.luau test/test_protobuf_json.luau
git commit -m "feat: add table schema types with constructors, JSON codec, and roundtrip test"
```

---

## Chunk 2: Table-Specific Types and Schema Loading

## Task 4: Source and target table types with JSON codec

**Files:**
- Create: `lib/source_table.luau`
- Create: `lib/target_table.luau`

**Depends on:** Task 1 (needs DataTypes)

- [ ] **Step 1: Write `lib/source_table.luau`**

```lua
--!strict
local DataTypes = require("@lib/data_types")

local SourceTable = {}

-- ============================================================
-- Source-specific compound types
-- ============================================================

export type LpSignatoryFields = {
	asaCommitmentAmount: DataTypes.StringType?,
	individualSubscribernameSignaturepage: DataTypes.StringType?,
	entityAuthorizednameSignaturepage: DataTypes.StringType?,
}

export type LpSignatoryType = {
	typeId: string,
	valueSubFields: LpSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type W9Fields = {
	w9PartiSsn1: DataTypes.StringType?,
	w9PartiEin1: DataTypes.StringType?,
	w9Line2: DataTypes.StringType?,
}

export type W9Type = {
	typeId: string,
	valueSubFields: W9Fields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

-- ============================================================
-- SourceTableFieldsMap and Schema
-- ============================================================

export type SourceTableFieldsMap = {
	lpSignatory: LpSignatoryType?,
	asaFullnameInvestornameAmlquestionnaire: DataTypes.StringType?,
	asaFullnameInvestornameGeneralinfo1: DataTypes.StringType?,
	luxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indiInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	entityInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	w9: W9Type?,
}

export type SourceTableSchema = {
	fieldsMap: SourceTableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

-- ============================================================
-- Constructors
-- ============================================================

function SourceTable.makeLpSignatoryFields(config: {
	asaCommitmentAmount: DataTypes.StringType?,
	individualSubscribernameSignaturepage: DataTypes.StringType?,
	entityAuthorizednameSignaturepage: DataTypes.StringType?,
}?): LpSignatoryFields
	local c = config or {}
	return {
		asaCommitmentAmount = c.asaCommitmentAmount,
		individualSubscribernameSignaturepage = c.individualSubscribernameSignaturepage,
		entityAuthorizednameSignaturepage = c.entityAuthorizednameSignaturepage,
	}
end

function SourceTable.makeLpSignatoryType(config: {
	typeId: string?,
	valueSubFields: LpSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): LpSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceTable.makeW9Fields(config: {
	w9PartiSsn1: DataTypes.StringType?,
	w9PartiEin1: DataTypes.StringType?,
	w9Line2: DataTypes.StringType?,
}?): W9Fields
	local c = config or {}
	return {
		w9PartiSsn1 = c.w9PartiSsn1,
		w9PartiEin1 = c.w9PartiEin1,
		w9Line2 = c.w9Line2,
	}
end

function SourceTable.makeW9Type(config: {
	typeId: string?,
	valueSubFields: W9Fields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): W9Type
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceTable.makeSourceTableFieldsMap(config: {
	lpSignatory: LpSignatoryType?,
	asaFullnameInvestornameAmlquestionnaire: DataTypes.StringType?,
	asaFullnameInvestornameGeneralinfo1: DataTypes.StringType?,
	luxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indiInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	entityInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	w9: W9Type?,
}?): SourceTableFieldsMap
	local c = config or {}
	return {
		lpSignatory = c.lpSignatory,
		asaFullnameInvestornameAmlquestionnaire = c.asaFullnameInvestornameAmlquestionnaire,
		asaFullnameInvestornameGeneralinfo1 = c.asaFullnameInvestornameGeneralinfo1,
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = c.luxsentityRegulatedstatusPart2Duediligencequestionnaire,
		indiInternationalsupplementsPart1Duediligencequestionnaire = c.indiInternationalsupplementsPart1Duediligencequestionnaire,
		entityInternationalsupplementsPart1Duediligencequestionnaire = c.entityInternationalsupplementsPart1Duediligencequestionnaire,
		w9 = c.w9,
	}
end

function SourceTable.makeSourceTableSchema(config: {
	fieldsMap: SourceTableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): SourceTableSchema
	local c = config or {}
	return {
		fieldsMap = c.fieldsMap,
		fieldKeysInOrder = c.fieldKeysInOrder or {},
		label = c.label or "",
	}
end

-- ============================================================
-- JSON Encode/Decode
-- ============================================================

local function decodeOptionalStringType(json: any): DataTypes.StringType?
	if json == nil then return nil end
	return DataTypes.decodeJsonStringType(json)
end

local function encodeOptionalStringType(v: DataTypes.StringType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonStringType(v)
end

local function decodeOptionalMultipleCheckbox(json: any): DataTypes.MultipleCheckboxType?
	if json == nil then return nil end
	return DataTypes.decodeJsonMultipleCheckboxType(json)
end

local function encodeOptionalMultipleCheckbox(v: DataTypes.MultipleCheckboxType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonMultipleCheckboxType(v)
end

function SourceTable.decodeJsonLpSignatoryFields(json: {[string]: any}): LpSignatoryFields
	return {
		asaCommitmentAmount = decodeOptionalStringType(json.asaCommitmentAmount),
		individualSubscribernameSignaturepage = decodeOptionalStringType(json.individualSubscribernameSignaturepage),
		entityAuthorizednameSignaturepage = decodeOptionalStringType(json.entityAuthorizednameSignaturepage),
	}
end

function SourceTable.encodeJsonLpSignatoryFields(sf: LpSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.asaCommitmentAmount = encodeOptionalStringType(sf.asaCommitmentAmount)
	result.individualSubscribernameSignaturepage = encodeOptionalStringType(sf.individualSubscribernameSignaturepage)
	result.entityAuthorizednameSignaturepage = encodeOptionalStringType(sf.entityAuthorizednameSignaturepage)
	return result
end

function SourceTable.decodeJsonLpSignatoryType(json: {[string]: any}): LpSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceTable.decodeJsonLpSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceTable.encodeJsonLpSignatoryType(t: LpSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then result.label = t.label end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceTable.encodeJsonLpSignatoryFields(t.valueSubFields)
	end
	return result
end

-- W9 codec: same pattern as LpSignatory
function SourceTable.decodeJsonW9Fields(json: {[string]: any}): W9Fields
	return {
		w9PartiSsn1 = decodeOptionalStringType(json.w9PartiSsn1),
		w9PartiEin1 = decodeOptionalStringType(json.w9PartiEin1),
		w9Line2 = decodeOptionalStringType(json.w9Line2),
	}
end

function SourceTable.encodeJsonW9Fields(sf: W9Fields): {[string]: any}
	local result: {[string]: any} = {}
	result.w9PartiSsn1 = encodeOptionalStringType(sf.w9PartiSsn1)
	result.w9PartiEin1 = encodeOptionalStringType(sf.w9PartiEin1)
	result.w9Line2 = encodeOptionalStringType(sf.w9Line2)
	return result
end

function SourceTable.decodeJsonW9Type(json: {[string]: any}): W9Type
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceTable.decodeJsonW9Fields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceTable.encodeJsonW9Type(t: W9Type): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then result.label = t.label end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceTable.encodeJsonW9Fields(t.valueSubFields)
	end
	return result
end

function SourceTable.decodeJsonSourceTableFieldsMap(json: {[string]: any}): SourceTableFieldsMap
	return {
		lpSignatory = if json.lpSignatory then SourceTable.decodeJsonLpSignatoryType(json.lpSignatory) else nil,
		asaFullnameInvestornameAmlquestionnaire = decodeOptionalStringType(json.asaFullnameInvestornameAmlquestionnaire),
		asaFullnameInvestornameGeneralinfo1 = decodeOptionalStringType(json.asaFullnameInvestornameGeneralinfo1),
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalMultipleCheckbox(json.luxsentityRegulatedstatusPart2Duediligencequestionnaire),
		indiInternationalsupplementsPart1Duediligencequestionnaire = decodeOptionalMultipleCheckbox(json.indiInternationalsupplementsPart1Duediligencequestionnaire),
		entityInternationalsupplementsPart1Duediligencequestionnaire = decodeOptionalMultipleCheckbox(json.entityInternationalsupplementsPart1Duediligencequestionnaire),
		w9 = if json.w9 then SourceTable.decodeJsonW9Type(json.w9) else nil,
	}
end

function SourceTable.encodeJsonSourceTableFieldsMap(fm: SourceTableFieldsMap): {[string]: any}
	local result: {[string]: any} = {}
	if fm.lpSignatory then result.lpSignatory = SourceTable.encodeJsonLpSignatoryType(fm.lpSignatory) end
	result.asaFullnameInvestornameAmlquestionnaire = encodeOptionalStringType(fm.asaFullnameInvestornameAmlquestionnaire)
	result.asaFullnameInvestornameGeneralinfo1 = encodeOptionalStringType(fm.asaFullnameInvestornameGeneralinfo1)
	result.luxsentityRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalMultipleCheckbox(fm.luxsentityRegulatedstatusPart2Duediligencequestionnaire)
	result.indiInternationalsupplementsPart1Duediligencequestionnaire = encodeOptionalMultipleCheckbox(fm.indiInternationalsupplementsPart1Duediligencequestionnaire)
	result.entityInternationalsupplementsPart1Duediligencequestionnaire = encodeOptionalMultipleCheckbox(fm.entityInternationalsupplementsPart1Duediligencequestionnaire)
	if fm.w9 then result.w9 = SourceTable.encodeJsonW9Type(fm.w9) end
	return result
end

function SourceTable.decodeJsonSourceTableSchema(json: {[string]: any}): SourceTableSchema
	return {
		fieldsMap = if json.fieldsMap then SourceTable.decodeJsonSourceTableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return SourceTable
```

- [ ] **Step 2: Write `lib/target_table.luau`**

```lua
--!strict
local DataTypes = require("@lib/data_types")

local TargetTable = {}

-- ============================================================
-- Type Definitions
-- ============================================================

export type TargetTableFieldsMap = {
	sfAgreementNullCommitmentC: DataTypes.MoneyType?,
	sfAccountSubscriptionInvestorName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC: DataTypes.RadioGroupType?,
	sfAgreementNullWlcInternationalSupplementsC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullSignerFirstName: DataTypes.StringType?,
	sfAgreementNullSignerMiddleName: DataTypes.StringType?,
	sfAgreementNullSignerLastName: DataTypes.StringType?,
	sfTaxFormW9UsTinTypeC: DataTypes.RadioGroupType?,
}

export type TargetTableSchema = {
	fieldsMap: TargetTableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

-- ============================================================
-- Constructors
-- ============================================================

function TargetTable.makeTargetTableFieldsMap(config: {
	sfAgreementNullCommitmentC: DataTypes.MoneyType?,
	sfAccountSubscriptionInvestorName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC: DataTypes.RadioGroupType?,
	sfAgreementNullWlcInternationalSupplementsC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullSignerFirstName: DataTypes.StringType?,
	sfAgreementNullSignerMiddleName: DataTypes.StringType?,
	sfAgreementNullSignerLastName: DataTypes.StringType?,
	sfTaxFormW9UsTinTypeC: DataTypes.RadioGroupType?,
}?): TargetTableFieldsMap
	local c = config or {}
	return {
		sfAgreementNullCommitmentC = c.sfAgreementNullCommitmentC,
		sfAccountSubscriptionInvestorName = c.sfAccountSubscriptionInvestorName,
		sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = c.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC,
		sfAgreementNullWlcInternationalSupplementsC = c.sfAgreementNullWlcInternationalSupplementsC,
		sfAgreementNullSignerFirstName = c.sfAgreementNullSignerFirstName,
		sfAgreementNullSignerMiddleName = c.sfAgreementNullSignerMiddleName,
		sfAgreementNullSignerLastName = c.sfAgreementNullSignerLastName,
		sfTaxFormW9UsTinTypeC = c.sfTaxFormW9UsTinTypeC,
	}
end

function TargetTable.makeTargetTableSchema(config: {
	fieldsMap: TargetTableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): TargetTableSchema
	local c = config or {}
	return {
		fieldsMap = c.fieldsMap,
		fieldKeysInOrder = c.fieldKeysInOrder or {},
		label = c.label or "",
	}
end

-- ============================================================
-- JSON Encode/Decode
-- ============================================================

local function decodeOptionalStringType(json: any): DataTypes.StringType?
	if json == nil then return nil end
	return DataTypes.decodeJsonStringType(json)
end
local function encodeOptionalStringType(v: DataTypes.StringType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonStringType(v)
end
local function decodeOptionalMultipleCheckbox(json: any): DataTypes.MultipleCheckboxType?
	if json == nil then return nil end
	return DataTypes.decodeJsonMultipleCheckboxType(json)
end
local function encodeOptionalMultipleCheckbox(v: DataTypes.MultipleCheckboxType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonMultipleCheckboxType(v)
end
local function decodeOptionalRadioGroup(json: any): DataTypes.RadioGroupType?
	if json == nil then return nil end
	return DataTypes.decodeJsonRadioGroupType(json)
end
local function encodeOptionalRadioGroup(v: DataTypes.RadioGroupType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonRadioGroupType(v)
end
local function decodeOptionalMoneyType(json: any): DataTypes.MoneyType?
	if json == nil then return nil end
	return DataTypes.decodeJsonMoneyType(json)
end
local function encodeOptionalMoneyType(v: DataTypes.MoneyType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonMoneyType(v)
end

function TargetTable.decodeJsonTargetTableFieldsMap(json: {[string]: any}): TargetTableFieldsMap
	return {
		sfAgreementNullCommitmentC = decodeOptionalMoneyType(json.sfAgreementNullCommitmentC),
		sfAccountSubscriptionInvestorName = decodeOptionalStringType(json.sfAccountSubscriptionInvestorName),
		sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = decodeOptionalRadioGroup(json.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC),
		sfAgreementNullWlcInternationalSupplementsC = decodeOptionalMultipleCheckbox(json.sfAgreementNullWlcInternationalSupplementsC),
		sfAgreementNullSignerFirstName = decodeOptionalStringType(json.sfAgreementNullSignerFirstName),
		sfAgreementNullSignerMiddleName = decodeOptionalStringType(json.sfAgreementNullSignerMiddleName),
		sfAgreementNullSignerLastName = decodeOptionalStringType(json.sfAgreementNullSignerLastName),
		sfTaxFormW9UsTinTypeC = decodeOptionalRadioGroup(json.sfTaxFormW9UsTinTypeC),
	}
end

function TargetTable.encodeJsonTargetTableFieldsMap(fm: TargetTableFieldsMap): {[string]: any}
	local result: {[string]: any} = {}
	result.sfAgreementNullCommitmentC = encodeOptionalMoneyType(fm.sfAgreementNullCommitmentC)
	result.sfAccountSubscriptionInvestorName = encodeOptionalStringType(fm.sfAccountSubscriptionInvestorName)
	result.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = encodeOptionalRadioGroup(fm.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC)
	result.sfAgreementNullWlcInternationalSupplementsC = encodeOptionalMultipleCheckbox(fm.sfAgreementNullWlcInternationalSupplementsC)
	result.sfAgreementNullSignerFirstName = encodeOptionalStringType(fm.sfAgreementNullSignerFirstName)
	result.sfAgreementNullSignerMiddleName = encodeOptionalStringType(fm.sfAgreementNullSignerMiddleName)
	result.sfAgreementNullSignerLastName = encodeOptionalStringType(fm.sfAgreementNullSignerLastName)
	result.sfTaxFormW9UsTinTypeC = encodeOptionalRadioGroup(fm.sfTaxFormW9UsTinTypeC)
	return result
end

function TargetTable.decodeJsonTargetTableSchema(json: {[string]: any}): TargetTableSchema
	return {
		fieldsMap = if json.fieldsMap then TargetTable.decodeJsonTargetTableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return TargetTable
```

- [ ] **Step 3: Run tests** (existing tests should still pass, no new tests yet for these modules)

Run: `lune run test/test_main`

Expected: 6/6 passed

- [ ] **Step 4: Commit**

```bash
git add lib/source_table.luau lib/target_table.luau
git commit -m "feat: add source and target table types with constructors and JSON codec"
```

---

## Task 5: Schema loading module

**Files:**
- Create: `lib/schema.luau`

**Depends on:** Task 4 (needs SourceTable and TargetTable for decode)

- [ ] **Step 1: Write `lib/schema.luau`**

```lua
--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")

local Schema = {}

-- ============================================================
-- TypeConstants
-- ============================================================

export type TypeConstants = {
	typeId: string,
	regex: string?,
	formatPatterns: {string},
	options: {string},
	minValue: number?,
	maxValue: number?,
	subFieldKeysInOrder: {string},
}

-- ============================================================
-- snakeToCamel conversion
-- ============================================================

function Schema.snakeToCamel(s: string): string
	local result = ""
	local capitalizeNext = false
	for i = 1, #s do
		local c = string.sub(s, i, i)
		if c == "_" then
			capitalizeNext = true
		elseif capitalizeNext then
			result = result .. string.upper(c)
			capitalizeNext = false
		else
			result = result .. c
		end
	end
	return result
end

-- Recursively convert all object keys from snake_case to camelCase.
-- Note: this is used on the load path only (not for round-trip re-encoding).
function Schema.camelcaseKeys(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local t = value :: {[any]: any}
	-- Detect array: has integer key 1, or is empty (empty arrays from JSON
	-- decode as empty tables — treat them as arrays to preserve semantics)
	local isArray = t[1] ~= nil or next(t) == nil
	if isArray then
		local result = {}
		for _, item in t do
			table.insert(result, Schema.camelcaseKeys(item))
		end
		return result
	end
	-- Treat as object
	local result: {[string]: any} = {}
	for k, v in t do
		local newKey = Schema.snakeToCamel(tostring(k))
		result[newKey] = Schema.camelcaseKeys(v)
	end
	return result
end

-- ============================================================
-- Loading functions
-- ============================================================

function Schema.loadDataTypeConstants(): {[string]: TypeConstants}
	local content = fs.readFile("proto/data_types_constants.json")
	local json = serde.decode("json", content) :: {[string]: any}
	local result: {[string]: TypeConstants} = {}
	for key, value in json do
		local entry = value :: {[string]: any}
		result[key] = {
			typeId = entry.typeId or "",
			regex = entry.regex,
			formatPatterns = entry.formatPatterns or {},
			options = entry.options or {},
			-- JSON uses "min"/"max", we map to minValue/maxValue
			minValue = entry.min,
			maxValue = entry.max,
			subFieldKeysInOrder = entry.subFieldKeysInOrder or {},
		}
	end
	return result
end

function Schema.loadSourceTableSchema(): SourceTable.SourceTableSchema
	local content = fs.readFile("proto/tables/source_table_constants.json")
	local json = serde.decode("json", content)
	local camelized = Schema.camelcaseKeys(json) :: {[string]: any}
	return SourceTable.decodeJsonSourceTableSchema(camelized)
end

function Schema.loadTargetTableSchema(): TargetTable.TargetTableSchema
	local content = fs.readFile("proto/tables/target_table_constants.json")
	local json = serde.decode("json", content)
	local camelized = Schema.camelcaseKeys(json) :: {[string]: any}
	return TargetTable.decodeJsonTargetTableSchema(camelized)
end

-- ============================================================
-- Helper functions
-- ============================================================

function Schema.findTypeConstants(constants: {[string]: TypeConstants}, typeId: string): TypeConstants?
	return constants[typeId]
end

function Schema.hasRegex(tc: TypeConstants): boolean
	return tc.regex ~= nil
end

function Schema.typeCount(constants: {[string]: TypeConstants}): number
	local count = 0
	for _ in constants do
		count += 1
	end
	return count
end

return Schema
```

- [ ] **Step 2: Run tests** (existing tests still pass)

Run: `lune run test/test_main`

Expected: 6/6 passed

- [ ] **Step 3: Commit**

```bash
git add lib/schema.luau
git commit -m "feat: add schema loading with snakeToCamel, loadDataTypeConstants, load table schemas"
```

---

## Task 6: Schema loading tests and final wiring

**Files:**
- Create: `test/test_schema.luau`
- Modify: `test/test_main.luau`

**Depends on:** Task 5

- [ ] **Step 1: Write `test/test_schema.luau`**

```lua
--!strict
local T = require("@lib/test_runner")
local Schema = require("@lib/schema")

T.describe("schema", function()
	T.it("load data type constants", function()
		local constants = Schema.loadDataTypeConstants()
		-- Verify total count
		T.expect(Schema.typeCount(constants)).toBe(47)
		-- Verify Ssn has regex
		local ssn = Schema.findTypeConstants(constants, "Ssn")
		T.expect(ssn).toBeTruthy()
		T.expect(Schema.hasRegex(ssn :: any)).toBe(true)
	end)

	T.it("load source table schema", function()
		local schema = Schema.loadSourceTableSchema()
		T.expect(schema.label).toBe("subdoc")
		T.expect(#schema.fieldKeysInOrder).toBe(7)

		local fm = schema.fieldsMap
		T.expect(fm).toBeTruthy()

		-- Check StringType field
		local strField = (fm :: any).asaFullnameInvestornameGeneralinfo1
		T.expect(strField).toBeTruthy()
		T.expect(strField.typeId).toBe("String")

		-- Check lp_signatory compound field
		local sigField = (fm :: any).lpSignatory
		T.expect(sigField).toBeTruthy()
		T.expect(sigField.typeId).toBe("CustomCompound")
		T.expect(#sigField.subFieldKeysInOrder).toBe(3)

		-- Check sub-field is typed
		local subFields = sigField.valueSubFields
		T.expect(subFields).toBeTruthy()
		local commitmentSub = subFields.asaCommitmentAmount
		T.expect(commitmentSub).toBeTruthy()
		T.expect(commitmentSub.typeId).toBe("String")

		-- Check MultipleCheckbox has option keys
		local checkbox = (fm :: any).luxsentityRegulatedstatusPart2Duediligencequestionnaire
		T.expect(checkbox).toBeTruthy()
		T.expect(checkbox.typeId).toBe("MultipleCheckbox")
		T.expect(#checkbox.allOptionKeysInOrder).toBe(2)
		T.expect(#checkbox.allOptionLabelsInOrder).toBe(2)
	end)

	T.it("load target table schema", function()
		local schema = Schema.loadTargetTableSchema()
		T.expect(schema.label).toBe("target")
		T.expect(#schema.fieldKeysInOrder).toBe(8)

		local fm = schema.fieldsMap
		T.expect(fm).toBeTruthy()

		-- Check MoneyType field
		local moneyField = (fm :: any).sfAgreementNullCommitmentC
		T.expect(moneyField).toBeTruthy()
		T.expect(moneyField.typeId).toBe("Money")

		-- Check RadioGroupType field
		local radioField = (fm :: any).sfTaxFormW9UsTinTypeC
		T.expect(radioField).toBeTruthy()
		T.expect(radioField.typeId).toBe("RadioGroup")
		T.expect(#radioField.allOptionKeysInOrder).toBe(2)
		T.expect(radioField.allOptionKeysInOrder[1]).toBe("SSN")
		T.expect(radioField.allOptionKeysInOrder[2]).toBe("EIN")

		-- Check StringType field
		local strField = (fm :: any).sfAgreementNullSignerFirstName
		T.expect(strField).toBeTruthy()
		T.expect(strField.typeId).toBe("String")

		-- Check MultipleCheckbox has 6 option keys
		local mcField = (fm :: any).sfAgreementNullWlcInternationalSupplementsC
		T.expect(mcField).toBeTruthy()
		T.expect(#mcField.allOptionKeysInOrder).toBe(6)
	end)
end)
```

- [ ] **Step 2: Wire test_main.luau**

```lua
--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")
require("@test/test_protobuf_json")
require("@test/test_schema")
T.run()
```

- [ ] **Step 3: Run all tests**

Run: `lune run test/test_main`

Expected output:
```
[placeholder]
  PASS can read and parse JSON fixture

[json roundtrip]
  PASS StringType roundtrip (Ssn)
  PASS StringType roundtrip (Email)
  PASS MultipleCheckboxType roundtrip
  PASS AddressType roundtrip
  PASS TableSchema roundtrip

[schema]
  PASS load data type constants
  PASS load source table schema
  PASS load target table schema

Results: 9/9 passed, 0 failed
```

- [ ] **Step 4: Commit**

```bash
git add test/test_schema.luau test/test_main.luau
git commit -m "feat: add schema loading tests (3 tests) — all 9 tests passing"
```

---

## Verification

After all tasks, run this end-to-end check:

```bash
# 1. All tests pass
lune run test/test_main

# 2. All expected files exist
ls lib/data_types.luau lib/table_schema.luau lib/source_table.luau lib/target_table.luau lib/schema.luau
ls test/test_protobuf_json.luau test/test_schema.luau

# 3. Module requires work (smoke test)
lune run - <<'EOF'
local DataTypes = require("@lib/data_types")
local TableSchema = require("@lib/table_schema")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")
local Schema = require("@lib/schema")
print("All modules load OK")
local c = Schema.loadDataTypeConstants()
print("Loaded " .. tostring(Schema.typeCount(c)) .. " type constants")
EOF
```

Expected: 9/9 tests pass (1 pre-existing placeholder + 5 JSON roundtrip + 3 schema loading = 8 new tests from this spec), all files present, modules load with 47 type constants.
