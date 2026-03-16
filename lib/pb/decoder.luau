--!strict

local Wire = require("@lib/pb/wire")
local DataTypes = require("@lib/data_types")

local Decoder = {}

-- ============================================================
-- Inner decode functions (simple types)
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
-- Compound wrapper decoder helper
-- ============================================================

local function decodeCompoundWrapper(
	buf: buffer,
	startOffset: number,
	endOffset: number,
	subFieldsDecoderFn: (buffer, number, number) -> any
): (string, any, {string}, string?)
	local typeId = ""
	local valueSubFields: any = nil
	local subFieldKeysInOrder: {string} = {}
	local label: string? = nil
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			valueSubFields = subFieldsDecoderFn(buf, offset, offset + len)
			offset = offset + len
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(subFieldKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return typeId, valueSubFields, subFieldKeysInOrder, label
end

-- ============================================================
-- Compound SubFields decoders
-- ============================================================

-- 1. PhoneFaxSubFields
local function decodePbPhoneFaxSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.PhoneFaxSubFields
	local result = DataTypes.makePhoneFaxSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 3 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.countryCode = decoded
			elseif fieldNum == 2 then result.areaCode = decoded
			elseif fieldNum == 3 then result.subscriberNumber = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 2. DateTimeSubFields
local function decodePbDateTimeSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.DateTimeSubFields
	local result = DataTypes.makeDateTimeSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then
				result.epochMs = decodePbNumberTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then
				result.zoneOffset = decodePbStringTypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 3. MoneySubFields
local function decodePbMoneySubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.MoneySubFields
	local result = DataTypes.makeMoneySubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then
				result.amount = decodePbNumberTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then
				result.isoCurrencyCode = decodePbStringTypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 4. AddressSubFields
local function decodePbAddressSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.AddressSubFields
	local result = DataTypes.makeAddressSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 6 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.numberAndStreet = decoded
			elseif fieldNum == 2 then result.city = decoded
			elseif fieldNum == 3 then result.stateProvince = decoded
			elseif fieldNum == 4 then result.country = decoded
			elseif fieldNum == 5 then result.postalZipCode = decoded
			elseif fieldNum == 6 then result.fullAddress = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 5. IndividualNameSubFields
local function decodePbIndividualNameSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.IndividualNameSubFields
	local result = DataTypes.makeIndividualNameSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 8 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.prefixName = decoded
			elseif fieldNum == 2 then result.firstName = decoded
			elseif fieldNum == 3 then result.middleName = decoded
			elseif fieldNum == 4 then result.lastName = decoded
			elseif fieldNum == 5 then result.suffixName = decoded
			elseif fieldNum == 6 then result.fullName = decoded
			elseif fieldNum == 7 then result.preferredName = decoded
			elseif fieldNum == 8 then result.jobTitle = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 6. CountrySubFields
local function decodePbCountrySubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.CountrySubFields
	local result = DataTypes.makeCountrySubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 2 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.countryName = decoded
			elseif fieldNum == 2 then result.isoCountryCode = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 7. BaseContactSubFields
local function decodePbBaseContactSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BaseContactSubFields
	local result = DataTypes.makeBaseContactSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 11 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.prefixName = decoded
			elseif fieldNum == 2 then result.firstName = decoded
			elseif fieldNum == 3 then result.middleName = decoded
			elseif fieldNum == 4 then result.lastName = decoded
			elseif fieldNum == 5 then result.suffixName = decoded
			elseif fieldNum == 6 then result.fullName = decoded
			elseif fieldNum == 7 then result.preferredName = decoded
			elseif fieldNum == 8 then result.jobTitle = decoded
			elseif fieldNum == 9 then result.email = decoded
			elseif fieldNum == 10 then result.phone = decoded
			elseif fieldNum == 11 then result.fax = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 8. SubmissionContactSubFields
local function decodePbSubmissionContactSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.SubmissionContactSubFields
	local result = DataTypes.makeSubmissionContactSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			-- Fields 12-14 are MultipleCheckboxType; rest are StringType
			if fieldNum == 12 then
				result.typeOfCorrespondences = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 13 then
				result.contactTypes = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 14 then
				result.contactRoles = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			else
				local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
				if fieldNum == 1 then result.prefixName = decoded
				elseif fieldNum == 2 then result.firstName = decoded
				elseif fieldNum == 3 then result.middleName = decoded
				elseif fieldNum == 4 then result.lastName = decoded
				elseif fieldNum == 5 then result.suffixName = decoded
				elseif fieldNum == 6 then result.fullName = decoded
				elseif fieldNum == 7 then result.preferredName = decoded
				elseif fieldNum == 8 then result.jobTitle = decoded
				elseif fieldNum == 9 then result.email = decoded
				elseif fieldNum == 10 then result.phone = decoded
				elseif fieldNum == 11 then result.fax = decoded
				elseif fieldNum == 15 then result.customId = decoded
				elseif fieldNum == 16 then result.addressNumberAndStreet = decoded
				elseif fieldNum == 17 then result.addressCity = decoded
				elseif fieldNum == 18 then result.addressStateProvince = decoded
				elseif fieldNum == 19 then result.addressCountry = decoded
				elseif fieldNum == 20 then result.addressPostalZipCode = decoded
				elseif fieldNum == 21 then result.addressFullAddress = decoded
				elseif fieldNum == 22 then result.relationshipWithPrimary = decoded
				elseif fieldNum == 23 then result.occupation = decoded
				elseif fieldNum == 24 then result.companyName = decoded
				elseif fieldNum == 25 then result.companyAddressNumberAndStreet = decoded
				elseif fieldNum == 26 then result.companyAddressCity = decoded
				elseif fieldNum == 27 then result.companyAddressStateProvince = decoded
				elseif fieldNum == 28 then result.companyAddressCountry = decoded
				elseif fieldNum == 29 then result.companyAddressPostalZipCode = decoded
				elseif fieldNum == 30 then result.companyAddressFullAddress = decoded
				elseif fieldNum == 31 then result.specifiedCompanyOrgUnit = decoded
				elseif fieldNum == 32 then result.individualEmail = decoded
				elseif fieldNum == 33 then result.individualPhone = decoded
				elseif fieldNum == 34 then result.individualFax = decoded
				end
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 9. SignatorySubFields
local function decodePbSignatorySubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.SignatorySubFields
	local result = DataTypes.makeSignatorySubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 12 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.numberAndStreet = decoded
			elseif fieldNum == 2 then result.city = decoded
			elseif fieldNum == 3 then result.stateProvince = decoded
			elseif fieldNum == 4 then result.country = decoded
			elseif fieldNum == 5 then result.postalZipCode = decoded
			elseif fieldNum == 6 then result.fullAddress = decoded
			elseif fieldNum == 7 then result.name = decoded
			elseif fieldNum == 8 then result.date = decoded
			elseif fieldNum == 9 then result.title = decoded
			elseif fieldNum == 10 then result.phone = decoded
			elseif fieldNum == 11 then result.email = decoded
			elseif fieldNum == 12 then result.signerRole = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 10. BankInfoSubFields
local function decodePbBankInfoSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BankInfoSubFields
	local result = DataTypes.makeBankInfoSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 4 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.bankName = decoded
			elseif fieldNum == 2 then result.bankLocation = decoded
			elseif fieldNum == 3 then result.aba = decoded
			elseif fieldNum == 4 then result.swift = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 11. BankAccountInfoSubFields
local function decodePbBankAccountInfoSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BankAccountInfoSubFields
	local result = DataTypes.makeBankAccountInfoSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 10 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.bankName = decoded
			elseif fieldNum == 2 then result.bankLocation = decoded
			elseif fieldNum == 3 then result.aba = decoded
			elseif fieldNum == 4 then result.swift = decoded
			elseif fieldNum == 5 then result.accountName = decoded
			elseif fieldNum == 6 then result.accountNumber = decoded
			elseif fieldNum == 7 then result.iban = decoded
			elseif fieldNum == 8 then result.furtherCreditName = decoded
			elseif fieldNum == 9 then result.furtherCreditAccount = decoded
			elseif fieldNum == 10 then result.correspondentBankAccount = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 12. WireInstructionsSubFields
local function decodePbWireInstructionsSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.WireInstructionsSubFields
	local result = DataTypes.makeWireInstructionsSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 11 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.bankName = decoded
			elseif fieldNum == 2 then result.bankLocation = decoded
			elseif fieldNum == 3 then result.aba = decoded
			elseif fieldNum == 4 then result.swift = decoded
			elseif fieldNum == 5 then result.accountName = decoded
			elseif fieldNum == 6 then result.accountNumber = decoded
			elseif fieldNum == 7 then result.iban = decoded
			elseif fieldNum == 8 then result.furtherCreditName = decoded
			elseif fieldNum == 9 then result.furtherCreditAccount = decoded
			elseif fieldNum == 10 then result.correspondentBankAccount = decoded
			elseif fieldNum == 11 then result.attention = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 13. BrokerageFirmSubFields
local function decodePbBrokerageFirmSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BrokerageFirmSubFields
	local result = DataTypes.makeBrokerageFirmSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 2 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.firmName = decoded
			elseif fieldNum == 2 then result.firmOfficeBranchLocation = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 14. BrokerageAccountSubFields
local function decodePbBrokerageAccountSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BrokerageAccountSubFields
	local result = DataTypes.makeBrokerageAccountSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 12 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.firmName = decoded
			elseif fieldNum == 2 then result.firmOfficeBranchLocation = decoded
			elseif fieldNum == 3 then result.dtcNumber = decoded
			elseif fieldNum == 4 then result.crestParticipantId = decoded
			elseif fieldNum == 5 then result.bicCode = decoded
			elseif fieldNum == 6 then result.beneficiaryAccountNumber = decoded
			elseif fieldNum == 7 then result.beneficiaryAccountName = decoded
			elseif fieldNum == 8 then result.intermediaryAccountName = decoded
			elseif fieldNum == 9 then result.intermediaryAccountNumber = decoded
			elseif fieldNum == 10 then result.intermediaryBicCode = decoded
			elseif fieldNum == 11 then result.securitiesSettlementInstructions = decoded
			elseif fieldNum == 12 then result.attention = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- 15. ServiceContactPointSubFields
local function decodePbServiceContactPointSubFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.ServiceContactPointSubFields
	local result = DataTypes.makeServiceContactPointSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 4 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.name = decoded
			elseif fieldNum == 2 then result.officeBranchLocation = decoded
			elseif fieldNum == 3 then result.phone = decoded
			elseif fieldNum == 4 then result.email = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- ============================================================
-- Compound wrapper decoder functions
-- ============================================================

local function decodePbPhoneFaxTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.PhoneFaxType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbPhoneFaxSubFieldsFromBuf)
	return DataTypes.makePhoneFaxType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbDateTimeTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.DateTimeType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbDateTimeSubFieldsFromBuf)
	return DataTypes.makeDateTimeType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbMoneyTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.MoneyType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbMoneySubFieldsFromBuf)
	return DataTypes.makeMoneyType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbAddressTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.AddressType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbAddressSubFieldsFromBuf)
	return DataTypes.makeAddressType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbIndividualNameTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.IndividualNameType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbIndividualNameSubFieldsFromBuf)
	return DataTypes.makeIndividualNameType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbCountryTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.CountryType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbCountrySubFieldsFromBuf)
	return DataTypes.makeCountryType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbBaseContactTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BaseContactType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbBaseContactSubFieldsFromBuf)
	return DataTypes.makeBaseContactType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbSubmissionContactTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.SubmissionContactType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbSubmissionContactSubFieldsFromBuf)
	return DataTypes.makeSubmissionContactType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbSignatoryTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.SignatoryType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbSignatorySubFieldsFromBuf)
	return DataTypes.makeSignatoryType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbBankInfoTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BankInfoType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbBankInfoSubFieldsFromBuf)
	return DataTypes.makeBankInfoType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbBankAccountInfoTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BankAccountInfoType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbBankAccountInfoSubFieldsFromBuf)
	return DataTypes.makeBankAccountInfoType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbWireInstructionsTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.WireInstructionsType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbWireInstructionsSubFieldsFromBuf)
	return DataTypes.makeWireInstructionsType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbBrokerageFirmTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BrokerageFirmType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbBrokerageFirmSubFieldsFromBuf)
	return DataTypes.makeBrokerageFirmType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbBrokerageAccountTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BrokerageAccountType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbBrokerageAccountSubFieldsFromBuf)
	return DataTypes.makeBrokerageAccountType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

local function decodePbServiceContactPointTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.ServiceContactPointType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbServiceContactPointSubFieldsFromBuf)
	return DataTypes.makeServiceContactPointType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

-- ============================================================
-- Oneof dispatch decoder
-- ============================================================

local ONEOF_FIELD_DECODERS: {[number]: (buffer, number, number) -> any} = {
	[1] = decodePbStringTypeFromBuf,
	[2] = decodePbNumberTypeFromBuf,
	[3] = decodePbBooleanTypeFromBuf,
	[4] = decodePbEnumTypeFromBuf,
	[5] = decodePbMultipleCheckboxTypeFromBuf,
	[6] = decodePbRadioGroupTypeFromBuf,
	[7] = decodePbPhoneFaxTypeFromBuf,
	[8] = decodePbDateTimeTypeFromBuf,
	[9] = decodePbMoneyTypeFromBuf,
	[10] = decodePbAddressTypeFromBuf,
	[11] = decodePbIndividualNameTypeFromBuf,
	[12] = decodePbCountryTypeFromBuf,
	[13] = decodePbBaseContactTypeFromBuf,
	[14] = decodePbSubmissionContactTypeFromBuf,
	[15] = decodePbSignatoryTypeFromBuf,
	[16] = decodePbBankInfoTypeFromBuf,
	[17] = decodePbBankAccountInfoTypeFromBuf,
	[18] = decodePbWireInstructionsTypeFromBuf,
	[19] = decodePbBrokerageFirmTypeFromBuf,
	[20] = decodePbBrokerageAccountTypeFromBuf,
	[21] = decodePbServiceContactPointTypeFromBuf,
}

-- NonCustomFieldValue: reads first oneof field (fields 1-21)
local function decodePbNonCustomFieldValueFromBuf(buf: buffer, startOffset: number, endOffset: number): any
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		local decoder = ONEOF_FIELD_DECODERS[fieldNum]
		if decoder and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			return decoder(buf, offset, offset + len)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return nil
end

-- CustomCompoundType: 1=typeId, 2=map<string, NonCustomFieldValue>, 3=subFieldKeysInOrder, 4=label
local function decodePbCustomCompoundTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): any
	local typeId = ""
	local valueSubFields: {[string]: any} = {}
	local subFieldKeysInOrder: {string} = {}
	local label: string? = nil
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			-- After decoding varint: offset points to start of data; data ends at offset + len
			-- But decodeVarint has already advanced offset past the length prefix,
			-- so the data (string/nested bytes) is at [offset, offset + len)
			-- NOTE: for the outer loop we track offset as pointing BEFORE the data for sub-reads.
			-- Re-derive: dataStart = offset, dataEnd = offset + len
			-- We need to advance offset past the data: offset = offset + len
			local dataStart = offset
			local dataEnd = offset + len
			offset = dataEnd
			if fieldNum == 1 then
				typeId = buffer.readstring(buf, dataStart, len)
			elseif fieldNum == 2 then
				-- Map entry: nested message with key(field 1 = string), value(field 2 = nested NonCustomFieldValue)
				local entryKey = ""
				local entryVal: any = nil
				local entryOffset = dataStart
				while entryOffset < dataEnd do
					local ef, ew, eno = Wire.decodeTag(buf, entryOffset)
					entryOffset = eno
					if ef == 1 and ew == Wire.LENGTH_DELIMITED then
						local klen: number
						klen, entryOffset = Wire.decodeVarint(buf, entryOffset)
						entryKey = buffer.readstring(buf, entryOffset, klen)
						entryOffset = entryOffset + klen
					elseif ef == 2 and ew == Wire.LENGTH_DELIMITED then
						local vlen: number
						vlen, entryOffset = Wire.decodeVarint(buf, entryOffset)
						entryVal = decodePbNonCustomFieldValueFromBuf(buf, entryOffset, entryOffset + vlen)
						entryOffset = entryOffset + vlen
					else
						entryOffset = Wire.skipField(buf, entryOffset, ew)
					end
				end
				if entryKey ~= "" then
					valueSubFields[entryKey] = entryVal
				end
			elseif fieldNum == 3 then
				table.insert(subFieldKeysInOrder, buffer.readstring(buf, dataStart, len))
			elseif fieldNum == 4 then
				label = buffer.readstring(buf, dataStart, len)
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		typeId = typeId,
		valueSubFields = valueSubFields,
		subFieldKeysInOrder = subFieldKeysInOrder,
		label = label,
	}
end

-- SingleFieldType: oneof fields 1-22 + label field 23
local function decodePbSingleFieldTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): any
	local value: any = nil
	local label: string? = nil
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local dataStart = offset
			local dataEnd = offset + len
			offset = dataEnd
			if fieldNum >= 1 and fieldNum <= 21 then
				local decoder = ONEOF_FIELD_DECODERS[fieldNum]
				if decoder then
					value = decoder(buf, dataStart, dataEnd)
				end
			elseif fieldNum == 22 then
				value = decodePbCustomCompoundTypeFromBuf(buf, dataStart, dataEnd)
			elseif fieldNum == 23 then
				label = buffer.readstring(buf, dataStart, len)
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		value = value,
		label = label or "",
	}
end

-- FieldGroup: 1=label, 2=startIdx, 3=endIdx
local function decodePbFieldGroupFromBuf(buf: buffer, startOffset: number, endOffset: number): any
	local label = ""
	local startIdx = 0
	local endIdx = 0
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.VARINT then
			startIdx, offset = Wire.decodeInt32(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.VARINT then
			endIdx, offset = Wire.decodeInt32(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		label = label,
		startIdx = startIdx,
		endIdx = endIdx,
	}
end

-- TableSchema: 1=fieldsMap(map), 2=fieldKeysInOrder, 3=label, 4=groups
local function decodePbTableSchemaFromBuf(buf: buffer, startOffset: number, endOffset: number): any
	local fieldsMap: {[string]: any} = {}
	local fieldKeysInOrder: {string} = {}
	local label = ""
	local groups: {any} = {}
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local dataStart = offset
			local dataEnd = offset + len
			offset = dataEnd
			if fieldNum == 1 then
				-- Map entry: key(field 1 = string), value(field 2 = nested SingleFieldType)
				local entryKey = ""
				local entryVal: any = nil
				local entryOffset = dataStart
				while entryOffset < dataEnd do
					local ef, ew, eno = Wire.decodeTag(buf, entryOffset)
					entryOffset = eno
					if ef == 1 and ew == Wire.LENGTH_DELIMITED then
						local klen: number
						klen, entryOffset = Wire.decodeVarint(buf, entryOffset)
						entryKey = buffer.readstring(buf, entryOffset, klen)
						entryOffset = entryOffset + klen
					elseif ef == 2 and ew == Wire.LENGTH_DELIMITED then
						local vlen: number
						vlen, entryOffset = Wire.decodeVarint(buf, entryOffset)
						entryVal = decodePbSingleFieldTypeFromBuf(buf, entryOffset, entryOffset + vlen)
						entryOffset = entryOffset + vlen
					else
						entryOffset = Wire.skipField(buf, entryOffset, ew)
					end
				end
				if entryKey ~= "" then
					fieldsMap[entryKey] = entryVal
				end
			elseif fieldNum == 2 then
				table.insert(fieldKeysInOrder, buffer.readstring(buf, dataStart, len))
			elseif fieldNum == 3 then
				label = buffer.readstring(buf, dataStart, len)
			elseif fieldNum == 4 then
				local fg = decodePbFieldGroupFromBuf(buf, dataStart, dataEnd)
				table.insert(groups, fg)
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		fieldsMap = fieldsMap,
		fieldKeysInOrder = fieldKeysInOrder,
		label = label,
		groups = groups,
	}
end

-- ============================================================
-- Public decode functions (simple types)
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
-- Public decode functions (compound types)
-- ============================================================

function Decoder.decodePbPhoneFaxType(bytes: string): DataTypes.PhoneFaxType
	local buf = buffer.fromstring(bytes)
	return decodePbPhoneFaxTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbDateTimeType(bytes: string): DataTypes.DateTimeType
	local buf = buffer.fromstring(bytes)
	return decodePbDateTimeTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbMoneyType(bytes: string): DataTypes.MoneyType
	local buf = buffer.fromstring(bytes)
	return decodePbMoneyTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbAddressType(bytes: string): DataTypes.AddressType
	local buf = buffer.fromstring(bytes)
	return decodePbAddressTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbIndividualNameType(bytes: string): DataTypes.IndividualNameType
	local buf = buffer.fromstring(bytes)
	return decodePbIndividualNameTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbCountryType(bytes: string): DataTypes.CountryType
	local buf = buffer.fromstring(bytes)
	return decodePbCountryTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBaseContactType(bytes: string): DataTypes.BaseContactType
	local buf = buffer.fromstring(bytes)
	return decodePbBaseContactTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbSubmissionContactType(bytes: string): DataTypes.SubmissionContactType
	local buf = buffer.fromstring(bytes)
	return decodePbSubmissionContactTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbSignatoryType(bytes: string): DataTypes.SignatoryType
	local buf = buffer.fromstring(bytes)
	return decodePbSignatoryTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBankInfoType(bytes: string): DataTypes.BankInfoType
	local buf = buffer.fromstring(bytes)
	return decodePbBankInfoTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBankAccountInfoType(bytes: string): DataTypes.BankAccountInfoType
	local buf = buffer.fromstring(bytes)
	return decodePbBankAccountInfoTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbWireInstructionsType(bytes: string): DataTypes.WireInstructionsType
	local buf = buffer.fromstring(bytes)
	return decodePbWireInstructionsTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBrokerageFirmType(bytes: string): DataTypes.BrokerageFirmType
	local buf = buffer.fromstring(bytes)
	return decodePbBrokerageFirmTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbBrokerageAccountType(bytes: string): DataTypes.BrokerageAccountType
	local buf = buffer.fromstring(bytes)
	return decodePbBrokerageAccountTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbServiceContactPointType(bytes: string): DataTypes.ServiceContactPointType
	local buf = buffer.fromstring(bytes)
	return decodePbServiceContactPointTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbCustomCompoundType(bytes: string): any
	local buf = buffer.fromstring(bytes)
	return decodePbCustomCompoundTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbTableSchema(bytes: string): any
	local buf = buffer.fromstring(bytes)
	return decodePbTableSchemaFromBuf(buf, 0, buffer.len(buf))
end

-- ============================================================
-- Source/Target table decoders
-- ============================================================

local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")

-- LpSignatoryFields: 1=asaCommitmentAmount(StringType), 2=individualSubscribernameSignaturepage(StringType), 3=entityAuthorizednameSignaturepage(StringType)
local function decodePbLpSignatoryFieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.LpSignatoryFields
	local result = SourceTable.makeLpSignatoryFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.asaCommitmentAmount = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then result.individualSubscribernameSignaturepage = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 3 then result.entityAuthorizednameSignaturepage = decodePbStringTypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- LpSignatoryType: compound wrapper
local function decodePbLpSignatoryTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.LpSignatoryType
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbLpSignatoryFieldsFromBuf)
	return SourceTable.makeLpSignatoryType({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

-- W9Fields: 1=w9PartiSsn1(StringType), 2=w9PartiEin1(StringType), 3=w9Line2(StringType)
local function decodePbW9FieldsFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.W9Fields
	local result = SourceTable.makeW9Fields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.w9PartiSsn1 = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then result.w9PartiEin1 = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 3 then result.w9Line2 = decodePbStringTypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- W9Type: compound wrapper
local function decodePbW9TypeFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.W9Type
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbW9FieldsFromBuf)
	return SourceTable.makeW9Type({ typeId = typeId, valueSubFields = subFields, subFieldKeysInOrder = keysInOrder, label = label })
end

-- SourceTableFieldsMap: fixed-field proto message
local function decodePbSourceTableFieldsMapFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.SourceTableFieldsMap
	local result = SourceTable.makeSourceTableFieldsMap()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.lpSignatory = decodePbLpSignatoryTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then result.asaFullnameInvestornameAmlquestionnaire = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 3 then result.asaFullnameInvestornameGeneralinfo1 = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 4 then result.luxsentityRegulatedstatusPart2Duediligencequestionnaire = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 5 then result.indiInternationalsupplementsPart1Duediligencequestionnaire = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 6 then result.entityInternationalsupplementsPart1Duediligencequestionnaire = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 7 then result.w9 = decodePbW9TypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- SourceTableSchema: 1=fieldsMap, 2=fieldKeysInOrder, 3=label
local function decodePbSourceTableSchemaFromBuf(buf: buffer, startOffset: number, endOffset: number): SourceTable.SourceTableSchema
	local result = SourceTable.makeSourceTableSchema()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.fieldsMap = decodePbSourceTableFieldsMapFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then
				local val: string = buffer.readstring(buf, offset, len)
				table.insert(result.fieldKeysInOrder, val)
			elseif fieldNum == 3 then
				result.label = buffer.readstring(buf, offset, len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- TargetTableFieldsMap: fixed-field proto message
local function decodePbTargetTableFieldsMapFromBuf(buf: buffer, startOffset: number, endOffset: number): TargetTable.TargetTableFieldsMap
	local result = TargetTable.makeTargetTableFieldsMap()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.sfAgreementNullCommitmentC = decodePbMoneyTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then result.sfAccountSubscriptionInvestorName = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 3 then result.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = decodePbRadioGroupTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 4 then result.sfAgreementNullWlcInternationalSupplementsC = decodePbMultipleCheckboxTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 5 then result.sfAgreementNullSignerFirstName = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 6 then result.sfAgreementNullSignerMiddleName = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 7 then result.sfAgreementNullSignerLastName = decodePbStringTypeFromBuf(buf, offset, offset + len)
			elseif fieldNum == 8 then result.sfTaxFormW9UsTinTypeC = decodePbRadioGroupTypeFromBuf(buf, offset, offset + len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- TargetTableSchema: 1=fieldsMap, 2=fieldKeysInOrder, 3=label
local function decodePbTargetTableSchemaFromBuf(buf: buffer, startOffset: number, endOffset: number): TargetTable.TargetTableSchema
	local result = TargetTable.makeTargetTableSchema()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			if fieldNum == 1 then result.fieldsMap = decodePbTargetTableFieldsMapFromBuf(buf, offset, offset + len)
			elseif fieldNum == 2 then
				local val: string = buffer.readstring(buf, offset, len)
				table.insert(result.fieldKeysInOrder, val)
			elseif fieldNum == 3 then
				result.label = buffer.readstring(buf, offset, len)
			end
			offset = offset + len
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

-- Public decode functions (source/target table types)

function Decoder.decodePbLpSignatoryType(bytes: string): SourceTable.LpSignatoryType
	local buf = buffer.fromstring(bytes)
	return decodePbLpSignatoryTypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbW9Type(bytes: string): SourceTable.W9Type
	local buf = buffer.fromstring(bytes)
	return decodePbW9TypeFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbSourceTableFieldsMap(bytes: string): SourceTable.SourceTableFieldsMap
	local buf = buffer.fromstring(bytes)
	return decodePbSourceTableFieldsMapFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbSourceTableSchema(bytes: string): SourceTable.SourceTableSchema
	local buf = buffer.fromstring(bytes)
	return decodePbSourceTableSchemaFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbTargetTableFieldsMap(bytes: string): TargetTable.TargetTableFieldsMap
	local buf = buffer.fromstring(bytes)
	return decodePbTargetTableFieldsMapFromBuf(buf, 0, buffer.len(buf))
end

function Decoder.decodePbTargetTableSchema(bytes: string): TargetTable.TargetTableSchema
	local buf = buffer.fromstring(bytes)
	return decodePbTargetTableSchemaFromBuf(buf, 0, buffer.len(buf))
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
	-- Compound wrapper inners (for Task 4 oneof dispatch)
	decodePbPhoneFaxTypeFromBuf = decodePbPhoneFaxTypeFromBuf,
	decodePbDateTimeTypeFromBuf = decodePbDateTimeTypeFromBuf,
	decodePbMoneyTypeFromBuf = decodePbMoneyTypeFromBuf,
	decodePbAddressTypeFromBuf = decodePbAddressTypeFromBuf,
	decodePbIndividualNameTypeFromBuf = decodePbIndividualNameTypeFromBuf,
	decodePbCountryTypeFromBuf = decodePbCountryTypeFromBuf,
	decodePbBaseContactTypeFromBuf = decodePbBaseContactTypeFromBuf,
	decodePbSubmissionContactTypeFromBuf = decodePbSubmissionContactTypeFromBuf,
	decodePbSignatoryTypeFromBuf = decodePbSignatoryTypeFromBuf,
	decodePbBankInfoTypeFromBuf = decodePbBankInfoTypeFromBuf,
	decodePbBankAccountInfoTypeFromBuf = decodePbBankAccountInfoTypeFromBuf,
	decodePbWireInstructionsTypeFromBuf = decodePbWireInstructionsTypeFromBuf,
	decodePbBrokerageFirmTypeFromBuf = decodePbBrokerageFirmTypeFromBuf,
	decodePbBrokerageAccountTypeFromBuf = decodePbBrokerageAccountTypeFromBuf,
	decodePbServiceContactPointTypeFromBuf = decodePbServiceContactPointTypeFromBuf,
	-- Task 4: oneof dispatch + map decoding + TableSchema
	ONEOF_FIELD_DECODERS = ONEOF_FIELD_DECODERS,
	decodePbNonCustomFieldValueFromBuf = decodePbNonCustomFieldValueFromBuf,
	decodePbCustomCompoundTypeFromBuf = decodePbCustomCompoundTypeFromBuf,
	decodePbSingleFieldTypeFromBuf = decodePbSingleFieldTypeFromBuf,
	decodePbFieldGroupFromBuf = decodePbFieldGroupFromBuf,
	decodePbTableSchemaFromBuf = decodePbTableSchemaFromBuf,
	-- Task 5: source/target table types
	decodePbLpSignatoryFieldsFromBuf = decodePbLpSignatoryFieldsFromBuf,
	decodePbLpSignatoryTypeFromBuf = decodePbLpSignatoryTypeFromBuf,
	decodePbW9FieldsFromBuf = decodePbW9FieldsFromBuf,
	decodePbW9TypeFromBuf = decodePbW9TypeFromBuf,
	decodePbSourceTableFieldsMapFromBuf = decodePbSourceTableFieldsMapFromBuf,
	decodePbSourceTableSchemaFromBuf = decodePbSourceTableSchemaFromBuf,
	decodePbTargetTableFieldsMapFromBuf = decodePbTargetTableFieldsMapFromBuf,
	decodePbTargetTableSchemaFromBuf = decodePbTargetTableSchemaFromBuf,
}

return Decoder
