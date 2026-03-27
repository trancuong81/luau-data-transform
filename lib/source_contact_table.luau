--!strict
local DataTypes = require("@lib/data_types")

local SourceContactTable = {}

export type SourceContactTableContactinfoFields = {
	countryAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	zipAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	contactrolePart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	contactnotificationPart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nameContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	cityAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	numberandstreetAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	phoneContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	stateAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	addressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	emailContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	faxContactPart3Duediligencequestionnaire: DataTypes.StringType?,
}

export type SourceContactTableContactinfoType = {
	typeId: string,
	valueSubFields: SourceContactTableContactinfoFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceContactTableFieldsMap = {
	contactInfo: SourceContactTableContactinfoType?,
}

export type SourceContactTableSchema = {
	fieldsMap: SourceContactTableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

function SourceContactTable.makeSourceContactTableContactinfoFields(config: {
	countryAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	zipAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	contactrolePart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	contactnotificationPart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nameContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	cityAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	numberandstreetAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	phoneContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	stateAddressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	addressContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	emailContactPart3Duediligencequestionnaire: DataTypes.StringType?,
	faxContactPart3Duediligencequestionnaire: DataTypes.StringType?,
}?): SourceContactTableContactinfoFields
	local c = config or {}
	return {
		countryAddressContactPart3Duediligencequestionnaire = c.countryAddressContactPart3Duediligencequestionnaire,
		zipAddressContactPart3Duediligencequestionnaire = c.zipAddressContactPart3Duediligencequestionnaire,
		contactrolePart3Duediligencequestionnaire = c.contactrolePart3Duediligencequestionnaire,
		contactnotificationPart3Duediligencequestionnaire = c.contactnotificationPart3Duediligencequestionnaire,
		nameContactPart3Duediligencequestionnaire = c.nameContactPart3Duediligencequestionnaire,
		cityAddressContactPart3Duediligencequestionnaire = c.cityAddressContactPart3Duediligencequestionnaire,
		numberandstreetAddressContactPart3Duediligencequestionnaire = c.numberandstreetAddressContactPart3Duediligencequestionnaire,
		phoneContactPart3Duediligencequestionnaire = c.phoneContactPart3Duediligencequestionnaire,
		stateAddressContactPart3Duediligencequestionnaire = c.stateAddressContactPart3Duediligencequestionnaire,
		addressContactPart3Duediligencequestionnaire = c.addressContactPart3Duediligencequestionnaire,
		emailContactPart3Duediligencequestionnaire = c.emailContactPart3Duediligencequestionnaire,
		faxContactPart3Duediligencequestionnaire = c.faxContactPart3Duediligencequestionnaire,
	}
end

function SourceContactTable.makeSourceContactTableContactinfoType(config: {
	typeId: string?,
	valueSubFields: SourceContactTableContactinfoFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceContactTableContactinfoType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceContactTable.makeSourceContactTableFieldsMap(config: {
	contactInfo: SourceContactTableContactinfoType?,
}?): SourceContactTableFieldsMap
	local c = config or {}
	return {
		contactInfo = c.contactInfo,
	}
end

function SourceContactTable.makeSourceContactTableSchema(config: {
	fieldsMap: SourceContactTableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): SourceContactTableSchema
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

function SourceContactTable.encodeJsonSourceContactTableContactinfoFields(sf: SourceContactTableContactinfoFields): {[string]: any}
	local result: {[string]: any} = {}
	result.countryAddressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.countryAddressContactPart3Duediligencequestionnaire)
	result.zipAddressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.zipAddressContactPart3Duediligencequestionnaire)
	result.contactrolePart3Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(sf.contactrolePart3Duediligencequestionnaire)
	result.contactnotificationPart3Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(sf.contactnotificationPart3Duediligencequestionnaire)
	result.nameContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.nameContactPart3Duediligencequestionnaire)
	result.cityAddressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.cityAddressContactPart3Duediligencequestionnaire)
	result.numberandstreetAddressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.numberandstreetAddressContactPart3Duediligencequestionnaire)
	result.phoneContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.phoneContactPart3Duediligencequestionnaire)
	result.stateAddressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.stateAddressContactPart3Duediligencequestionnaire)
	result.addressContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.addressContactPart3Duediligencequestionnaire)
	result.emailContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.emailContactPart3Duediligencequestionnaire)
	result.faxContactPart3Duediligencequestionnaire = encodeOptionalStringType(sf.faxContactPart3Duediligencequestionnaire)
	return result
end

function SourceContactTable.decodeJsonSourceContactTableContactinfoFields(json: {[string]: any}): SourceContactTableContactinfoFields
	return {
		countryAddressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.countryAddressContactPart3Duediligencequestionnaire),
		zipAddressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.zipAddressContactPart3Duediligencequestionnaire),
		contactrolePart3Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.contactrolePart3Duediligencequestionnaire),
		contactnotificationPart3Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.contactnotificationPart3Duediligencequestionnaire),
		nameContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.nameContactPart3Duediligencequestionnaire),
		cityAddressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.cityAddressContactPart3Duediligencequestionnaire),
		numberandstreetAddressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.numberandstreetAddressContactPart3Duediligencequestionnaire),
		phoneContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.phoneContactPart3Duediligencequestionnaire),
		stateAddressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.stateAddressContactPart3Duediligencequestionnaire),
		addressContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.addressContactPart3Duediligencequestionnaire),
		emailContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.emailContactPart3Duediligencequestionnaire),
		faxContactPart3Duediligencequestionnaire = decodeOptionalStringType(json.faxContactPart3Duediligencequestionnaire),
	}
end

function SourceContactTable.encodeJsonSourceContactTableContactinfoType(t: SourceContactTableContactinfoType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceContactTable.encodeJsonSourceContactTableContactinfoFields(t.valueSubFields)
	end
	return result
end

function SourceContactTable.decodeJsonSourceContactTableContactinfoType(json: {[string]: any}): SourceContactTableContactinfoType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceContactTable.decodeJsonSourceContactTableContactinfoFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceContactTable.encodeJsonSourceContactTableFieldsMap(so: SourceContactTableFieldsMap): {[string]: any}
	local result: {[string]: any} = {
	}
	if so.contactInfo ~= nil then
		result.contactInfo = SourceContactTable.encodeJsonSourceContactTableContactinfoType(so.contactInfo)
	end
	return result
end

function SourceContactTable.decodeJsonSourceContactTableFieldsMap(json: {[string]: any}): SourceContactTableFieldsMap
	return {
		contactInfo = if json.contactInfo then SourceContactTable.decodeJsonSourceContactTableContactinfoType(json.contactInfo) else nil,
	}
end

function SourceContactTable.encodeJsonSourceContactTableSchema(so: SourceContactTableSchema): {[string]: any}
	local result: {[string]: any} = {
		fieldKeysInOrder = so.fieldKeysInOrder,
		label = so.label,
	}
	if so.fieldsMap ~= nil then
		result.fieldsMap = SourceContactTable.encodeJsonSourceContactTableFieldsMap(so.fieldsMap)
	end
	return result
end

function SourceContactTable.decodeJsonSourceContactTableSchema(json: {[string]: any}): SourceContactTableSchema
	return {
		fieldsMap = if json.fieldsMap then SourceContactTable.decodeJsonSourceContactTableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return SourceContactTable
