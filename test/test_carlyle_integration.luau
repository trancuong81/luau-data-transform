--!strict
local T = require("@lib/test_runner")
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local CM = require("@lib/carlyle_mappings")
local SourceFeederTable = require("@lib/source_feeder_table")
local SourceMasterTable = require("@lib/source_master_table")
local SourceW9Table = require("@lib/source_w9_table")
local FullTargetTable = require("@lib/full_target_table")
local Schema = require("@lib/schema")

-- ============================================================
-- Helpers
-- ============================================================

-- Array field names that are arrays of compound types in the transform output
local ARRAY_FIELDS: { string } = { "sfControllingPersons", "sfBeneficialOwner", "sfContact" }

-- Strip rawValue wrappers from fixture data.
-- The master table fixture wraps every field in { rawValue: { typeId, value/selectedKeys } }.
-- The decoders expect the inner value directly.
local function stripRawValue(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local t = value :: { [any]: any }
	-- Check if array (has integer key 1, or is empty)
	if t[1] ~= nil then
		local result = {}
		for _, item in t do
			table.insert(result, stripRawValue(item))
		end
		return result
	end
	-- Check for rawValue wrapper
	if t.rawValue ~= nil then
		return stripRawValue(t.rawValue)
	end
	-- Recurse into dict values (for compound types with sub-fields)
	local result: { [string]: any } = {}
	for k, v in t do
		result[tostring(k)] = stripRawValue(v)
	end
	return result
end

-- Fixture compound fields (like address_ubo_1) are stored as flat dicts of sub-fields:
--   { sub_field_name: { typeId: "String", value: "..." }, ... }
-- But the decoders expect the compound wrapper format:
--   { typeId: "CustomCompound", valueSubFields: { sub_field_name: ... }, subFieldKeysInOrder: {} }
-- This function detects flat compound dicts and wraps them.
local function wrapFlatCompounds(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local t = value :: { [any]: any }
	-- Array check
	if t[1] ~= nil then
		local result = {}
		for _, item in t do
			table.insert(result, wrapFlatCompounds(item))
		end
		return result
	end
	-- If it has typeId, it's already typed (String, MultipleCheckbox, or compound wrapper)
	if t.typeId ~= nil then
		-- Recurse into valueSubFields if present
		local result: { [string]: any } = {}
		for k, v in t do
			if tostring(k) == "valueSubFields" and v ~= nil and type(v) == "table" then
				result[tostring(k)] = wrapFlatCompounds(v)
			else
				result[tostring(k)] = v
			end
		end
		return result
	end
	-- No typeId. Check if all values are typed dicts (have typeId).
	-- If so, this is a flat compound dict that needs wrapping.
	local allTyped = true
	local hasAny = false
	for _, v in t do
		hasAny = true
		if type(v) ~= "table" or (v :: { [string]: any }).typeId == nil then
			allTyped = false
			break
		end
	end
	if hasAny and allTyped then
		-- Wrap as compound
		return {
			typeId = "CustomCompound",
			valueSubFields = t,
			subFieldKeysInOrder = {},
		}
	end
	-- Otherwise recurse into dict values (e.g., the top-level input dict)
	local result: { [string]: any } = {}
	for k, v in t do
		result[tostring(k)] = wrapFlatCompounds(v)
	end
	return result
end

-- Compare a StringType field: check .value
local function compareStringField(
	fieldName: string,
	actual: { [string]: any }?,
	expected: { [string]: any }?,
	mismatches: { string }
)
	if actual == nil and expected == nil then
		return
	end
	if actual == nil then
		-- We didn't produce it but expected has it; only log if expected has a non-empty value
		if expected ~= nil and expected.value ~= nil and expected.value ~= "" then
			table.insert(mismatches, fieldName .. ": actual=nil, expected=" .. tostring(expected.value))
		end
		return
	end
	if expected == nil then
		-- We produced it but expected doesn't have it; skip (we produce extra empty fields)
		return
	end
	local actualVal = actual.value or ""
	local expectedVal = expected.value or ""
	if tostring(actualVal) ~= tostring(expectedVal) then
		table.insert(mismatches, fieldName .. ": actual=" .. tostring(actualVal) .. ", expected=" .. tostring(expectedVal))
	end
end

-- Compare a MultipleCheckboxType field: check .selectedKeys (order-independent)
local function compareMCField(
	fieldName: string,
	actual: { [string]: any }?,
	expected: { [string]: any }?,
	mismatches: { string }
)
	if actual == nil and expected == nil then
		return
	end
	if actual == nil then
		if expected ~= nil and expected.selectedKeys ~= nil and #(expected.selectedKeys :: { any }) > 0 then
			table.insert(mismatches, fieldName .. ": actual=nil, expected has selectedKeys")
		end
		return
	end
	if expected == nil then
		return
	end
	local actualKeys: { string } = {}
	if actual.selectedKeys ~= nil then
		for _, k in actual.selectedKeys :: { any } do
			table.insert(actualKeys, tostring(k))
		end
	end
	local expectedKeys: { string } = {}
	if expected.selectedKeys ~= nil then
		for _, k in expected.selectedKeys :: { any } do
			table.insert(expectedKeys, tostring(k))
		end
	end
	table.sort(actualKeys)
	table.sort(expectedKeys)
	local actualStr = table.concat(actualKeys, ",")
	local expectedStr = table.concat(expectedKeys, ",")
	if actualStr ~= expectedStr then
		table.insert(mismatches, fieldName .. ": selectedKeys actual=[" .. actualStr .. "], expected=[" .. expectedStr .. "]")
	end
end

-- Compare two encoded field values based on typeId
local function compareField(
	fieldName: string,
	actual: any,
	expected: any,
	mismatches: { string }
)
	if actual == nil then
		-- Only log if expected is non-trivial
		if expected ~= nil and type(expected) == "table" then
			local exp = expected :: { [string]: any }
			local typeId = exp.typeId
			if typeId == "String" then
				if exp.value ~= nil and exp.value ~= "" then
					table.insert(mismatches, fieldName .. ": actual=nil, expected=" .. tostring(exp.value))
				end
			elseif typeId == "MultipleCheckbox" then
				if exp.selectedKeys ~= nil and #(exp.selectedKeys :: { any }) > 0 then
					table.insert(mismatches, fieldName .. ": actual=nil, expected has selectedKeys")
				end
			end
		end
		return
	end

	if expected == nil or type(expected) ~= "table" then
		return
	end

	local actualT = actual :: { [string]: any }
	local expectedT = expected :: { [string]: any }
	local typeId = actualT.typeId or expectedT.typeId

	if typeId == "String" then
		compareStringField(fieldName, actualT, expectedT, mismatches)
	elseif typeId == "MultipleCheckbox" then
		compareMCField(fieldName, actualT, expectedT, mismatches)
	end
end

-- Per-field encoders for compound array element sub-fields
local COMPOUND_ENCODERS: {[string]: (any) -> {[string]: any}} = {
	sfBeneficialOwner = FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerFields :: any,
	sfControllingPersons = FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsFields :: any,
	sfContact = FullTargetTable.encodeJsonFullTargetTableSfContactFields :: any,
}

-- Encode a compound array: each element's valueSubFields is encoded via the per-field encoder.
-- Returns an array of flat encoded sub-field dicts (same shape as the CLI output).
local function encodeCompoundArray(camelKey: string, arr: {any}): {any}
	local encoder = COMPOUND_ENCODERS[camelKey]
	if encoder == nil then return {} end
	local encodedArr: {any} = {}
	for _, elem in arr do
		if elem.valueSubFields ~= nil then
			table.insert(encodedArr, encoder(elem.valueSubFields))
		end
	end
	return encodedArr
end

-- Compare array fields (sf_BeneficialOwner, sf_Contact, sf_ControllingPersons).
-- Both actualArray and expectedArray are flat dicts of {subFieldKey: encodedValue, ...}
local function compareArrayField(
	fieldName: string,
	actualArray: { any },
	expectedArray: { any },
	mismatches: { string }
)
	local minLen = math.min(#actualArray, #expectedArray)
	if #actualArray ~= #expectedArray then
		table.insert(mismatches, fieldName .. ": array length actual=" .. tostring(#actualArray) .. ", expected=" .. tostring(#expectedArray))
	end

	for i = 1, minLen do
		local actualElem = actualArray[i] :: { [string]: any }
		local expectedElem = expectedArray[i] :: { [string]: any }

		-- Both are flat dicts of sub-field keys -> encoded values
		for subKey, expVal in expectedElem do
			-- Skip metadata keys that aren't sub-fields
			if subKey ~= "typeId" and subKey ~= "subFieldKeysInOrder" and subKey ~= "label" then
				local actVal = actualElem[subKey]
				compareField(fieldName .. "[" .. tostring(i) .. "]." .. subKey, actVal, expVal, mismatches)
			end
		end
	end
end

-- ============================================================
-- Tests
-- ============================================================

T.describe("carlyle_integration", function()
	T.it("feeder table end-to-end", function()
		-- 1. Read input, strip rawValue wrappers, convert snake_case keys to camelCase
		--    (fixtures use snake_case + rawValue wrappers; decoders expect camelCase)
		local inputContent = fs.readFile("test/fixtures/test-feeder-table-input.json")
		local inputRaw = serde.decode("json", inputContent) :: { [string]: any }
		local input = Schema.camelcaseKeys(wrapFlatCompounds(stripRawValue(inputRaw))) :: { [string]: any }

		-- 2. Decode sources
		local feeder = SourceFeederTable.decodeJsonSourceFeederTableFieldsMap(input.feeder)
		local w9 = SourceW9Table.decodeJsonSourceW9TableFieldsMap(input.w9)

		-- 3. Transform
		local result = CM.transform(input.contact, w9, feeder, nil)

		-- 4. Extract compound array fields before encoding (encoder treats them as single objects)
		local resultAny = result :: any
		local arrayData: {[string]: {any}} = {}
		for _, camelKey in ARRAY_FIELDS do
			if resultAny[camelKey] ~= nil then
				arrayData[camelKey] = resultAny[camelKey]
				resultAny[camelKey] = nil
			end
		end

		-- 5. Encode scalar fields
		local encoded = FullTargetTable.encodeJsonFullTargetTableFieldsMap(result)

		-- 6. Encode compound array fields separately
		local encodedArrays: {[string]: {any}} = {}
		for camelKey, arr in arrayData do
			encodedArrays[camelKey] = encodeCompoundArray(camelKey, arr)
		end

		-- 7. Load expected output and convert keys to camelCase
		local expectedContent = fs.readFile("test/fixtures/test-feeder-table-output.json")
		local expectedRaw = serde.decode("json", expectedContent) :: { [string]: any }
		local expectedInner = Schema.camelcaseKeys(expectedRaw[""])

		-- 8. Compare scalar fields
		local mismatches: { string } = {}
		for fieldName, actualVal in encoded :: { [string]: any } do
			-- Skip array fields in the scalar comparison
			local isArray = false
			for _, af in ARRAY_FIELDS do
				if fieldName == af then
					isArray = true
					break
				end
			end
			if not isArray then
				local expVal = (expectedInner :: { [string]: any })[fieldName]
				compareField(fieldName, actualVal, expVal, mismatches)
			end
		end

		-- 9. Compare array fields (from encoded output, not pre-encoded result)
		for _, arrayFieldName in ARRAY_FIELDS do
			local actualArray = encodedArrays[arrayFieldName]
			local expectedArray = (expectedInner :: { [string]: any })[arrayFieldName]
			if actualArray ~= nil and expectedArray ~= nil then
				if type(expectedArray) == "table" then
					compareArrayField(arrayFieldName, actualArray :: any, expectedArray :: any, mismatches)
				end
			elseif actualArray ~= nil and expectedArray == nil then
				table.insert(mismatches, arrayFieldName .. ": actual has array but expected is nil")
			end
		end

		-- 8. Report
		if #mismatches > 0 then
			local limit = math.min(#mismatches, 30)
			print("    Feeder mismatches (" .. tostring(#mismatches) .. " total, showing first " .. tostring(limit) .. "):")
			for i = 1, limit do
				print("      " .. mismatches[i])
			end
		end
		T.expect(#mismatches).toBe(0)
	end)

	T.it("master table end-to-end", function()
		-- 1. Read input, strip rawValue wrappers, convert snake_case keys to camelCase
		local inputContent = fs.readFile("test/fixtures/test-master-table-input.json")
		local inputRaw = serde.decode("json", inputContent) :: { [string]: any }
		local input = Schema.camelcaseKeys(wrapFlatCompounds(stripRawValue(inputRaw))) :: { [string]: any }

		-- 2. Decode sources
		local master = SourceMasterTable.decodeJsonSourceMasterTableFieldsMap(input.master)

		-- 3. Transform (no feeder, no w9)
		local result = CM.transform(input.contact, nil, nil, master)

		-- 4. Extract compound array fields before encoding
		local resultAny = result :: any
		local arrayData: {[string]: {any}} = {}
		for _, camelKey in ARRAY_FIELDS do
			if resultAny[camelKey] ~= nil then
				arrayData[camelKey] = resultAny[camelKey]
				resultAny[camelKey] = nil
			end
		end

		-- 5. Encode scalar fields
		local encoded = FullTargetTable.encodeJsonFullTargetTableFieldsMap(result)

		-- 6. Encode compound array fields separately
		local encodedArrays: {[string]: {any}} = {}
		for camelKey, arr in arrayData do
			encodedArrays[camelKey] = encodeCompoundArray(camelKey, arr)
		end

		-- 7. Load expected output and convert keys to camelCase
		local expectedContent = fs.readFile("test/fixtures/test-master-table-output.json")
		local expectedRaw = serde.decode("json", expectedContent) :: { [string]: any }
		local expectedInner = Schema.camelcaseKeys(expectedRaw[""])

		-- 8. Compare scalar fields
		local mismatches: { string } = {}
		for fieldName, actualVal in encoded :: { [string]: any } do
			local isArray = false
			for _, af in ARRAY_FIELDS do
				if fieldName == af then
					isArray = true
					break
				end
			end
			if not isArray then
				local expVal = (expectedInner :: { [string]: any })[fieldName]
				compareField(fieldName, actualVal, expVal, mismatches)
			end
		end

		-- 9. Compare array fields (from encoded output, not pre-encoded result)
		for _, arrayFieldName in ARRAY_FIELDS do
			local actualArray = encodedArrays[arrayFieldName]
			local expectedArray = (expectedInner :: { [string]: any })[arrayFieldName]
			if actualArray ~= nil and expectedArray ~= nil then
				if type(expectedArray) == "table" then
					compareArrayField(arrayFieldName, actualArray :: any, expectedArray :: any, mismatches)
				end
			elseif actualArray ~= nil and expectedArray == nil then
				table.insert(mismatches, arrayFieldName .. ": actual has array but expected is nil")
			end
		end

		-- 8. Report
		if #mismatches > 0 then
			local limit = math.min(#mismatches, 30)
			print("    Master mismatches (" .. tostring(#mismatches) .. " total, showing first " .. tostring(limit) .. "):")
			for i = 1, limit do
				print("      " .. mismatches[i])
			end
		end
		T.expect(#mismatches).toBe(0)
	end)
end)
