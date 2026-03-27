--!strict
local DataTypes = require("@lib/data_types")

local SourceW9Table = {}

export type SourceW9TableFieldsMap = {
	w9Line1: DataTypes.StringType?,
	w9Line2: DataTypes.StringType?,
	w9Line31: DataTypes.MultipleCheckboxType?,
	w9Line31LLCclass: DataTypes.StringType?,
	w9Line4Exemptpayee: DataTypes.StringType?,
	w9Line4Exemptfatca: DataTypes.StringType?,
	w9Line31OtherSpecify: DataTypes.StringType?,
	foreignpartnerGroup: DataTypes.MultipleCheckboxType?,
	w9Line5: DataTypes.StringType?,
	w9Requesterinformation: DataTypes.StringType?,
	w9CityLine6: DataTypes.StringType?,
	w9StateLine6: DataTypes.StringType?,
	w9ZipLine6: DataTypes.StringType?,
	w9CountryLine6: DataTypes.StringType?,
	w9Line7: DataTypes.StringType?,
	w9PartiSsn1: DataTypes.StringType?,
	w9PartiEin1: DataTypes.StringType?,
	w9SignatureDate: DataTypes.StringType?,
}

export type SourceW9TableSchema = {
	fieldsMap: SourceW9TableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

function SourceW9Table.makeSourceW9TableFieldsMap(config: {
	w9Line1: DataTypes.StringType?,
	w9Line2: DataTypes.StringType?,
	w9Line31: DataTypes.MultipleCheckboxType?,
	w9Line31LLCclass: DataTypes.StringType?,
	w9Line4Exemptpayee: DataTypes.StringType?,
	w9Line4Exemptfatca: DataTypes.StringType?,
	w9Line31OtherSpecify: DataTypes.StringType?,
	foreignpartnerGroup: DataTypes.MultipleCheckboxType?,
	w9Line5: DataTypes.StringType?,
	w9Requesterinformation: DataTypes.StringType?,
	w9CityLine6: DataTypes.StringType?,
	w9StateLine6: DataTypes.StringType?,
	w9ZipLine6: DataTypes.StringType?,
	w9CountryLine6: DataTypes.StringType?,
	w9Line7: DataTypes.StringType?,
	w9PartiSsn1: DataTypes.StringType?,
	w9PartiEin1: DataTypes.StringType?,
	w9SignatureDate: DataTypes.StringType?,
}?): SourceW9TableFieldsMap
	local c = config or {}
	return {
		w9Line1 = c.w9Line1,
		w9Line2 = c.w9Line2,
		w9Line31 = c.w9Line31,
		w9Line31LLCclass = c.w9Line31LLCclass,
		w9Line4Exemptpayee = c.w9Line4Exemptpayee,
		w9Line4Exemptfatca = c.w9Line4Exemptfatca,
		w9Line31OtherSpecify = c.w9Line31OtherSpecify,
		foreignpartnerGroup = c.foreignpartnerGroup,
		w9Line5 = c.w9Line5,
		w9Requesterinformation = c.w9Requesterinformation,
		w9CityLine6 = c.w9CityLine6,
		w9StateLine6 = c.w9StateLine6,
		w9ZipLine6 = c.w9ZipLine6,
		w9CountryLine6 = c.w9CountryLine6,
		w9Line7 = c.w9Line7,
		w9PartiSsn1 = c.w9PartiSsn1,
		w9PartiEin1 = c.w9PartiEin1,
		w9SignatureDate = c.w9SignatureDate,
	}
end

function SourceW9Table.makeSourceW9TableSchema(config: {
	fieldsMap: SourceW9TableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): SourceW9TableSchema
	local c = config or {}
	return {
		fieldsMap = c.fieldsMap,
		fieldKeysInOrder = c.fieldKeysInOrder or {},
		label = c.label or "",
	}
end

local function decodeOptionalMultipleCheckboxType(json: any): DataTypes.MultipleCheckboxType?
	if json == nil then return nil end
	return DataTypes.decodeJsonMultipleCheckboxType(json)
end
local function encodeOptionalMultipleCheckboxType(v: DataTypes.MultipleCheckboxType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonMultipleCheckboxType(v)
end
local function decodeOptionalStringType(json: any): DataTypes.StringType?
	if json == nil then return nil end
	return DataTypes.decodeJsonStringType(json)
end
local function encodeOptionalStringType(v: DataTypes.StringType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonStringType(v)
end

function SourceW9Table.encodeJsonSourceW9TableFieldsMap(so: SourceW9TableFieldsMap): {[string]: any}
	local result: {[string]: any} = {
	}
	result.w9Line1 = encodeOptionalStringType(so.w9Line1)
	result.w9Line2 = encodeOptionalStringType(so.w9Line2)
	result.w9Line31 = encodeOptionalMultipleCheckboxType(so.w9Line31)
	result.w9Line31LLCclass = encodeOptionalStringType(so.w9Line31LLCclass)
	result.w9Line4Exemptpayee = encodeOptionalStringType(so.w9Line4Exemptpayee)
	result.w9Line4Exemptfatca = encodeOptionalStringType(so.w9Line4Exemptfatca)
	result.w9Line31OtherSpecify = encodeOptionalStringType(so.w9Line31OtherSpecify)
	result.foreignpartnerGroup = encodeOptionalMultipleCheckboxType(so.foreignpartnerGroup)
	result.w9Line5 = encodeOptionalStringType(so.w9Line5)
	result.w9Requesterinformation = encodeOptionalStringType(so.w9Requesterinformation)
	result.w9CityLine6 = encodeOptionalStringType(so.w9CityLine6)
	result.w9StateLine6 = encodeOptionalStringType(so.w9StateLine6)
	result.w9ZipLine6 = encodeOptionalStringType(so.w9ZipLine6)
	result.w9CountryLine6 = encodeOptionalStringType(so.w9CountryLine6)
	result.w9Line7 = encodeOptionalStringType(so.w9Line7)
	result.w9PartiSsn1 = encodeOptionalStringType(so.w9PartiSsn1)
	result.w9PartiEin1 = encodeOptionalStringType(so.w9PartiEin1)
	result.w9SignatureDate = encodeOptionalStringType(so.w9SignatureDate)
	return result
end

function SourceW9Table.decodeJsonSourceW9TableFieldsMap(json: {[string]: any}): SourceW9TableFieldsMap
	return {
		w9Line1 = decodeOptionalStringType(json.w9Line1),
		w9Line2 = decodeOptionalStringType(json.w9Line2),
		w9Line31 = decodeOptionalMultipleCheckboxType(json.w9Line31),
		w9Line31LLCclass = decodeOptionalStringType(json.w9Line31LLCclass),
		w9Line4Exemptpayee = decodeOptionalStringType(json.w9Line4Exemptpayee),
		w9Line4Exemptfatca = decodeOptionalStringType(json.w9Line4Exemptfatca),
		w9Line31OtherSpecify = decodeOptionalStringType(json.w9Line31OtherSpecify),
		foreignpartnerGroup = decodeOptionalMultipleCheckboxType(json.foreignpartnerGroup),
		w9Line5 = decodeOptionalStringType(json.w9Line5),
		w9Requesterinformation = decodeOptionalStringType(json.w9Requesterinformation),
		w9CityLine6 = decodeOptionalStringType(json.w9CityLine6),
		w9StateLine6 = decodeOptionalStringType(json.w9StateLine6),
		w9ZipLine6 = decodeOptionalStringType(json.w9ZipLine6),
		w9CountryLine6 = decodeOptionalStringType(json.w9CountryLine6),
		w9Line7 = decodeOptionalStringType(json.w9Line7),
		w9PartiSsn1 = decodeOptionalStringType(json.w9PartiSsn1),
		w9PartiEin1 = decodeOptionalStringType(json.w9PartiEin1),
		w9SignatureDate = decodeOptionalStringType(json.w9SignatureDate),
	}
end

function SourceW9Table.encodeJsonSourceW9TableSchema(so: SourceW9TableSchema): {[string]: any}
	local result: {[string]: any} = {
		fieldKeysInOrder = so.fieldKeysInOrder,
		label = so.label,
	}
	if so.fieldsMap ~= nil then
		result.fieldsMap = SourceW9Table.encodeJsonSourceW9TableFieldsMap(so.fieldsMap)
	end
	return result
end

function SourceW9Table.decodeJsonSourceW9TableSchema(json: {[string]: any}): SourceW9TableSchema
	return {
		fieldsMap = if json.fieldsMap then SourceW9Table.decodeJsonSourceW9TableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return SourceW9Table
