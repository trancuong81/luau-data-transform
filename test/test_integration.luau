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
