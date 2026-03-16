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
