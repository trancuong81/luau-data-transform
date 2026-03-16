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
-- Inner encode functions (simple types)
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
-- Compound wrapper helper
-- ============================================================

local function encodeCompoundWrapper(
	wb: Wire.WriteBuf,
	typeId: string,
	valueSubFields: any,
	subFieldKeysInOrder: {string},
	label: string?,
	subFieldsEncoderFn: (Wire.WriteBuf, any) -> ()
)
	encodeStringField(wb, 1, typeId)
	if valueSubFields ~= nil then
		encodeNested(wb, 2, function(inner)
			subFieldsEncoderFn(inner, valueSubFields)
		end)
	end
	encodeRepeatedStringField(wb, 3, subFieldKeysInOrder)
	encodeOptionalStringField(wb, 4, label)
end

-- ============================================================
-- Compound SubFields encoders
-- ============================================================

-- 1. PhoneFaxSubFields
local function encodePbPhoneFaxSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.PhoneFaxSubFields)
	if sf.countryCode then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.countryCode :: DataTypes.StringType) end) end
	if sf.areaCode then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.areaCode :: DataTypes.StringType) end) end
	if sf.subscriberNumber then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.subscriberNumber :: DataTypes.StringType) end) end
end

-- 2. DateTimeSubFields
local function encodePbDateTimeSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.DateTimeSubFields)
	if sf.epochMs then encodeNested(wb, 1, function(inner) encodePbNumberTypeInner(inner, sf.epochMs :: DataTypes.NumberType) end) end
	if sf.zoneOffset then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.zoneOffset :: DataTypes.StringType) end) end
end

-- 3. MoneySubFields
local function encodePbMoneySubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.MoneySubFields)
	if sf.amount then encodeNested(wb, 1, function(inner) encodePbNumberTypeInner(inner, sf.amount :: DataTypes.NumberType) end) end
	if sf.isoCurrencyCode then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.isoCurrencyCode :: DataTypes.StringType) end) end
end

-- 4. AddressSubFields
local function encodePbAddressSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.AddressSubFields)
	if sf.numberAndStreet then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.numberAndStreet :: DataTypes.StringType) end) end
	if sf.city then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.city :: DataTypes.StringType) end) end
	if sf.stateProvince then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.stateProvince :: DataTypes.StringType) end) end
	if sf.country then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.country :: DataTypes.StringType) end) end
	if sf.postalZipCode then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.postalZipCode :: DataTypes.StringType) end) end
	if sf.fullAddress then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullAddress :: DataTypes.StringType) end) end
end

-- 5. IndividualNameSubFields
local function encodePbIndividualNameSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.IndividualNameSubFields)
	if sf.prefixName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.prefixName :: DataTypes.StringType) end) end
	if sf.firstName then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.firstName :: DataTypes.StringType) end) end
	if sf.middleName then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.middleName :: DataTypes.StringType) end) end
	if sf.lastName then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.lastName :: DataTypes.StringType) end) end
	if sf.suffixName then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.suffixName :: DataTypes.StringType) end) end
	if sf.fullName then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullName :: DataTypes.StringType) end) end
	if sf.preferredName then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.preferredName :: DataTypes.StringType) end) end
	if sf.jobTitle then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.jobTitle :: DataTypes.StringType) end) end
end

-- 6. CountrySubFields
local function encodePbCountrySubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.CountrySubFields)
	if sf.countryName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.countryName :: DataTypes.StringType) end) end
	if sf.isoCountryCode then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.isoCountryCode :: DataTypes.StringType) end) end
end

-- 7. BaseContactSubFields
local function encodePbBaseContactSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.BaseContactSubFields)
	if sf.prefixName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.prefixName :: DataTypes.StringType) end) end
	if sf.firstName then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.firstName :: DataTypes.StringType) end) end
	if sf.middleName then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.middleName :: DataTypes.StringType) end) end
	if sf.lastName then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.lastName :: DataTypes.StringType) end) end
	if sf.suffixName then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.suffixName :: DataTypes.StringType) end) end
	if sf.fullName then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullName :: DataTypes.StringType) end) end
	if sf.preferredName then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.preferredName :: DataTypes.StringType) end) end
	if sf.jobTitle then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.jobTitle :: DataTypes.StringType) end) end
	if sf.email then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.email :: DataTypes.StringType) end) end
	if sf.phone then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.phone :: DataTypes.StringType) end) end
	if sf.fax then encodeNested(wb, 11, function(inner) encodePbStringTypeInner(inner, sf.fax :: DataTypes.StringType) end) end
end

-- 8. SubmissionContactSubFields
local function encodePbSubmissionContactSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.SubmissionContactSubFields)
	if sf.prefixName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.prefixName :: DataTypes.StringType) end) end
	if sf.firstName then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.firstName :: DataTypes.StringType) end) end
	if sf.middleName then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.middleName :: DataTypes.StringType) end) end
	if sf.lastName then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.lastName :: DataTypes.StringType) end) end
	if sf.suffixName then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.suffixName :: DataTypes.StringType) end) end
	if sf.fullName then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullName :: DataTypes.StringType) end) end
	if sf.preferredName then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.preferredName :: DataTypes.StringType) end) end
	if sf.jobTitle then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.jobTitle :: DataTypes.StringType) end) end
	if sf.email then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.email :: DataTypes.StringType) end) end
	if sf.phone then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.phone :: DataTypes.StringType) end) end
	if sf.fax then encodeNested(wb, 11, function(inner) encodePbStringTypeInner(inner, sf.fax :: DataTypes.StringType) end) end
	if sf.typeOfCorrespondences then encodeNested(wb, 12, function(inner) encodePbMultipleCheckboxTypeInner(inner, sf.typeOfCorrespondences :: DataTypes.MultipleCheckboxType) end) end
	if sf.contactTypes then encodeNested(wb, 13, function(inner) encodePbMultipleCheckboxTypeInner(inner, sf.contactTypes :: DataTypes.MultipleCheckboxType) end) end
	if sf.contactRoles then encodeNested(wb, 14, function(inner) encodePbMultipleCheckboxTypeInner(inner, sf.contactRoles :: DataTypes.MultipleCheckboxType) end) end
	if sf.customId then encodeNested(wb, 15, function(inner) encodePbStringTypeInner(inner, sf.customId :: DataTypes.StringType) end) end
	if sf.addressNumberAndStreet then encodeNested(wb, 16, function(inner) encodePbStringTypeInner(inner, sf.addressNumberAndStreet :: DataTypes.StringType) end) end
	if sf.addressCity then encodeNested(wb, 17, function(inner) encodePbStringTypeInner(inner, sf.addressCity :: DataTypes.StringType) end) end
	if sf.addressStateProvince then encodeNested(wb, 18, function(inner) encodePbStringTypeInner(inner, sf.addressStateProvince :: DataTypes.StringType) end) end
	if sf.addressCountry then encodeNested(wb, 19, function(inner) encodePbStringTypeInner(inner, sf.addressCountry :: DataTypes.StringType) end) end
	if sf.addressPostalZipCode then encodeNested(wb, 20, function(inner) encodePbStringTypeInner(inner, sf.addressPostalZipCode :: DataTypes.StringType) end) end
	if sf.addressFullAddress then encodeNested(wb, 21, function(inner) encodePbStringTypeInner(inner, sf.addressFullAddress :: DataTypes.StringType) end) end
	if sf.relationshipWithPrimary then encodeNested(wb, 22, function(inner) encodePbStringTypeInner(inner, sf.relationshipWithPrimary :: DataTypes.StringType) end) end
	if sf.occupation then encodeNested(wb, 23, function(inner) encodePbStringTypeInner(inner, sf.occupation :: DataTypes.StringType) end) end
	if sf.companyName then encodeNested(wb, 24, function(inner) encodePbStringTypeInner(inner, sf.companyName :: DataTypes.StringType) end) end
	if sf.companyAddressNumberAndStreet then encodeNested(wb, 25, function(inner) encodePbStringTypeInner(inner, sf.companyAddressNumberAndStreet :: DataTypes.StringType) end) end
	if sf.companyAddressCity then encodeNested(wb, 26, function(inner) encodePbStringTypeInner(inner, sf.companyAddressCity :: DataTypes.StringType) end) end
	if sf.companyAddressStateProvince then encodeNested(wb, 27, function(inner) encodePbStringTypeInner(inner, sf.companyAddressStateProvince :: DataTypes.StringType) end) end
	if sf.companyAddressCountry then encodeNested(wb, 28, function(inner) encodePbStringTypeInner(inner, sf.companyAddressCountry :: DataTypes.StringType) end) end
	if sf.companyAddressPostalZipCode then encodeNested(wb, 29, function(inner) encodePbStringTypeInner(inner, sf.companyAddressPostalZipCode :: DataTypes.StringType) end) end
	if sf.companyAddressFullAddress then encodeNested(wb, 30, function(inner) encodePbStringTypeInner(inner, sf.companyAddressFullAddress :: DataTypes.StringType) end) end
	if sf.specifiedCompanyOrgUnit then encodeNested(wb, 31, function(inner) encodePbStringTypeInner(inner, sf.specifiedCompanyOrgUnit :: DataTypes.StringType) end) end
	if sf.individualEmail then encodeNested(wb, 32, function(inner) encodePbStringTypeInner(inner, sf.individualEmail :: DataTypes.StringType) end) end
	if sf.individualPhone then encodeNested(wb, 33, function(inner) encodePbStringTypeInner(inner, sf.individualPhone :: DataTypes.StringType) end) end
	if sf.individualFax then encodeNested(wb, 34, function(inner) encodePbStringTypeInner(inner, sf.individualFax :: DataTypes.StringType) end) end
end

-- 9. SignatorySubFields
local function encodePbSignatorySubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.SignatorySubFields)
	if sf.numberAndStreet then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.numberAndStreet :: DataTypes.StringType) end) end
	if sf.city then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.city :: DataTypes.StringType) end) end
	if sf.stateProvince then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.stateProvince :: DataTypes.StringType) end) end
	if sf.country then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.country :: DataTypes.StringType) end) end
	if sf.postalZipCode then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.postalZipCode :: DataTypes.StringType) end) end
	if sf.fullAddress then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullAddress :: DataTypes.StringType) end) end
	if sf.name then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.name :: DataTypes.StringType) end) end
	if sf.date then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.date :: DataTypes.StringType) end) end
	if sf.title then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.title :: DataTypes.StringType) end) end
	if sf.phone then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.phone :: DataTypes.StringType) end) end
	if sf.email then encodeNested(wb, 11, function(inner) encodePbStringTypeInner(inner, sf.email :: DataTypes.StringType) end) end
	if sf.signerRole then encodeNested(wb, 12, function(inner) encodePbStringTypeInner(inner, sf.signerRole :: DataTypes.StringType) end) end
end

-- 10. BankInfoSubFields
local function encodePbBankInfoSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.BankInfoSubFields)
	if sf.bankName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.bankName :: DataTypes.StringType) end) end
	if sf.bankLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.bankLocation :: DataTypes.StringType) end) end
	if sf.aba then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.aba :: DataTypes.StringType) end) end
	if sf.swift then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.swift :: DataTypes.StringType) end) end
end

-- 11. BankAccountInfoSubFields
local function encodePbBankAccountInfoSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.BankAccountInfoSubFields)
	if sf.bankName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.bankName :: DataTypes.StringType) end) end
	if sf.bankLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.bankLocation :: DataTypes.StringType) end) end
	if sf.aba then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.aba :: DataTypes.StringType) end) end
	if sf.swift then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.swift :: DataTypes.StringType) end) end
	if sf.accountName then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.accountName :: DataTypes.StringType) end) end
	if sf.accountNumber then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.accountNumber :: DataTypes.StringType) end) end
	if sf.iban then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.iban :: DataTypes.StringType) end) end
	if sf.furtherCreditName then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.furtherCreditName :: DataTypes.StringType) end) end
	if sf.furtherCreditAccount then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.furtherCreditAccount :: DataTypes.StringType) end) end
	if sf.correspondentBankAccount then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.correspondentBankAccount :: DataTypes.StringType) end) end
end

-- 12. WireInstructionsSubFields
local function encodePbWireInstructionsSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.WireInstructionsSubFields)
	if sf.bankName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.bankName :: DataTypes.StringType) end) end
	if sf.bankLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.bankLocation :: DataTypes.StringType) end) end
	if sf.aba then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.aba :: DataTypes.StringType) end) end
	if sf.swift then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.swift :: DataTypes.StringType) end) end
	if sf.accountName then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.accountName :: DataTypes.StringType) end) end
	if sf.accountNumber then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.accountNumber :: DataTypes.StringType) end) end
	if sf.iban then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.iban :: DataTypes.StringType) end) end
	if sf.furtherCreditName then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.furtherCreditName :: DataTypes.StringType) end) end
	if sf.furtherCreditAccount then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.furtherCreditAccount :: DataTypes.StringType) end) end
	if sf.correspondentBankAccount then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.correspondentBankAccount :: DataTypes.StringType) end) end
	if sf.attention then encodeNested(wb, 11, function(inner) encodePbStringTypeInner(inner, sf.attention :: DataTypes.StringType) end) end
end

-- 13. BrokerageFirmSubFields
local function encodePbBrokerageFirmSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.BrokerageFirmSubFields)
	if sf.firmName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.firmName :: DataTypes.StringType) end) end
	if sf.firmOfficeBranchLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.firmOfficeBranchLocation :: DataTypes.StringType) end) end
end

-- 14. BrokerageAccountSubFields
local function encodePbBrokerageAccountSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.BrokerageAccountSubFields)
	if sf.firmName then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.firmName :: DataTypes.StringType) end) end
	if sf.firmOfficeBranchLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.firmOfficeBranchLocation :: DataTypes.StringType) end) end
	if sf.dtcNumber then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.dtcNumber :: DataTypes.StringType) end) end
	if sf.crestParticipantId then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.crestParticipantId :: DataTypes.StringType) end) end
	if sf.bicCode then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.bicCode :: DataTypes.StringType) end) end
	if sf.beneficiaryAccountNumber then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.beneficiaryAccountNumber :: DataTypes.StringType) end) end
	if sf.beneficiaryAccountName then encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, sf.beneficiaryAccountName :: DataTypes.StringType) end) end
	if sf.intermediaryAccountName then encodeNested(wb, 8, function(inner) encodePbStringTypeInner(inner, sf.intermediaryAccountName :: DataTypes.StringType) end) end
	if sf.intermediaryAccountNumber then encodeNested(wb, 9, function(inner) encodePbStringTypeInner(inner, sf.intermediaryAccountNumber :: DataTypes.StringType) end) end
	if sf.intermediaryBicCode then encodeNested(wb, 10, function(inner) encodePbStringTypeInner(inner, sf.intermediaryBicCode :: DataTypes.StringType) end) end
	if sf.securitiesSettlementInstructions then encodeNested(wb, 11, function(inner) encodePbStringTypeInner(inner, sf.securitiesSettlementInstructions :: DataTypes.StringType) end) end
	if sf.attention then encodeNested(wb, 12, function(inner) encodePbStringTypeInner(inner, sf.attention :: DataTypes.StringType) end) end
end

-- 15. ServiceContactPointSubFields
local function encodePbServiceContactPointSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.ServiceContactPointSubFields)
	if sf.name then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.name :: DataTypes.StringType) end) end
	if sf.officeBranchLocation then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.officeBranchLocation :: DataTypes.StringType) end) end
	if sf.phone then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.phone :: DataTypes.StringType) end) end
	if sf.email then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.email :: DataTypes.StringType) end) end
end

-- ============================================================
-- Compound wrapper inner encoders
-- ============================================================

local function encodePbPhoneFaxTypeInner(wb: Wire.WriteBuf, at: DataTypes.PhoneFaxType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbPhoneFaxSubFieldsInner)
end

local function encodePbDateTimeTypeInner(wb: Wire.WriteBuf, at: DataTypes.DateTimeType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbDateTimeSubFieldsInner)
end

local function encodePbMoneyTypeInner(wb: Wire.WriteBuf, at: DataTypes.MoneyType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbMoneySubFieldsInner)
end

local function encodePbAddressTypeInner(wb: Wire.WriteBuf, at: DataTypes.AddressType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbAddressSubFieldsInner)
end

local function encodePbIndividualNameTypeInner(wb: Wire.WriteBuf, at: DataTypes.IndividualNameType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbIndividualNameSubFieldsInner)
end

local function encodePbCountryTypeInner(wb: Wire.WriteBuf, at: DataTypes.CountryType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbCountrySubFieldsInner)
end

local function encodePbBaseContactTypeInner(wb: Wire.WriteBuf, at: DataTypes.BaseContactType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbBaseContactSubFieldsInner)
end

local function encodePbSubmissionContactTypeInner(wb: Wire.WriteBuf, at: DataTypes.SubmissionContactType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbSubmissionContactSubFieldsInner)
end

local function encodePbSignatoryTypeInner(wb: Wire.WriteBuf, at: DataTypes.SignatoryType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbSignatorySubFieldsInner)
end

local function encodePbBankInfoTypeInner(wb: Wire.WriteBuf, at: DataTypes.BankInfoType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbBankInfoSubFieldsInner)
end

local function encodePbBankAccountInfoTypeInner(wb: Wire.WriteBuf, at: DataTypes.BankAccountInfoType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbBankAccountInfoSubFieldsInner)
end

local function encodePbWireInstructionsTypeInner(wb: Wire.WriteBuf, at: DataTypes.WireInstructionsType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbWireInstructionsSubFieldsInner)
end

local function encodePbBrokerageFirmTypeInner(wb: Wire.WriteBuf, at: DataTypes.BrokerageFirmType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbBrokerageFirmSubFieldsInner)
end

local function encodePbBrokerageAccountTypeInner(wb: Wire.WriteBuf, at: DataTypes.BrokerageAccountType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbBrokerageAccountSubFieldsInner)
end

local function encodePbServiceContactPointTypeInner(wb: Wire.WriteBuf, at: DataTypes.ServiceContactPointType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbServiceContactPointSubFieldsInner)
end

-- ============================================================
-- Source/Target table sub-field encoders
-- ============================================================

local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")

-- LpSignatoryFields: 1=asaCommitmentAmount, 2=individualSubscribernameSignaturepage, 3=entityAuthorizednameSignaturepage
local function encodePbLpSignatoryFieldsInner(wb: Wire.WriteBuf, sf: SourceTable.LpSignatoryFields)
	if sf.asaCommitmentAmount then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.asaCommitmentAmount :: DataTypes.StringType) end) end
	if sf.individualSubscribernameSignaturepage then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.individualSubscribernameSignaturepage :: DataTypes.StringType) end) end
	if sf.entityAuthorizednameSignaturepage then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.entityAuthorizednameSignaturepage :: DataTypes.StringType) end) end
end

-- LpSignatoryType: compound wrapper (1=typeId, 2=valueSubFields(LpSignatoryFields), 3=subFieldKeysInOrder, 4=label)
local function encodePbLpSignatoryTypeInner(wb: Wire.WriteBuf, at: SourceTable.LpSignatoryType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbLpSignatoryFieldsInner)
end

-- W9Fields: 1=w9PartiSsn1, 2=w9PartiEin1, 3=w9Line2
local function encodePbW9FieldsInner(wb: Wire.WriteBuf, sf: SourceTable.W9Fields)
	if sf.w9PartiSsn1 then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.w9PartiSsn1 :: DataTypes.StringType) end) end
	if sf.w9PartiEin1 then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.w9PartiEin1 :: DataTypes.StringType) end) end
	if sf.w9Line2 then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.w9Line2 :: DataTypes.StringType) end) end
end

-- W9Type: compound wrapper (1=typeId, 2=valueSubFields(W9Fields), 3=subFieldKeysInOrder, 4=label)
local function encodePbW9TypeInner(wb: Wire.WriteBuf, at: SourceTable.W9Type)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbW9FieldsInner)
end

-- SourceTableFieldsMap: fixed-field proto message
local function encodePbSourceTableFieldsMapInner(wb: Wire.WriteBuf, sfm: SourceTable.SourceTableFieldsMap)
	if sfm.lpSignatory then
		encodeNested(wb, 1, function(inner) encodePbLpSignatoryTypeInner(inner, sfm.lpSignatory :: SourceTable.LpSignatoryType) end)
	end
	if sfm.asaFullnameInvestornameAmlquestionnaire then
		encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sfm.asaFullnameInvestornameAmlquestionnaire :: DataTypes.StringType) end)
	end
	if sfm.asaFullnameInvestornameGeneralinfo1 then
		encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sfm.asaFullnameInvestornameGeneralinfo1 :: DataTypes.StringType) end)
	end
	if sfm.luxsentityRegulatedstatusPart2Duediligencequestionnaire then
		encodeNested(wb, 4, function(inner) encodePbMultipleCheckboxTypeInner(inner, sfm.luxsentityRegulatedstatusPart2Duediligencequestionnaire :: DataTypes.MultipleCheckboxType) end)
	end
	if sfm.indiInternationalsupplementsPart1Duediligencequestionnaire then
		encodeNested(wb, 5, function(inner) encodePbMultipleCheckboxTypeInner(inner, sfm.indiInternationalsupplementsPart1Duediligencequestionnaire :: DataTypes.MultipleCheckboxType) end)
	end
	if sfm.entityInternationalsupplementsPart1Duediligencequestionnaire then
		encodeNested(wb, 6, function(inner) encodePbMultipleCheckboxTypeInner(inner, sfm.entityInternationalsupplementsPart1Duediligencequestionnaire :: DataTypes.MultipleCheckboxType) end)
	end
	if sfm.w9 then
		encodeNested(wb, 7, function(inner) encodePbW9TypeInner(inner, sfm.w9 :: SourceTable.W9Type) end)
	end
end

-- SourceTableSchema: 1=fieldsMap, 2=fieldKeysInOrder, 3=label
local function encodePbSourceTableSchemaInner(wb: Wire.WriteBuf, sts: SourceTable.SourceTableSchema)
	if sts.fieldsMap then
		encodeNested(wb, 1, function(inner) encodePbSourceTableFieldsMapInner(inner, sts.fieldsMap :: SourceTable.SourceTableFieldsMap) end)
	end
	encodeRepeatedStringField(wb, 2, sts.fieldKeysInOrder)
	encodeStringField(wb, 3, sts.label)
end

-- TargetTableFieldsMap: fixed-field proto message
local function encodePbTargetTableFieldsMapInner(wb: Wire.WriteBuf, tfm: TargetTable.TargetTableFieldsMap)
	if tfm.sfAgreementNullCommitmentC then
		encodeNested(wb, 1, function(inner) encodePbMoneyTypeInner(inner, tfm.sfAgreementNullCommitmentC :: DataTypes.MoneyType) end)
	end
	if tfm.sfAccountSubscriptionInvestorName then
		encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, tfm.sfAccountSubscriptionInvestorName :: DataTypes.StringType) end)
	end
	if tfm.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC then
		encodeNested(wb, 3, function(inner) encodePbRadioGroupTypeInner(inner, tfm.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC :: DataTypes.RadioGroupType) end)
	end
	if tfm.sfAgreementNullWlcInternationalSupplementsC then
		encodeNested(wb, 4, function(inner) encodePbMultipleCheckboxTypeInner(inner, tfm.sfAgreementNullWlcInternationalSupplementsC :: DataTypes.MultipleCheckboxType) end)
	end
	if tfm.sfAgreementNullSignerFirstName then
		encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, tfm.sfAgreementNullSignerFirstName :: DataTypes.StringType) end)
	end
	if tfm.sfAgreementNullSignerMiddleName then
		encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, tfm.sfAgreementNullSignerMiddleName :: DataTypes.StringType) end)
	end
	if tfm.sfAgreementNullSignerLastName then
		encodeNested(wb, 7, function(inner) encodePbStringTypeInner(inner, tfm.sfAgreementNullSignerLastName :: DataTypes.StringType) end)
	end
	if tfm.sfTaxFormW9UsTinTypeC then
		encodeNested(wb, 8, function(inner) encodePbRadioGroupTypeInner(inner, tfm.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType) end)
	end
end

-- TargetTableSchema: 1=fieldsMap, 2=fieldKeysInOrder, 3=label
local function encodePbTargetTableSchemaInner(wb: Wire.WriteBuf, tts: TargetTable.TargetTableSchema)
	if tts.fieldsMap then
		encodeNested(wb, 1, function(inner) encodePbTargetTableFieldsMapInner(inner, tts.fieldsMap :: TargetTable.TargetTableFieldsMap) end)
	end
	encodeRepeatedStringField(wb, 2, tts.fieldKeysInOrder)
	encodeStringField(wb, 3, tts.label)
end

-- ============================================================
-- TypeId-to-oneof mapping (placed after all compound encoder functions)
-- ============================================================

local TYPEID_TO_ONEOF: {[string]: {fieldNum: number, encode: (Wire.WriteBuf, any) -> ()}} = {
	-- Field 1: StringType variants
	String = { fieldNum = 1, encode = encodePbStringTypeInner },
	Ssn = { fieldNum = 1, encode = encodePbStringTypeInner },
	Ein = { fieldNum = 1, encode = encodePbStringTypeInner },
	Aba = { fieldNum = 1, encode = encodePbStringTypeInner },
	Itin = { fieldNum = 1, encode = encodePbStringTypeInner },
	Swift = { fieldNum = 1, encode = encodePbStringTypeInner },
	Iban = { fieldNum = 1, encode = encodePbStringTypeInner },
	Giin = { fieldNum = 1, encode = encodePbStringTypeInner },
	UsZip = { fieldNum = 1, encode = encodePbStringTypeInner },
	Email = { fieldNum = 1, encode = encodePbStringTypeInner },
	PhoneFaxString = { fieldNum = 1, encode = encodePbStringTypeInner },
	IsoCountryCode = { fieldNum = 1, encode = encodePbStringTypeInner },
	IsoCurrencyCode = { fieldNum = 1, encode = encodePbStringTypeInner },
	CountryString = { fieldNum = 1, encode = encodePbStringTypeInner },
	StateProvince = { fieldNum = 1, encode = encodePbStringTypeInner },
	City = { fieldNum = 1, encode = encodePbStringTypeInner },
	NumberAndStreet = { fieldNum = 1, encode = encodePbStringTypeInner },
	PostalZipCode = { fieldNum = 1, encode = encodePbStringTypeInner },
	MoneyString = { fieldNum = 1, encode = encodePbStringTypeInner },
	DateTimeString = { fieldNum = 1, encode = encodePbStringTypeInner },
	TimeZoneOffset = { fieldNum = 1, encode = encodePbStringTypeInner },
	-- Field 2: NumberType variants
	Integer = { fieldNum = 2, encode = encodePbNumberTypeInner },
	Float = { fieldNum = 2, encode = encodePbNumberTypeInner },
	Percentage = { fieldNum = 2, encode = encodePbNumberTypeInner },
	Year = { fieldNum = 2, encode = encodePbNumberTypeInner },
	-- Field 3: BooleanType
	Boolean = { fieldNum = 3, encode = encodePbBooleanTypeInner },
	-- Field 4: EnumType variants
	ShareClass = { fieldNum = 4, encode = encodePbEnumTypeInner },
	TransactionType = { fieldNum = 4, encode = encodePbEnumTypeInner },
	SubscriptionStatus = { fieldNum = 4, encode = encodePbEnumTypeInner },
	-- Field 5: MultipleCheckboxType
	MultipleCheckbox = { fieldNum = 5, encode = encodePbMultipleCheckboxTypeInner },
	-- Field 6: RadioGroupType
	RadioGroup = { fieldNum = 6, encode = encodePbRadioGroupTypeInner },
	-- Field 7: PhoneFaxType
	PhoneFax = { fieldNum = 7, encode = encodePbPhoneFaxTypeInner },
	-- Field 8: DateTimeType
	DateTime = { fieldNum = 8, encode = encodePbDateTimeTypeInner },
	-- Field 9: MoneyType
	Money = { fieldNum = 9, encode = encodePbMoneyTypeInner },
	-- Field 10: AddressType
	Address = { fieldNum = 10, encode = encodePbAddressTypeInner },
	-- Field 11: IndividualNameType
	IndividualName = { fieldNum = 11, encode = encodePbIndividualNameTypeInner },
	-- Field 12: CountryType
	Country = { fieldNum = 12, encode = encodePbCountryTypeInner },
	-- Field 13: BaseContactType
	BaseContact = { fieldNum = 13, encode = encodePbBaseContactTypeInner },
	-- Field 14: SubmissionContactType
	SubmissionContact = { fieldNum = 14, encode = encodePbSubmissionContactTypeInner },
	-- Field 15: SignatoryType
	Signatory = { fieldNum = 15, encode = encodePbSignatoryTypeInner },
	-- Field 16: BankInfoType
	BankInfo = { fieldNum = 16, encode = encodePbBankInfoTypeInner },
	-- Field 17: BankAccountInfoType
	BankAccountInfo = { fieldNum = 17, encode = encodePbBankAccountInfoTypeInner },
	-- Field 18: WireInstructionsType
	WireInstructions = { fieldNum = 18, encode = encodePbWireInstructionsTypeInner },
	-- Field 19: BrokerageFirmType
	BrokerageFirm = { fieldNum = 19, encode = encodePbBrokerageFirmTypeInner },
	-- Field 20: BrokerageAccountType
	BrokerageAccount = { fieldNum = 20, encode = encodePbBrokerageAccountTypeInner },
	-- Field 21: ServiceContactPointType
	ServiceContactPoint = { fieldNum = 21, encode = encodePbServiceContactPointTypeInner },
}

-- ============================================================
-- Oneof dispatch encoder
-- ============================================================

-- NonCustomFieldValue: oneof with fields 1-21
local function encodePbNonCustomFieldValueInner(wb: Wire.WriteBuf, value: any)
	local typeId = value.typeId
	local mapping = TYPEID_TO_ONEOF[typeId]
	if mapping == nil then
		error(`unknown typeId for NonCustomFieldValue: {typeId}`)
	end
	encodeNested(wb, mapping.fieldNum, function(inner)
		mapping.encode(inner, value)
	end)
end

-- CustomCompoundType: 1=typeId, 2=map<string, NonCustomFieldValue>, 3=subFieldKeysInOrder, 4=label
local function encodePbCustomCompoundTypeInner(wb: Wire.WriteBuf, cct: any)
	encodeStringField(wb, 1, cct.typeId)
	if cct.valueSubFields ~= nil then
		for key, val in cct.valueSubFields do
			-- Map entry: nested message with 1=key(string), 2=value(nested NonCustomFieldValue)
			encodeNested(wb, 2, function(entry)
				encodeStringField(entry, 1, key)
				-- value must be wrapped in field 2 as a nested message
				encodeNested(entry, 2, function(inner)
					encodePbNonCustomFieldValueInner(inner, val)
				end)
			end)
		end
	end
	encodeRepeatedStringField(wb, 3, cct.subFieldKeysInOrder or {})
	encodeOptionalStringField(wb, 4, cct.label)
end

-- SingleFieldType: oneof value (fields 1-22) + label (field 23)
local function encodePbSingleFieldTypeInner(wb: Wire.WriteBuf, sft: any)
	if sft.value ~= nil then
		local typeId = sft.value.typeId
		local mapping = TYPEID_TO_ONEOF[typeId]
		if mapping ~= nil then
			encodeNested(wb, mapping.fieldNum, function(inner)
				mapping.encode(inner, sft.value)
			end)
		elseif typeId == "CustomCompound" then
			encodeNested(wb, 22, function(inner)
				encodePbCustomCompoundTypeInner(inner, sft.value)
			end)
		else
			error(`unknown typeId for SingleFieldType: {typeId}`)
		end
	end
	encodeOptionalStringField(wb, 23, sft.label)
end

-- FieldGroup: 1=label, 2=startIdx(int32), 3=endIdx(int32)
local function encodePbFieldGroupInner(wb: Wire.WriteBuf, fg: any)
	encodeStringField(wb, 1, fg.label)
	encodeInt32Field(wb, 2, fg.startIdx)
	encodeInt32Field(wb, 3, fg.endIdx)
end

-- TableSchema: 1=fieldsMap(map<string, SingleFieldType>), 2=fieldKeysInOrder(repeated), 3=label, 4=groups(repeated)
local function encodePbTableSchemaInner(wb: Wire.WriteBuf, ts: any)
	for key, sft in ts.fieldsMap do
		encodeNested(wb, 1, function(entry)
			encodeStringField(entry, 1, key)
			encodeNested(entry, 2, function(inner)
				encodePbSingleFieldTypeInner(inner, sft)
			end)
		end)
	end
	encodeRepeatedStringField(wb, 2, ts.fieldKeysInOrder)
	encodeStringField(wb, 3, ts.label)
	for _, fg in ts.groups do
		encodeNested(wb, 4, function(inner)
			encodePbFieldGroupInner(inner, fg)
		end)
	end
end

-- ============================================================
-- Public encode functions (simple types)
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
-- Public encode functions (compound types)
-- ============================================================

function Encoder.encodePbPhoneFaxType(at: DataTypes.PhoneFaxType): string
	local wb = Wire.WriteBuf.new()
	encodePbPhoneFaxTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbDateTimeType(at: DataTypes.DateTimeType): string
	local wb = Wire.WriteBuf.new()
	encodePbDateTimeTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbMoneyType(at: DataTypes.MoneyType): string
	local wb = Wire.WriteBuf.new()
	encodePbMoneyTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbAddressType(at: DataTypes.AddressType): string
	local wb = Wire.WriteBuf.new()
	encodePbAddressTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbIndividualNameType(at: DataTypes.IndividualNameType): string
	local wb = Wire.WriteBuf.new()
	encodePbIndividualNameTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbCountryType(at: DataTypes.CountryType): string
	local wb = Wire.WriteBuf.new()
	encodePbCountryTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbBaseContactType(at: DataTypes.BaseContactType): string
	local wb = Wire.WriteBuf.new()
	encodePbBaseContactTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbSubmissionContactType(at: DataTypes.SubmissionContactType): string
	local wb = Wire.WriteBuf.new()
	encodePbSubmissionContactTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbSignatoryType(at: DataTypes.SignatoryType): string
	local wb = Wire.WriteBuf.new()
	encodePbSignatoryTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbBankInfoType(at: DataTypes.BankInfoType): string
	local wb = Wire.WriteBuf.new()
	encodePbBankInfoTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbBankAccountInfoType(at: DataTypes.BankAccountInfoType): string
	local wb = Wire.WriteBuf.new()
	encodePbBankAccountInfoTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbWireInstructionsType(at: DataTypes.WireInstructionsType): string
	local wb = Wire.WriteBuf.new()
	encodePbWireInstructionsTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbBrokerageFirmType(at: DataTypes.BrokerageFirmType): string
	local wb = Wire.WriteBuf.new()
	encodePbBrokerageFirmTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbBrokerageAccountType(at: DataTypes.BrokerageAccountType): string
	local wb = Wire.WriteBuf.new()
	encodePbBrokerageAccountTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbServiceContactPointType(at: DataTypes.ServiceContactPointType): string
	local wb = Wire.WriteBuf.new()
	encodePbServiceContactPointTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbCustomCompoundType(cct: any): string
	local wb = Wire.WriteBuf.new()
	encodePbCustomCompoundTypeInner(wb, cct)
	return wb:tostring()
end

function Encoder.encodePbTableSchema(ts: any): string
	local wb = Wire.WriteBuf.new()
	encodePbTableSchemaInner(wb, ts)
	return wb:tostring()
end

-- ============================================================
-- Public encode functions (source/target table types)
-- ============================================================

function Encoder.encodePbLpSignatoryType(at: SourceTable.LpSignatoryType): string
	local wb = Wire.WriteBuf.new()
	encodePbLpSignatoryTypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbW9Type(at: SourceTable.W9Type): string
	local wb = Wire.WriteBuf.new()
	encodePbW9TypeInner(wb, at)
	return wb:tostring()
end

function Encoder.encodePbSourceTableFieldsMap(sfm: SourceTable.SourceTableFieldsMap): string
	local wb = Wire.WriteBuf.new()
	encodePbSourceTableFieldsMapInner(wb, sfm)
	return wb:tostring()
end

function Encoder.encodePbSourceTableSchema(sts: SourceTable.SourceTableSchema): string
	local wb = Wire.WriteBuf.new()
	encodePbSourceTableSchemaInner(wb, sts)
	return wb:tostring()
end

function Encoder.encodePbTargetTableFieldsMap(tfm: TargetTable.TargetTableFieldsMap): string
	local wb = Wire.WriteBuf.new()
	encodePbTargetTableFieldsMapInner(wb, tfm)
	return wb:tostring()
end

function Encoder.encodePbTargetTableSchema(tts: TargetTable.TargetTableSchema): string
	local wb = Wire.WriteBuf.new()
	encodePbTargetTableSchemaInner(wb, tts)
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
	-- Compound wrapper inners (for Task 4 oneof dispatch)
	encodePbPhoneFaxTypeInner = encodePbPhoneFaxTypeInner,
	encodePbDateTimeTypeInner = encodePbDateTimeTypeInner,
	encodePbMoneyTypeInner = encodePbMoneyTypeInner,
	encodePbAddressTypeInner = encodePbAddressTypeInner,
	encodePbIndividualNameTypeInner = encodePbIndividualNameTypeInner,
	encodePbCountryTypeInner = encodePbCountryTypeInner,
	encodePbBaseContactTypeInner = encodePbBaseContactTypeInner,
	encodePbSubmissionContactTypeInner = encodePbSubmissionContactTypeInner,
	encodePbSignatoryTypeInner = encodePbSignatoryTypeInner,
	encodePbBankInfoTypeInner = encodePbBankInfoTypeInner,
	encodePbBankAccountInfoTypeInner = encodePbBankAccountInfoTypeInner,
	encodePbWireInstructionsTypeInner = encodePbWireInstructionsTypeInner,
	encodePbBrokerageFirmTypeInner = encodePbBrokerageFirmTypeInner,
	encodePbBrokerageAccountTypeInner = encodePbBrokerageAccountTypeInner,
	encodePbServiceContactPointTypeInner = encodePbServiceContactPointTypeInner,
	-- Task 4: oneof dispatch + map encoding + TableSchema
	TYPEID_TO_ONEOF = TYPEID_TO_ONEOF,
	encodePbNonCustomFieldValueInner = encodePbNonCustomFieldValueInner,
	encodePbCustomCompoundTypeInner = encodePbCustomCompoundTypeInner,
	encodePbSingleFieldTypeInner = encodePbSingleFieldTypeInner,
	encodePbFieldGroupInner = encodePbFieldGroupInner,
	encodePbTableSchemaInner = encodePbTableSchemaInner,
	-- Task 5: source/target table types
	encodePbLpSignatoryFieldsInner = encodePbLpSignatoryFieldsInner,
	encodePbLpSignatoryTypeInner = encodePbLpSignatoryTypeInner,
	encodePbW9FieldsInner = encodePbW9FieldsInner,
	encodePbW9TypeInner = encodePbW9TypeInner,
	encodePbSourceTableFieldsMapInner = encodePbSourceTableFieldsMapInner,
	encodePbSourceTableSchemaInner = encodePbSourceTableSchemaInner,
	encodePbTargetTableFieldsMapInner = encodePbTargetTableFieldsMapInner,
	encodePbTargetTableSchemaInner = encodePbTargetTableSchemaInner,
}

return Encoder
