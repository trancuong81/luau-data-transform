--!strict

local Wire = require("@lib/pb/wire")
local DataTypes = require("@lib/data_types")

local Decoder = {}

-- ============================================================
-- Inner decode functions
-- ============================================================

local function decodePbStringTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.StringType
	local result = DataTypes.makeStringType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.value, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			result.regex, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.formatPatterns, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbNumberTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.NumberType
	local result = DataTypes.makeNumberType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.FIXED64 then
			result.value, offset = Wire.decodeDouble(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.VARINT then
			result.decimalPlaces, offset = Wire.decodeInt32(buf, offset)
		elseif fieldNum == 4 and wireType == Wire.FIXED64 then
			result.minValue, offset = Wire.decodeDouble(buf, offset)
		elseif fieldNum == 5 and wireType == Wire.FIXED64 then
			result.maxValue, offset = Wire.decodeDouble(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbBooleanTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BooleanType
	local result = DataTypes.makeBooleanType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.VARINT then
			result.value, offset = Wire.decodeBool(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbEnumTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.EnumType
	local result = DataTypes.makeEnumType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.value, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.options, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbMultipleCheckboxTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.MultipleCheckboxType
	local result = DataTypes.makeMultipleCheckboxType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.selectedKeys, val)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionLabelsInOrder, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbRadioGroupTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.RadioGroupType
	local result = DataTypes.makeRadioGroupType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.selectedKey, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionLabelsInOrder, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- ============================================================
-- Public decode functions
-- ============================================================

function Decoder.decodePbStringType(bytes: string): DataTypes.StringType
	local buf = buffer.fromstring(bytes)
	return decodePbStringTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbNumberType(bytes: string): DataTypes.NumberType
	local buf = buffer.fromstring(bytes)
	return decodePbNumberTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBooleanType(bytes: string): DataTypes.BooleanType
	local buf = buffer.fromstring(bytes)
	return decodePbBooleanTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbEnumType(bytes: string): DataTypes.EnumType
	local buf = buffer.fromstring(bytes)
	return decodePbEnumTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbMultipleCheckboxType(bytes: string): DataTypes.MultipleCheckboxType
	local buf = buffer.fromstring(bytes)
	return decodePbMultipleCheckboxTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbRadioGroupType(bytes: string): DataTypes.RadioGroupType
	local buf = buffer.fromstring(bytes)
	return decodePbRadioGroupTypeFromBuf(buf, 0, buffer.len(buf))
end

-- ============================================================
-- _inner export table (for Task 3 compound/union decoders)
-- ============================================================

Decoder._inner = {
	decodePbStringType = decodePbStringTypeFromBuf,
	decodePbNumberType = decodePbNumberTypeFromBuf,
	decodePbBooleanType = decodePbBooleanTypeFromBuf,
	decodePbEnumType = decodePbEnumTypeFromBuf,
	decodePbMultipleCheckboxType = decodePbMultipleCheckboxTypeFromBuf,
	decodePbRadioGroupType = decodePbRadioGroupTypeFromBuf,
}

return Decoder
