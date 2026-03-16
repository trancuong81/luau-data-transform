--!strict
local Encoder = require("@lib/pb/encoder")
local Decoder = require("@lib/pb/decoder")

local SchemaRegistry = {}

type CodecEntry = {
	encode: (any) -> string,
	decode: (string) -> any,
}

local registry: {[string]: CodecEntry} = {
	-- Simple types
	StringType = { encode = Encoder.encodePbStringType, decode = Decoder.decodePbStringType },
	NumberType = { encode = Encoder.encodePbNumberType, decode = Decoder.decodePbNumberType },
	BooleanType = { encode = Encoder.encodePbBooleanType, decode = Decoder.decodePbBooleanType },
	EnumType = { encode = Encoder.encodePbEnumType, decode = Decoder.decodePbEnumType },
	MultipleCheckboxType = { encode = Encoder.encodePbMultipleCheckboxType, decode = Decoder.decodePbMultipleCheckboxType },
	RadioGroupType = { encode = Encoder.encodePbRadioGroupType, decode = Decoder.decodePbRadioGroupType },
	-- All 15 compound types
	PhoneFaxType = { encode = Encoder.encodePbPhoneFaxType, decode = Decoder.decodePbPhoneFaxType },
	DateTimeType = { encode = Encoder.encodePbDateTimeType, decode = Decoder.decodePbDateTimeType },
	MoneyType = { encode = Encoder.encodePbMoneyType, decode = Decoder.decodePbMoneyType },
	AddressType = { encode = Encoder.encodePbAddressType, decode = Decoder.decodePbAddressType },
	IndividualNameType = { encode = Encoder.encodePbIndividualNameType, decode = Decoder.decodePbIndividualNameType },
	CountryType = { encode = Encoder.encodePbCountryType, decode = Decoder.decodePbCountryType },
	BaseContactType = { encode = Encoder.encodePbBaseContactType, decode = Decoder.decodePbBaseContactType },
	SubmissionContactType = { encode = Encoder.encodePbSubmissionContactType, decode = Decoder.decodePbSubmissionContactType },
	SignatoryType = { encode = Encoder.encodePbSignatoryType, decode = Decoder.decodePbSignatoryType },
	BankInfoType = { encode = Encoder.encodePbBankInfoType, decode = Decoder.decodePbBankInfoType },
	BankAccountInfoType = { encode = Encoder.encodePbBankAccountInfoType, decode = Decoder.decodePbBankAccountInfoType },
	WireInstructionsType = { encode = Encoder.encodePbWireInstructionsType, decode = Decoder.decodePbWireInstructionsType },
	BrokerageFirmType = { encode = Encoder.encodePbBrokerageFirmType, decode = Decoder.decodePbBrokerageFirmType },
	BrokerageAccountType = { encode = Encoder.encodePbBrokerageAccountType, decode = Decoder.decodePbBrokerageAccountType },
	ServiceContactPointType = { encode = Encoder.encodePbServiceContactPointType, decode = Decoder.decodePbServiceContactPointType },
	CustomCompoundType = { encode = Encoder.encodePbCustomCompoundType, decode = Decoder.decodePbCustomCompoundType },
	-- Table schema
	TableSchema = { encode = Encoder.encodePbTableSchema, decode = Decoder.decodePbTableSchema },
	-- Source/Target
	LpSignatoryType = { encode = Encoder.encodePbLpSignatoryType, decode = Decoder.decodePbLpSignatoryType },
	W9Type = { encode = Encoder.encodePbW9Type, decode = Decoder.decodePbW9Type },
	SourceTableFieldsMap = { encode = Encoder.encodePbSourceTableFieldsMap, decode = Decoder.decodePbSourceTableFieldsMap },
	SourceTableSchema = { encode = Encoder.encodePbSourceTableSchema, decode = Decoder.decodePbSourceTableSchema },
	TargetTableFieldsMap = { encode = Encoder.encodePbTargetTableFieldsMap, decode = Decoder.decodePbTargetTableFieldsMap },
	TargetTableSchema = { encode = Encoder.encodePbTargetTableSchema, decode = Decoder.decodePbTargetTableSchema },
}

function SchemaRegistry.encode(messageType: string, data: any): string
	local entry = registry[messageType]
	if entry == nil then
		error(`unknown message type: {messageType}`)
	end
	return entry.encode(data)
end

function SchemaRegistry.decode(messageType: string, bytes: string): any
	local entry = registry[messageType]
	if entry == nil then
		error(`unknown message type: {messageType}`)
	end
	return entry.decode(bytes)
end

return SchemaRegistry
