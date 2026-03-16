--!strict

local Wire = require("@lib/pb/wire")
local DataTypes = require("@lib/data_types")

local Encoder = {}

-- ============================================================
-- Helper functions
-- ============================================================

local function encodeNested(wb: Wire.WriteBuf, fieldNumber: number, encodeFn: (Wire.WriteBuf) -> ())
	local inner = Wire.WriteBuf.new()
	encodeFn(inner)
	local bytes = inner:tostring()
	if #bytes > 0 then
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeBytes(wb, bytes)
	end
end

local function encodeStringField(wb: Wire.WriteBuf, fieldNumber: number, value: string)
	if value == "" then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
	Wire.encodeString(wb, value)
end

local function encodeOptionalStringField(wb: Wire.WriteBuf, fieldNumber: number, value: string?)
	if value == nil or value == "" then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
	Wire.encodeString(wb, value)
end

local function encodeRepeatedStringField(wb: Wire.WriteBuf, fieldNumber: number, values: {string})
	for _, v in values do
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeString(wb, v)
	end
end

local function encodeDoubleField(wb: Wire.WriteBuf, fieldNumber: number, value: number)
	if value == 0 then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.FIXED64)
	Wire.encodeDouble(wb, value)
end

local function encodeOptionalDoubleField(wb: Wire.WriteBuf, fieldNumber: number, value: number?)
	if value == nil or value == 0 then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.FIXED64)
	Wire.encodeDouble(wb, value)
end

local function encodeInt32Field(wb: Wire.WriteBuf, fieldNumber: number, value: number)
	if value == 0 then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.VARINT)
	Wire.encodeInt32(wb, value)
end

local function encodeBoolField(wb: Wire.WriteBuf, fieldNumber: number, value: boolean)
	if not value then
		return
	end
	Wire.encodeTag(wb, fieldNumber, Wire.VARINT)
	Wire.encodeBool(wb, value)
end

-- ============================================================
-- Inner encode functions
-- ============================================================

local function encodePbStringTypeInner(wb: Wire.WriteBuf, st: DataTypes.StringType)
	encodeStringField(wb, 1, st.typeId)
	encodeStringField(wb, 2, st.value)
	encodeOptionalStringField(wb, 3, st.regex)
	encodeRepeatedStringField(wb, 4, st.formatPatterns)
end

local function encodePbNumberTypeInner(wb: Wire.WriteBuf, nt: DataTypes.NumberType)
	encodeStringField(wb, 1, nt.typeId)
	encodeDoubleField(wb, 2, nt.value)
	encodeInt32Field(wb, 3, nt.decimalPlaces)
	encodeOptionalDoubleField(wb, 4, nt.minValue)
	encodeOptionalDoubleField(wb, 5, nt.maxValue)
end

local function encodePbBooleanTypeInner(wb: Wire.WriteBuf, bt: DataTypes.BooleanType)
	encodeStringField(wb, 1, bt.typeId)
	encodeBoolField(wb, 2, bt.value)
end

local function encodePbEnumTypeInner(wb: Wire.WriteBuf, et: DataTypes.EnumType)
	encodeStringField(wb, 1, et.typeId)
	encodeStringField(wb, 2, et.value)
	encodeRepeatedStringField(wb, 3, et.options)
end

local function encodePbMultipleCheckboxTypeInner(wb: Wire.WriteBuf, mc: DataTypes.MultipleCheckboxType)
	encodeStringField(wb, 1, mc.typeId)
	encodeRepeatedStringField(wb, 2, mc.selectedKeys)
	encodeRepeatedStringField(wb, 3, mc.allOptionKeysInOrder)
	encodeRepeatedStringField(wb, 4, mc.allOptionLabelsInOrder)
end

local function encodePbRadioGroupTypeInner(wb: Wire.WriteBuf, rg: DataTypes.RadioGroupType)
	encodeStringField(wb, 1, rg.typeId)
	encodeStringField(wb, 2, rg.selectedKey)
	encodeRepeatedStringField(wb, 3, rg.allOptionKeysInOrder)
	encodeRepeatedStringField(wb, 4, rg.allOptionLabelsInOrder)
end

-- ============================================================
-- Public encode functions
-- ============================================================

function Encoder.encodePbStringType(st: DataTypes.StringType): string
	local wb = Wire.WriteBuf.new()
	encodePbStringTypeInner(wb, st)
	return wb:tostring()
end

function Encoder.encodePbNumberType(nt: DataTypes.NumberType): string
	local wb = Wire.WriteBuf.new()
	encodePbNumberTypeInner(wb, nt)
	return wb:tostring()
end

function Encoder.encodePbBooleanType(bt: DataTypes.BooleanType): string
	local wb = Wire.WriteBuf.new()
	encodePbBooleanTypeInner(wb, bt)
	return wb:tostring()
end

function Encoder.encodePbEnumType(et: DataTypes.EnumType): string
	local wb = Wire.WriteBuf.new()
	encodePbEnumTypeInner(wb, et)
	return wb:tostring()
end

function Encoder.encodePbMultipleCheckboxType(mc: DataTypes.MultipleCheckboxType): string
	local wb = Wire.WriteBuf.new()
	encodePbMultipleCheckboxTypeInner(wb, mc)
	return wb:tostring()
end

function Encoder.encodePbRadioGroupType(rg: DataTypes.RadioGroupType): string
	local wb = Wire.WriteBuf.new()
	encodePbRadioGroupTypeInner(wb, rg)
	return wb:tostring()
end

-- ============================================================
-- _inner export table (for Task 3 compound/union encoders)
-- ============================================================

Encoder._inner = {
	encodePbStringType = encodePbStringTypeInner,
	encodePbNumberType = encodePbNumberTypeInner,
	encodePbBooleanType = encodePbBooleanTypeInner,
	encodePbEnumType = encodePbEnumTypeInner,
	encodePbMultipleCheckboxType = encodePbMultipleCheckboxTypeInner,
	encodePbRadioGroupType = encodePbRadioGroupTypeInner,
	encodeNested = encodeNested,
	encodeStringField = encodeStringField,
	encodeOptionalStringField = encodeOptionalStringField,
	encodeRepeatedStringField = encodeRepeatedStringField,
	encodeDoubleField = encodeDoubleField,
	encodeOptionalDoubleField = encodeOptionalDoubleField,
	encodeInt32Field = encodeInt32Field,
	encodeBoolField = encodeBoolField,
}

return Encoder
