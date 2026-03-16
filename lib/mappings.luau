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
