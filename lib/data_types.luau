--!strict
local DataTypes = {}

-- Simple Type Definitions (6)

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

-- Simple Type Constructors

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

-- Simple Type JSON Encode/Decode

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
