# Transform Engine Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Port the core data transformation logic from OCaml to Luau: json_path, transform_utils, mappings, example_mappings, CLI, and all 28 tests.

**Architecture:** 4 library modules + CLI update. json_path and transform_utils are independent utilities. mappings uses both for generic JSON transforms. example_mappings uses typed structs directly (no mappings dependency). CLI wires source decode → transform → target encode.

**Tech Stack:** Luau language, Lune runtime, `@lune/fs` + `@lune/serde` + `@lune/process`

**Spec:** `docs/specs/2026-03-17-transform-engine-design.md`

---

## File Map

| File | Action | Responsibility |
|---|---|---|
| `lib/json_path.luau` | Create | getPath, setPath, getString, getStringOrEmpty, getStringList |
| `lib/transform_utils.luau` | Create | identity, groupBy, mergeBy, mapValues, deepMerge |
| `lib/mappings.luau` | Create | textboxMapping, checkboxMapping, customMapping, applyMapping, transformAll |
| `lib/example_mappings.luau` | Create | splitName, transform (6 field mappings) |
| `bin/main.luau` | Modify | CLI: read JSON → decode → transform → encode → stdout |
| `test/test_json_path.luau` | Create | 4 tests |
| `test/test_transform_utils.luau` | Create | 6 tests |
| `test/test_mappings.luau` | Create | 2 tests |
| `test/test_example_mappings.luau` | Create | 15 tests |
| `test/test_integration.luau` | Create | 1 test |
| `test/test_main.luau` | Modify | Wire in all new test files |

---

## Task 1: json_path module with tests

**Files:**
- Create: `lib/json_path.luau`
- Create: `test/test_json_path.luau`
- Modify: `test/test_main.luau`

**Depends on:** None

**Luau reminders:** `--!strict`. `~=` not-equal. `or` for defaults. `type(v)` returns lowercase strings. Tables from serde are 1-based. `for k, v in t do` iterates dictionaries.

- [ ] **Step 1: Write `lib/json_path.luau`**

```lua
--!strict
local JsonPath = {}

function JsonPath.getPath(t: any, path: {string}): any?
	local current: any = t
	for _, key in path do
		if type(current) ~= "table" then
			return nil
		end
		current = (current :: {[string]: any})[key]
		if current == nil then
			return nil
		end
	end
	return current
end

function JsonPath.setPath(t: any, path: {string}, value: any): any
	if #path == 0 then
		return value
	end

	local fields: {[string]: any} = {}
	if type(t) == "table" then
		for k, v in t :: {[string]: any} do
			fields[k] = v
		end
	end

	local key = path[1]
	if #path == 1 then
		fields[key] = value
	else
		local child = fields[key]
		if child == nil then
			child = {}
		end
		local remainingPath: {string} = {}
		for i = 2, #path do
			table.insert(remainingPath, path[i])
		end
		fields[key] = JsonPath.setPath(child, remainingPath, value)
	end

	return fields
end

function JsonPath.getString(t: any, path: {string}): string?
	local result = JsonPath.getPath(t, path)
	if type(result) == "string" then
		return result :: string
	end
	return nil
end

function JsonPath.getStringOrEmpty(t: any, path: {string}): string
	return JsonPath.getString(t, path) or ""
end

function JsonPath.getStringList(t: any, path: {string}): {string}
	local result = JsonPath.getPath(t, path)
	if type(result) ~= "table" then
		return {}
	end
	local items: {string} = {}
	for _, item in result :: {any} do
		if type(item) == "string" then
			table.insert(items, item :: string)
		end
	end
	return items
end

return JsonPath
```

- [ ] **Step 2: Write `test/test_json_path.luau`**

```lua
--!strict
local T = require("@lib/test_runner")
local JP = require("@lib/json_path")

T.describe("json_path", function()
	T.it("get nested path", function()
		local json = { a = { b = { c = 42 } } }
		local result = JP.getPath(json, { "a", "b", "c" })
		T.expect(result).toBe(42)
	end)

	T.it("get missing path", function()
		local json = { a = { b = 1 } }
		local result = JP.getPath(json, { "a", "x" })
		T.expect(result).toBeNil()
	end)

	T.it("get empty path", function()
		local json = { a = 1 }
		local result = JP.getPath(json, {})
		T.expect(type(result)).toBe("table")
		T.expect((result :: any).a).toBe(1)
	end)

	T.it("set nested path", function()
		local result = JP.setPath({}, { "a", "b" }, "hello")
		local value = JP.getPath(result, { "a", "b" })
		T.expect(value).toBe("hello")
	end)
end)
```

- [ ] **Step 3: Wire into test_main and run**

Update `test/test_main.luau`:

```lua
--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")
require("@test/test_protobuf_json")
require("@test/test_schema")
require("@test/test_json_path")
T.run()
```

Run: `lune run test/test_main`
Expected: 13/13 passed (9 existing + 4 new)

- [ ] **Step 4: Commit**

```bash
git add lib/json_path.luau test/test_json_path.luau test/test_main.luau
git commit -m "feat: add json_path module with getPath, setPath, getString, getStringList"
```

---

## Task 2: transform_utils module with tests

**Files:**
- Create: `lib/transform_utils.luau`
- Create: `test/test_transform_utils.luau`
- Modify: `test/test_main.luau`

**Depends on:** None (parallelizable with Task 1)

- [ ] **Step 1: Write `lib/transform_utils.luau`**

```lua
--!strict
local TransformUtils = {}

function TransformUtils.identity(x: any): any
	return x
end

function TransformUtils.groupBy(items: {any}, keyFn: (any) -> string, valueFn: (any) -> any): {{any}}
	local groups: {[string]: {any}} = {}
	local order: {string} = {}

	for _, item in items do
		local k = keyFn(item)
		local v = valueFn(item)
		if groups[k] == nil then
			groups[k] = {}
			table.insert(order, k)
		end
		table.insert(groups[k], v)
	end

	local result: {{any}} = {}
	for _, k in order do
		table.insert(result, { k, groups[k] })
	end
	return result
end

function TransformUtils.mergeBy(items: {any}, keyFn: (any) -> string, valueFn: (any) -> any): {{any}}
	local values: {[string]: any} = {}
	local order: {string} = {}

	for _, item in items do
		local k = keyFn(item)
		if values[k] == nil then
			table.insert(order, k)
		end
		values[k] = valueFn(item)
	end

	local result: {{any}} = {}
	for _, k in order do
		table.insert(result, { k, values[k] })
	end
	return result
end

function TransformUtils.mapValues(pairs: {{any}}, fn: (string, any) -> any): {{any}}
	local result: {{any}} = {}
	for _, pair in pairs do
		local k = pair[1] :: string
		local v = pair[2]
		table.insert(result, { k, fn(k, v) })
	end
	return result
end

local function isDict(t: any): boolean
	if type(t) ~= "table" then
		return false
	end
	local tbl = t :: {[any]: any}
	-- If it has a numeric key 1 and no string keys, it's likely an array
	if tbl[1] ~= nil then
		return false
	end
	-- Check if any string keys exist
	for k, _ in tbl do
		if type(k) == "string" then
			return true
		end
	end
	-- Empty table: treat as dict (matches deepMerge's fold_left from empty {})
	return true
end

local function deepMergeTwo(acc: any, obj: any): any
	if not isDict(acc) or not isDict(obj) then
		return obj
	end

	local accT = acc :: {[string]: any}
	local objT = obj :: {[string]: any}

	local merged: {[string]: any} = {}
	for k, v in accT do
		merged[k] = v
	end

	for key, value in objT do
		local existing = merged[key]
		if existing ~= nil and isDict(existing) and isDict(value) then
			merged[key] = deepMergeTwo(existing, value)
		else
			merged[key] = value
		end
	end

	return merged
end

function TransformUtils.deepMerge(objects: {any}): any
	local result: any = {}
	for _, obj in objects do
		result = deepMergeTwo(result, obj)
	end
	return result
end

return TransformUtils
```

- [ ] **Step 2: Write `test/test_transform_utils.luau`**

```lua
--!strict
local T = require("@lib/test_runner")
local TU = require("@lib/transform_utils")

T.describe("transform_utils", function()
	T.it("identity", function()
		T.expect(TU.identity(42)).toBe(42)
		T.expect(TU.identity("hello")).toBe("hello")
	end)

	T.it("groupBy", function()
		local items = { { "a", 1 }, { "b", 2 }, { "a", 3 } }
		local result = TU.groupBy(items, function(item: any): string
			return (item :: {any})[1] :: string
		end, function(item: any): any
			return (item :: {any})[2]
		end)
		-- result should be { {"a", {1, 3}}, {"b", {2}} }
		T.expect(#result).toBe(2)
		T.expect(result[1][1]).toBe("a")
		local aValues = result[1][2] :: {any}
		T.expect(#aValues).toBe(2)
		T.expect(aValues[1]).toBe(1)
		T.expect(aValues[2]).toBe(3)
		T.expect(result[2][1]).toBe("b")
		local bValues = result[2][2] :: {any}
		T.expect(#bValues).toBe(1)
		T.expect(bValues[1]).toBe(2)
	end)

	T.it("mergeBy", function()
		local items = { { "a", 1 }, { "b", 2 }, { "c", 3 } }
		local result = TU.mergeBy(items, function(item: any): string
			return (item :: {any})[1] :: string
		end, function(item: any): any
			return (item :: {any})[2]
		end)
		T.expect(#result).toBe(3)
		T.expect(result[1][1]).toBe("a")
		T.expect(result[1][2]).toBe(1)
		T.expect(result[2][1]).toBe("b")
		T.expect(result[2][2]).toBe(2)
		T.expect(result[3][1]).toBe("c")
		T.expect(result[3][2]).toBe(3)
	end)

	T.it("mapValues", function()
		local pairs = { { "x", 1 }, { "y", 2 } }
		local result = TU.mapValues(pairs, function(_k: string, v: any): any
			return (v :: number) * 10
		end)
		T.expect(result[1][1]).toBe("x")
		T.expect(result[1][2]).toBe(10)
		T.expect(result[2][1]).toBe("y")
		T.expect(result[2][2]).toBe(20)
	end)

	T.it("deepMerge", function()
		local a = { x = 1, nested = { a = 1 } }
		local b = { y = 2, nested = { b = 2 } }
		local result = TU.deepMerge({ a, b }) :: {[string]: any}
		T.expect(result.x).toBe(1)
		T.expect(result.y).toBe(2)
		local nested = result.nested :: {[string]: any}
		T.expect(nested.a).toBe(1)
		T.expect(nested.b).toBe(2)
	end)

	T.it("deepMerge overwrite", function()
		local a = { x = 1 }
		local b = { x = 2 }
		local result = TU.deepMerge({ a, b }) :: {[string]: any}
		T.expect(result.x).toBe(2)
	end)
end)
```

- [ ] **Step 3: Wire into test_main and run**

Add `require("@test/test_transform_utils")` to `test/test_main.luau`.

Run: `lune run test/test_main`
Expected: 19/19 passed (13 + 6 new)

- [ ] **Step 4: Commit**

```bash
git add lib/transform_utils.luau test/test_transform_utils.luau test/test_main.luau
git commit -m "feat: add transform_utils with identity, groupBy, mergeBy, mapValues, deepMerge"
```

---

## Task 3: mappings module with tests

**Files:**
- Create: `lib/mappings.luau`
- Create: `test/test_mappings.luau`
- Modify: `test/test_main.luau`

**Depends on:** Task 1 (json_path), Task 2 (transform_utils)

- [ ] **Step 1: Write `lib/mappings.luau`**

```lua
--!strict
local JsonPath = require("@lib/json_path")
local TransformUtils = require("@lib/transform_utils")

local Mappings = {}

export type InputInfo = {{any}} -- array of {alias: string, path: {string}} pairs
export type Mapping = {
	name: string,
	inputPaths: InputInfo,
	outputPath: {string},
	transform: (any) -> any,
}

local function getValue(json: any, path: {string}): any
	return JsonPath.getPath(json, path)
end

local function buildOutput(value: any, path: {string}): any
	local result: any = value
	for i = #path, 1, -1 do
		local key = path[i]
		if key ~= "" then
			result = { [key] = result }
		end
	end
	return result
end

local function gatherInputs(json: any, inputPaths: InputInfo): {[string]: any}
	local result: {[string]: any} = {}
	for _, pair in inputPaths do
		local alias = pair[1] :: string
		local path = pair[2] :: {string}
		result[alias] = getValue(json, path)
	end
	return result
end

function Mappings.textboxMapping(config: {
	name: string,
	inputPaths: InputInfo,
	outputPath: {string},
}): Mapping
	local outputPath = config.outputPath
	local transform = function(inputJson: any): any
		local values: {string} = {}
		if type(inputJson) == "table" then
			-- Iterate in inputPaths order to preserve concatenation order
			for _, pair in config.inputPaths do
				local alias = pair[1] :: string
				local v = (inputJson :: {[string]: any})[alias]
				if v ~= nil then
					local strVal = JsonPath.getString(v, { "value" })
					if strVal ~= nil and strVal ~= "" then
						table.insert(values, strVal)
					end
				end
			end
		end
		local joined = table.concat(values, "")
		return buildOutput({ value = joined }, outputPath)
	end
	return {
		name = config.name,
		inputPaths = config.inputPaths,
		outputPath = outputPath,
		transform = transform,
	}
end

function Mappings.checkboxMapping(config: {
	name: string,
	inputPaths: InputInfo,
	outputPath: {string},
	optionMap: {{string}}, -- array of {sourceKey, targetKey} pairs
}): Mapping
	local outputPath = config.outputPath
	local optionMap = config.optionMap
	local transform = function(inputJson: any): any
		local selectedKeys: {string} = {}
		if type(inputJson) == "table" then
			for _, pair in config.inputPaths do
				local alias = pair[1] :: string
				local v = (inputJson :: {[string]: any})[alias]
				if v ~= nil and type(v) == "table" then
					local keys = JsonPath.getStringList(v, { "selectedKeys" })
					for _, k in keys do
						-- Look up in optionMap
						for _, mapping in optionMap do
							if mapping[1] == k then
								table.insert(selectedKeys, mapping[2])
								break
							end
						end
					end
				end
			end
		end
		-- Deduplicate preserving order
		local unique: {string} = {}
		local seen: {[string]: boolean} = {}
		for _, key in selectedKeys do
			if not seen[key] then
				seen[key] = true
				table.insert(unique, key)
			end
		end
		return buildOutput({ selectedKeys = unique }, outputPath)
	end
	return {
		name = config.name,
		inputPaths = config.inputPaths,
		outputPath = outputPath,
		transform = transform,
	}
end

function Mappings.customMapping(config: {
	name: string,
	inputPaths: InputInfo,
	outputPath: {string},
	transformFn: (any) -> any,
}): Mapping
	local outputPath = config.outputPath
	local transformFn = config.transformFn
	local transform = function(inputJson: any): any
		local result = transformFn(inputJson)
		return buildOutput(result, outputPath)
	end
	return {
		name = config.name,
		inputPaths = config.inputPaths,
		outputPath = outputPath,
		transform = transform,
	}
end

function Mappings.applyMapping(mapping: Mapping, source: any): any
	local input = gatherInputs(source, mapping.inputPaths)
	return mapping.transform(input)
end

function Mappings.transformAll(mappings: {Mapping}, source: any): any
	local results: {any} = {}
	for _, m in mappings do
		table.insert(results, Mappings.applyMapping(m, source))
	end
	return TransformUtils.deepMerge(results)
end

return Mappings
```

- [ ] **Step 2: Write `test/test_mappings.luau`**

```lua
--!strict
local T = require("@lib/test_runner")
local Mappings = require("@lib/mappings")
local JP = require("@lib/json_path")

T.describe("mappings", function()
	T.it("textbox mapping", function()
		local input = {
			subdoc = {
				lp_signatory = {
					asa_commitment_amount = { value = "1000000" },
				},
			},
		}
		local mapping = Mappings.textboxMapping({
			name = "sf_Agreement_null_Commitment_c",
			inputPaths = {
				{ "subdoc", { "subdoc", "lp_signatory", "asa_commitment_amount" } },
			},
			outputPath = { "sf_Agreement_null_Commitment_c" },
		})
		local result = Mappings.applyMapping(mapping, input)
		local value = JP.getString(result, { "sf_Agreement_null_Commitment_c", "value" })
		T.expect(value).toBe("1000000")
	end)

	T.it("checkbox mapping", function()
		local input = {
			subdoc = {
				luxsentity_regulatedstatus_part2_duediligencequestionnaire = {
					selectedKeys = {
						"yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire",
					},
				},
			},
		}
		local mapping = Mappings.checkboxMapping({
			name = "sf_Account_SubscriptionInvestor_WLC",
			inputPaths = {
				{ "subdoc", { "subdoc", "luxsentity_regulatedstatus_part2_duediligencequestionnaire" } },
			},
			outputPath = { "sf_Account_SubscriptionInvestor_WLC" },
			optionMap = {
				{ "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire", "true" },
				{ "no_luxsentity_regulatedstatus_part2_duediligencequestionnaire", "false" },
			},
		})
		local result = Mappings.applyMapping(mapping, input)
		local keys = JP.getStringList(result, { "sf_Account_SubscriptionInvestor_WLC", "selectedKeys" })
		T.expect(#keys).toBe(1)
		T.expect(keys[1]).toBe("true")
	end)
end)
```

- [ ] **Step 3: Wire into test_main and run**

Add `require("@test/test_mappings")` to `test/test_main.luau`.

Run: `lune run test/test_main`
Expected: 21/21 passed (19 + 2 new)

- [ ] **Step 4: Commit**

```bash
git add lib/mappings.luau test/test_mappings.luau test/test_main.luau
git commit -m "feat: add mappings module with textbox, checkbox, custom mapping engine"
```

---

## Task 4: example_mappings module with tests

**Files:**
- Create: `lib/example_mappings.luau`
- Create: `test/test_example_mappings.luau`
- Modify: `test/test_main.luau`

**Depends on:** Types from types-and-schema spec (already in worktree)

- [ ] **Step 1: Write `lib/example_mappings.luau`**

```lua
--!strict
local DataTypes = require("@lib/data_types")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")

local ExampleMappings = {}

export type NameParts = {
	firstName: string,
	middleName: string,
	lastName: string,
}

function ExampleMappings.splitName(fullname: string): NameParts
	local trimmed = string.gsub(fullname, "^%s+", "")
	trimmed = string.gsub(trimmed, "%s+$", "")

	if trimmed == "" then
		return { firstName = "", middleName = "", lastName = "" }
	end

	local parts: {string} = {}
	for part in string.gmatch(trimmed, "%S+") do
		table.insert(parts, part)
	end

	if #parts == 0 then
		return { firstName = "", middleName = "", lastName = "" }
	elseif #parts == 1 then
		return { firstName = parts[1], middleName = "", lastName = parts[1] }
	elseif #parts == 2 then
		return { firstName = parts[1], middleName = "", lastName = parts[2] }
	else
		local first = parts[1]
		local last = parts[#parts]
		local middleParts: {string} = {}
		for i = 2, #parts - 1 do
			table.insert(middleParts, parts[i])
		end
		local middle = table.concat(middleParts, " ")
		return { firstName = first, middleName = middle, lastName = last }
	end
end

-- Helpers
local function stringValue(st: DataTypes.StringType?): string
	if st == nil then
		return ""
	end
	return (st :: DataTypes.StringType).value
end

local function selectedKeys(mct: DataTypes.MultipleCheckboxType?): {string}
	if mct == nil then
		return {}
	end
	return (mct :: DataTypes.MultipleCheckboxType).selectedKeys
end

local function firstNonEmpty(values: {string}): string
	for _, s in values do
		if s ~= "" then
			return s
		end
	end
	return ""
end

-- 1. Commitment
local function mapCommitment(src: SourceTable.SourceTableFieldsMap): DataTypes.MoneyType
	local raw = ""
	if src.lpSignatory ~= nil then
		local lp = src.lpSignatory :: SourceTable.LpSignatoryType
		if lp.valueSubFields ~= nil then
			raw = stringValue((lp.valueSubFields :: SourceTable.LpSignatoryFields).asaCommitmentAmount)
		end
	end
	local amountStr = string.gsub(raw, ",", "")
	local amountVal = tonumber(amountStr) or 0
	local amount = DataTypes.makeNumberType({ typeId = "Number", value = amountVal })
	local subFields = DataTypes.makeMoneySubFields({ amount = amount })
	return DataTypes.makeMoneyType({ typeId = "Money", valueSubFields = subFields })
end

-- 2. Investor Name
local function mapInvestorName(src: SourceTable.SourceTableFieldsMap): DataTypes.StringType
	local aml = stringValue(src.asaFullnameInvestornameAmlquestionnaire)
	local general = stringValue(src.asaFullnameInvestornameGeneralinfo1)
	local value = firstNonEmpty({ aml, general })
	return DataTypes.makeStringType({ typeId = "String", value = value })
end

-- 3. Regulated Status
local function mapRegulatedStatus(src: SourceTable.SourceTableFieldsMap): DataTypes.RadioGroupType
	local optionMap: {[string]: string} = {
		["yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "true",
		["no_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "false",
	}
	local keys = selectedKeys(src.luxsentityRegulatedstatusPart2Duediligencequestionnaire)
	local selectedKey = ""
	for _, k in keys do
		local mapped = optionMap[k]
		if mapped ~= nil then
			selectedKey = mapped
			break
		end
	end
	return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = selectedKey })
end

-- 4. International Supplements
local function mapInternationalSupplements(src: SourceTable.SourceTableFieldsMap): DataTypes.MultipleCheckboxType
	local optionMap: {[string]: string} = {
		["eea_indi_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
		["uk_indi_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
		["swiss_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
		["canada_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
		["japan_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
		["none_indi_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
		["eea_entity_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
		["uk_entity_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
		["swiss_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
		["canada_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
		["japan_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
		["none_entity_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
	}
	local indiKeys = selectedKeys(src.indiInternationalsupplementsPart1Duediligencequestionnaire)
	local entityKeys = selectedKeys(src.entityInternationalsupplementsPart1Duediligencequestionnaire)

	local mapped: {string} = {}
	local seen: {[string]: boolean} = {}

	local function addMapped(keys: {string})
		for _, k in keys do
			local target = optionMap[k]
			if target ~= nil and not seen[target] then
				seen[target] = true
				table.insert(mapped, target)
			end
		end
	end

	addMapped(indiKeys)
	addMapped(entityKeys)

	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = mapped })
end

-- 5. Signer Name
local function mapSignerName(src: SourceTable.SourceTableFieldsMap): (DataTypes.StringType, DataTypes.StringType, DataTypes.StringType)
	local fullname = ""
	if src.lpSignatory ~= nil then
		local lp = src.lpSignatory :: SourceTable.LpSignatoryType
		if lp.valueSubFields ~= nil then
			local fields = lp.valueSubFields :: SourceTable.LpSignatoryFields
			local ind = stringValue(fields.individualSubscribernameSignaturepage)
			local ent = stringValue(fields.entityAuthorizednameSignaturepage)
			fullname = firstNonEmpty({ ind, ent })
		end
	end
	local parts = ExampleMappings.splitName(fullname)
	return DataTypes.makeStringType({ typeId = "String", value = parts.firstName }),
		DataTypes.makeStringType({ typeId = "String", value = parts.middleName }),
		DataTypes.makeStringType({ typeId = "String", value = parts.lastName })
end

-- 6. W9 TIN Type
local function mapW9TinType(src: SourceTable.SourceTableFieldsMap): DataTypes.RadioGroupType
	if src.w9 == nil then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "EIN" })
	end
	local w9 = src.w9 :: SourceTable.W9Type
	if w9.valueSubFields == nil then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "EIN" })
	end
	local fields = w9.valueSubFields :: SourceTable.W9Fields
	local line2 = stringValue(fields.w9Line2)
	if line2 ~= "" then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "" })
	end
	local hasSsn = stringValue(fields.w9PartiSsn1) ~= ""
	local key = if hasSsn then "SSN" else "EIN"
	return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = key })
end

-- Main transform
function ExampleMappings.transform(src: SourceTable.SourceTableFieldsMap): TargetTable.TargetTableFieldsMap
	local commitment = mapCommitment(src)
	local investorName = mapInvestorName(src)
	local regulatedStatus = mapRegulatedStatus(src)
	local intlSupplements = mapInternationalSupplements(src)
	local first, middle, last = mapSignerName(src)
	local tinType = mapW9TinType(src)
	return TargetTable.makeTargetTableFieldsMap({
		sfAgreementNullCommitmentC = commitment,
		sfAccountSubscriptionInvestorName = investorName,
		sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = regulatedStatus,
		sfAgreementNullWlcInternationalSupplementsC = intlSupplements,
		sfAgreementNullSignerFirstName = first,
		sfAgreementNullSignerMiddleName = middle,
		sfAgreementNullSignerLastName = last,
		sfTaxFormW9UsTinTypeC = tinType,
	})
end

return ExampleMappings
```

- [ ] **Step 2: Write `test/test_example_mappings.luau`**

```lua
--!strict
local T = require("@lib/test_runner")
local EM = require("@lib/example_mappings")
local DataTypes = require("@lib/data_types")
local SourceTable = require("@lib/source_table")

-- Helper factory matching OCaml test_example_mappings.ml make_source
local function makeSource(config: {
	commitment: string?,
	indName: string?,
	entName: string?,
	amlName: string?,
	generalName: string?,
	regulatedKeys: {string}?,
	indiIntlKeys: {string}?,
	entityIntlKeys: {string}?,
	ssn: string?,
	ein: string?,
	w9Line2: string?,
}?): SourceTable.SourceTableFieldsMap
	local c = config or {}
	local commitment = c.commitment or "5000000"
	local indName = c.indName or ""
	local entName = c.entName or "John Doe"
	local amlName = c.amlName or ""
	local generalName = c.generalName or "ACME Corp"
	local regulatedKeys = c.regulatedKeys or { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" }
	local indiIntlKeys = c.indiIntlKeys or {}
	local entityIntlKeys = c.entityIntlKeys or {}
	local ssn = c.ssn or ""
	local ein = c.ein or ""
	local w9Line2 = c.w9Line2 or ""

	local lpFields = SourceTable.makeLpSignatoryFields({
		asaCommitmentAmount = DataTypes.makeStringType({ typeId = "String", value = commitment }),
		individualSubscribernameSignaturepage = DataTypes.makeStringType({ typeId = "String", value = indName }),
		entityAuthorizednameSignaturepage = DataTypes.makeStringType({ typeId = "String", value = entName }),
	})
	local lp = SourceTable.makeLpSignatoryType({ typeId = "CustomCompound", valueSubFields = lpFields })

	local w9Fields = SourceTable.makeW9Fields({
		w9PartiSsn1 = DataTypes.makeStringType({ typeId = "String", value = ssn }),
		w9PartiEin1 = DataTypes.makeStringType({ typeId = "String", value = ein }),
		w9Line2 = DataTypes.makeStringType({ typeId = "String", value = w9Line2 }),
	})
	local w9 = SourceTable.makeW9Type({ typeId = "CustomCompound", valueSubFields = w9Fields })

	return SourceTable.makeSourceTableFieldsMap({
		lpSignatory = lp,
		asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ typeId = "String", value = amlName }),
		asaFullnameInvestornameGeneralinfo1 = DataTypes.makeStringType({ typeId = "String", value = generalName }),
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = regulatedKeys,
		}),
		indiInternationalsupplementsPart1Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = indiIntlKeys,
		}),
		entityInternationalsupplementsPart1Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = entityIntlKeys,
		}),
		w9 = w9,
	})
end

T.describe("example_mappings", function()
	-- split_name tests (4)
	T.it("split_name full", function()
		local result = EM.splitName("John Michael Smith")
		T.expect(result.firstName).toBe("John")
		T.expect(result.middleName).toBe("Michael")
		T.expect(result.lastName).toBe("Smith")
	end)

	T.it("split_name two parts", function()
		local result = EM.splitName("Jane Doe")
		T.expect(result.firstName).toBe("Jane")
		T.expect(result.middleName).toBe("")
		T.expect(result.lastName).toBe("Doe")
	end)

	T.it("split_name empty", function()
		local result = EM.splitName("")
		T.expect(result.firstName).toBe("")
		T.expect(result.middleName).toBe("")
		T.expect(result.lastName).toBe("")
	end)

	T.it("split_name single", function()
		local result = EM.splitName("Madonna")
		T.expect(result.firstName).toBe("Madonna")
		T.expect(result.lastName).toBe("Madonna")
	end)

	-- commitment (1)
	T.it("commitment mapping", function()
		local src = makeSource({ commitment = "1,000,000" })
		local target = EM.transform(src)
		T.expect(target.sfAgreementNullCommitmentC).toBeTruthy()
		local money = target.sfAgreementNullCommitmentC :: DataTypes.MoneyType
		T.expect(money.valueSubFields).toBeTruthy()
		local sub = money.valueSubFields :: DataTypes.MoneySubFields
		T.expect(sub.amount).toBeTruthy()
		local amount = sub.amount :: DataTypes.NumberType
		T.expect(amount.value).toBe(1000000)
	end)

	-- investor name (2)
	T.it("investor name prefers aml", function()
		local src = makeSource({ amlName = "AML Name", generalName = "General Name" })
		local target = EM.transform(src)
		local nameField = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(nameField.value).toBe("AML Name")
	end)

	T.it("investor name falls back", function()
		local src = makeSource({ amlName = "", generalName = "General Name" })
		local target = EM.transform(src)
		local nameField = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(nameField.value).toBe("General Name")
	end)

	-- regulated status (2)
	T.it("regulated status yes", function()
		local src = makeSource({
			regulatedKeys = { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local radio = target.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("true")
	end)

	T.it("regulated status no", function()
		local src = makeSource({
			regulatedKeys = { "no_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local radio = target.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("false")
	end)

	-- international supplements (1)
	T.it("international supplements", function()
		local src = makeSource({
			entityIntlKeys = { "none_entity_internationalsupplements_part1_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local mc = target.sfAgreementNullWlcInternationalSupplementsC :: DataTypes.MultipleCheckboxType
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("No Supplement")
	end)

	-- signer name (2)
	T.it("signer name split", function()
		local src = makeSource({ entName = "Catherine L Ziobro", indName = "" })
		local target = EM.transform(src)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		local middle = target.sfAgreementNullSignerMiddleName :: DataTypes.StringType
		local last = target.sfAgreementNullSignerLastName :: DataTypes.StringType
		T.expect(first.value).toBe("Catherine")
		T.expect(middle.value).toBe("L")
		T.expect(last.value).toBe("Ziobro")
	end)

	T.it("signer name prefers individual", function()
		local src = makeSource({ indName = "Jane Smith", entName = "Entity Auth" })
		local target = EM.transform(src)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		T.expect(first.value).toBe("Jane")
	end)

	-- w9 tin type (3)
	T.it("w9 tin type ein", function()
		local src = makeSource({ ssn = "", ein = "" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("EIN")
	end)

	T.it("w9 tin type ssn", function()
		local src = makeSource({ ssn = "123-45-6789" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("SSN")
	end)

	T.it("w9 tin type line2", function()
		local src = makeSource({ w9Line2 = "Some LLC" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("")
	end)
end)
```

- [ ] **Step 3: Wire into test_main and run**

Add `require("@test/test_example_mappings")` to `test/test_main.luau`.

Run: `lune run test/test_main`
Expected: 36/36 passed (21 + 15 new)

- [ ] **Step 4: Commit**

```bash
git add lib/example_mappings.luau test/test_example_mappings.luau test/test_main.luau
git commit -m "feat: add example_mappings with splitName, 6 field mappings, and 15 tests"
```

---

## Task 5: CLI update and integration test

**Files:**
- Modify: `bin/main.luau`
- Create: `test/test_integration.luau`
- Modify: `test/test_main.luau`

**Depends on:** Task 4 (example_mappings)

- [ ] **Step 1: Update `bin/main.luau`**

```lua
--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local process = require("@lune/process")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")
local ExampleMappings = require("@lib/example_mappings")

if #process.args < 1 then
	print(`Usage: lune run bin/main <values.json>`)
	print("  Transforms source table JSON to target table JSON.")
	process.exit(1)
end

local inputPath = process.args[1]
local content = fs.readFile(inputPath)
local json = serde.decode("json", content)
local source = SourceTable.decodeJsonSourceTableFieldsMap(json)
local target = ExampleMappings.transform(source)
local result = TargetTable.encodeJsonTargetTableFieldsMap(target)
local output = serde.encode("json", result, true)
print(output)
```

- [ ] **Step 2: Verify CLI runs**

Run: `lune run bin/main test/fixtures/values.json`
Expected: JSON output to stdout with transformed values.

- [ ] **Step 3: Write `test/test_integration.luau`**

```lua
--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local T = require("@lib/test_runner")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")
local ExampleMappings = require("@lib/example_mappings")

-- Recursively sort all object keys for deterministic comparison
local function normalizeJson(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local t = value :: {[any]: any}
	-- Check if array
	if t[1] ~= nil then
		local result = {}
		for _, item in t do
			table.insert(result, normalizeJson(item))
		end
		return result
	end
	-- Object: sort keys
	local keys: {string} = {}
	for k in t do
		table.insert(keys, tostring(k))
	end
	table.sort(keys)
	local result: {[string]: any} = {}
	for _, k in keys do
		result[k] = normalizeJson(t[k])
	end
	return result
end

T.describe("integration", function()
	T.it("typed pipeline", function()
		local valuesPath = "test/fixtures/values.json"
		if not fs.isFile(valuesPath) then
			print("    SKIP: fixtures not found")
			return
		end

		local sourceContent = fs.readFile(valuesPath)
		local sourceJson = serde.decode("json", sourceContent)
		local source = SourceTable.decodeJsonSourceTableFieldsMap(sourceJson)
		local target = ExampleMappings.transform(source)
		local resultJson = TargetTable.encodeJsonTargetTableFieldsMap(target)

		local expectedContent = fs.readFile("test/fixtures/transformed_values.json")
		local expectedJson = serde.decode("json", expectedContent)
		local expected = TargetTable.decodeJsonTargetTableFieldsMap(expectedJson)
		local expectedReencoded = TargetTable.encodeJsonTargetTableFieldsMap(expected)

		local resultStr = serde.encode("json", normalizeJson(resultJson), true)
		local expectedStr = serde.encode("json", normalizeJson(expectedReencoded), true)

		T.expect(resultStr).toBe(expectedStr)
	end)
end)
```

- [ ] **Step 4: Wire into test_main and run all tests**

Final `test/test_main.luau`:

```lua
--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")
require("@test/test_protobuf_json")
require("@test/test_schema")
require("@test/test_json_path")
require("@test/test_transform_utils")
require("@test/test_mappings")
require("@test/test_example_mappings")
require("@test/test_integration")
T.run()
```

Run: `lune run test/test_main`
Expected: 37/37 passed (36 + 1 integration)

- [ ] **Step 5: Commit**

```bash
git add bin/main.luau test/test_integration.luau test/test_main.luau
git commit -m "feat: update CLI entry point and add integration test — all 37 tests passing"
```

---

## Verification

After all tasks, run this end-to-end check:

```bash
# 1. All tests pass
lune run test/test_main

# 2. CLI produces correct output
lune run bin/main test/fixtures/values.json

# 3. All expected files exist
ls lib/json_path.luau lib/transform_utils.luau lib/mappings.luau lib/example_mappings.luau
ls test/test_json_path.luau test/test_transform_utils.luau test/test_mappings.luau
ls test/test_example_mappings.luau test/test_integration.luau
```

Expected: 37/37 tests pass (9 existing + 4 json_path + 6 transform_utils + 2 mappings + 15 example_mappings + 1 integration). CLI outputs transformed JSON matching `test/fixtures/transformed_values.json`.
