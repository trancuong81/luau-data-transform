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
