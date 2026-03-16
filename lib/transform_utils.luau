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
