--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local process = require("@lune/process")
local Schema = require("@lib/schema")
local SourceFeederTable = require("@lib/source_feeder_table")
local SourceMasterTable = require("@lib/source_master_table")
local SourceW9Table = require("@lib/source_w9_table")
local FullTargetTable = require("@lib/full_target_table")
local CarlyleMappings = require("@lib/carlyle_mappings")

if #process.args < 1 then
	print("Usage: lune run bin/carlyle_transform <input.json>")
	print("  Transforms Carlyle source tables to full target table.")
	print("  Input JSON has namespaces: contact, w9, feeder, master (all optional).")
	process.exit(1)
end

local inputPath = process.args[1]
local content = fs.readFile(inputPath)
local input = serde.decode("json", content)

-- Decode each namespace (all optional)
local feeder = nil
if input.feeder ~= nil then
	feeder = SourceFeederTable.decodeJsonSourceFeederTableFieldsMap(Schema.camelcaseKeys(input.feeder))
end

local master = nil
if input.master ~= nil then
	master = SourceMasterTable.decodeJsonSourceMasterTableFieldsMap(Schema.camelcaseKeys(input.master))
end

local w9 = nil
if input.w9 ~= nil then
	w9 = SourceW9Table.decodeJsonSourceW9TableFieldsMap(Schema.camelcaseKeys(input.w9))
end

-- Contact passed as raw JSON (contactInfo is an array)
local contact = nil
if input.contact ~= nil then
	contact = Schema.camelcaseKeys(input.contact)
end

-- Run transform
local result = CarlyleMappings.transform(contact, w9, feeder, master)

-- Extract compound array fields before encoding (the encoder treats them as single objects)
local COMPOUND_ARRAY_FIELDS = {"sfBeneficialOwner", "sfControllingPersons", "sfContact"}
local resultAny = result :: any
local arrayData: {[string]: {any}} = {}
for _, camelKey in COMPOUND_ARRAY_FIELDS do
	if resultAny[camelKey] ~= nil then
		arrayData[camelKey] = resultAny[camelKey]
		resultAny[camelKey] = nil
	end
end

-- Encode scalar fields only (arrays have been extracted)
local resultJson = FullTargetTable.encodeJsonFullTargetTableFieldsMap(result)

-- Build camelCase→snake_case reverse maps from constants
local constantsContent = fs.readFile("proto/tables/full_target_table_constants.json")
local constants = serde.decode("json", constantsContent)

local camelToSnake: {[string]: string} = {}
for _, snakeKey in constants.field_keys_in_order do
	local camelKey = Schema.snakeToCamel(snakeKey)
	camelToSnake[camelKey] = snakeKey
end

-- Sub-field reverse maps for compound fields
local compoundSubMaps: {[string]: {[string]: string}} = {}
for _, snakeKey in constants.field_keys_in_order do
	local fieldDef = constants.fields_map[snakeKey]
	if fieldDef and fieldDef.sub_field_keys_in_order and #fieldDef.sub_field_keys_in_order > 0 then
		local camelKey = Schema.snakeToCamel(snakeKey)
		local subMap: {[string]: string} = {}
		for _, subSnakeKey in fieldDef.sub_field_keys_in_order do
			local subCamelKey = Schema.snakeToCamel(subSnakeKey)
			subMap[subCamelKey] = subSnakeKey
		end
		compoundSubMaps[camelKey] = subMap
	end
end

-- Per-field encoders for compound array element sub-fields
local COMPOUND_ENCODERS: {[string]: (any) -> {[string]: any}} = {
	sfBeneficialOwner = FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerFields :: any,
	sfControllingPersons = FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsFields :: any,
	sfContact = FullTargetTable.encodeJsonFullTargetTableSfContactFields :: any,
}

-- Remap top-level keys; for compounds, also remap sub-field keys
local remapped: {[string]: any} = {}
for camelKey, value in resultJson do
	local snakeKey = camelToSnake[camelKey] or camelKey
	if compoundSubMaps[camelKey] and type(value) == "table" and value.valueSubFields ~= nil then
		local subMap = compoundSubMaps[camelKey]
		local remappedSubs: {[string]: any} = {}
		for subCamelKey, subValue in value.valueSubFields do
			local subSnakeKey = subMap[subCamelKey] or subCamelKey
			remappedSubs[subSnakeKey] = subValue
		end
		remapped[snakeKey] = {
			type_id = value.typeId,
			value_sub_fields = remappedSubs,
			sub_field_keys_in_order = value.subFieldKeysInOrder,
			label = value.label,
		}
	else
		remapped[snakeKey] = value
	end
end

-- Encode and remap compound array fields separately
for camelKey, arr in arrayData do
	local snakeKey = camelToSnake[camelKey] or camelKey
	local subMap = compoundSubMaps[camelKey] or {}
	local encoder = COMPOUND_ENCODERS[camelKey]
	local encodedArr: {any} = {}
	for _, elem in arr do
		if elem.valueSubFields ~= nil and encoder ~= nil then
			local encodedSubs = encoder(elem.valueSubFields)
			local remappedSubs: {[string]: any} = {}
			for subCamelKey, subValue in encodedSubs do
				local subSnakeKey = subMap[subCamelKey] or subCamelKey
				remappedSubs[subSnakeKey] = subValue
			end
			table.insert(encodedArr, remappedSubs)
		end
	end
	if #encodedArr > 0 then
		remapped[snakeKey] = encodedArr
	end
end

-- Strip empty tables (e.g. formatPatterns: {}, allOptionKeysInOrder: {})
-- Preserves arrays (integer-keyed tables) and recurses into their elements.
local function stripEmpty(t: any): any
	if type(t) ~= "table" then return t end
	-- Detect array (has integer key 1)
	if (t :: any)[1] ~= nil then
		local arr: {any} = {}
		for _, v in t :: {any} do
			table.insert(arr, stripEmpty(v))
		end
		return arr
	end
	local result: {[string]: any} = {}
	for k, v in t do
		if type(v) == "table" then
			if next(v) ~= nil then
				result[k] = stripEmpty(v)
			end
		else
			result[k] = v
		end
	end
	return result
end

local output = serde.encode("json", stripEmpty(remapped), true)
print(output)
