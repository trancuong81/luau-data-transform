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
