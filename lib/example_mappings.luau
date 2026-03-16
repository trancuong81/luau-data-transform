--!strict
local DataTypes = require("@lib/data_types")
local SourceTable = require("@lib/source_table")
local TargetTable = require("@lib/target_table")

local ExampleMappings = {}

export type NameParts = {
	firstName: string,
	middleName: string,
	lastName: string,
}

function ExampleMappings.splitName(fullname: string): NameParts
	local trimmed = string.gsub(fullname, "^%s+", "")
	trimmed = string.gsub(trimmed, "%s+$", "")

	if trimmed == "" then
		return { firstName = "", middleName = "", lastName = "" }
	end

	local parts: {string} = {}
	for part in string.gmatch(trimmed, "%S+") do
		table.insert(parts, part)
	end

	if #parts == 0 then
		return { firstName = "", middleName = "", lastName = "" }
	elseif #parts == 1 then
		return { firstName = parts[1], middleName = "", lastName = parts[1] }
	elseif #parts == 2 then
		return { firstName = parts[1], middleName = "", lastName = parts[2] }
	else
		local first = parts[1]
		local last = parts[#parts]
		local middleParts: {string} = {}
		for i = 2, #parts - 1 do
			table.insert(middleParts, parts[i])
		end
		local middle = table.concat(middleParts, " ")
		return { firstName = first, middleName = middle, lastName = last }
	end
end

-- Helpers
local function stringValue(st: DataTypes.StringType?): string
	if st == nil then
		return ""
	end
	return (st :: DataTypes.StringType).value
end

local function selectedKeys(mct: DataTypes.MultipleCheckboxType?): {string}
	if mct == nil then
		return {}
	end
	return (mct :: DataTypes.MultipleCheckboxType).selectedKeys
end

local function firstNonEmpty(values: {string}): string
	for _, s in values do
		if s ~= "" then
			return s
		end
	end
	return ""
end

-- 1. Commitment
local function mapCommitment(src: SourceTable.SourceTableFieldsMap): DataTypes.MoneyType
	local raw = ""
	if src.lpSignatory ~= nil then
		local lp = src.lpSignatory :: SourceTable.LpSignatoryType
		if lp.valueSubFields ~= nil then
			raw = stringValue((lp.valueSubFields :: SourceTable.LpSignatoryFields).asaCommitmentAmount)
		end
	end
	local amountStr = string.gsub(raw, ",", "")
	local amountVal = tonumber(amountStr) or 0
	local amount = DataTypes.makeNumberType({ typeId = "Number", value = amountVal })
	local subFields = DataTypes.makeMoneySubFields({ amount = amount })
	return DataTypes.makeMoneyType({ typeId = "Money", valueSubFields = subFields })
end

-- 2. Investor Name
local function mapInvestorName(src: SourceTable.SourceTableFieldsMap): DataTypes.StringType
	local aml = stringValue(src.asaFullnameInvestornameAmlquestionnaire)
	local general = stringValue(src.asaFullnameInvestornameGeneralinfo1)
	local value = firstNonEmpty({ aml, general })
	return DataTypes.makeStringType({ typeId = "String", value = value })
end

-- 3. Regulated Status
local function mapRegulatedStatus(src: SourceTable.SourceTableFieldsMap): DataTypes.RadioGroupType
	local optionMap: {[string]: string} = {
		["yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "true",
		["no_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "false",
	}
	local keys = selectedKeys(src.luxsentityRegulatedstatusPart2Duediligencequestionnaire)
	local selectedKey = ""
	for _, k in keys do
		local mapped = optionMap[k]
		if mapped ~= nil then
			selectedKey = mapped
			break
		end
	end
	return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = selectedKey })
end

-- 4. International Supplements
local function mapInternationalSupplements(src: SourceTable.SourceTableFieldsMap): DataTypes.MultipleCheckboxType
	local optionMap: {[string]: string} = {
		["eea_indi_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
		["uk_indi_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
		["swiss_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
		["canada_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
		["japan_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
		["none_indi_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
		["eea_entity_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
		["uk_entity_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
		["swiss_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
		["canada_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
		["japan_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
		["none_entity_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
	}
	local indiKeys = selectedKeys(src.indiInternationalsupplementsPart1Duediligencequestionnaire)
	local entityKeys = selectedKeys(src.entityInternationalsupplementsPart1Duediligencequestionnaire)

	local mapped: {string} = {}
	local seen: {[string]: boolean} = {}

	local function addMapped(keys: {string})
		for _, k in keys do
			local target = optionMap[k]
			if target ~= nil and not seen[target] then
				seen[target] = true
				table.insert(mapped, target)
			end
		end
	end

	addMapped(indiKeys)
	addMapped(entityKeys)

	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = mapped })
end

-- 5. Signer Name
local function mapSignerName(src: SourceTable.SourceTableFieldsMap): (DataTypes.StringType, DataTypes.StringType, DataTypes.StringType)
	local fullname = ""
	if src.lpSignatory ~= nil then
		local lp = src.lpSignatory :: SourceTable.LpSignatoryType
		if lp.valueSubFields ~= nil then
			local fields = lp.valueSubFields :: SourceTable.LpSignatoryFields
			local ind = stringValue(fields.individualSubscribernameSignaturepage)
			local ent = stringValue(fields.entityAuthorizednameSignaturepage)
			fullname = firstNonEmpty({ ind, ent })
		end
	end
	local parts = ExampleMappings.splitName(fullname)
	return DataTypes.makeStringType({ typeId = "String", value = parts.firstName }),
		DataTypes.makeStringType({ typeId = "String", value = parts.middleName }),
		DataTypes.makeStringType({ typeId = "String", value = parts.lastName })
end

-- 6. W9 TIN Type
local function mapW9TinType(src: SourceTable.SourceTableFieldsMap): DataTypes.RadioGroupType
	if src.w9 == nil then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "EIN" })
	end
	local w9 = src.w9 :: SourceTable.W9Type
	if w9.valueSubFields == nil then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "EIN" })
	end
	local fields = w9.valueSubFields :: SourceTable.W9Fields
	local line2 = stringValue(fields.w9Line2)
	if line2 ~= "" then
		return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = "" })
	end
	local hasSsn = stringValue(fields.w9PartiSsn1) ~= ""
	local key = if hasSsn then "SSN" else "EIN"
	return DataTypes.makeRadioGroupType({ typeId = "RadioGroup", selectedKey = key })
end

-- Main transform
function ExampleMappings.transform(src: SourceTable.SourceTableFieldsMap): TargetTable.TargetTableFieldsMap
	local commitment = mapCommitment(src)
	local investorName = mapInvestorName(src)
	local regulatedStatus = mapRegulatedStatus(src)
	local intlSupplements = mapInternationalSupplements(src)
	local first, middle, last = mapSignerName(src)
	local tinType = mapW9TinType(src)
	return TargetTable.makeTargetTableFieldsMap({
		sfAgreementNullCommitmentC = commitment,
		sfAccountSubscriptionInvestorName = investorName,
		sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC = regulatedStatus,
		sfAgreementNullWlcInternationalSupplementsC = intlSupplements,
		sfAgreementNullSignerFirstName = first,
		sfAgreementNullSignerMiddleName = middle,
		sfAgreementNullSignerLastName = last,
		sfTaxFormW9UsTinTypeC = tinType,
	})
end

return ExampleMappings
