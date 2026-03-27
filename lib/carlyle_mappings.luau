--!strict
local DataTypes = require("@lib/data_types")
local SourceFeederTable = require("@lib/source_feeder_table")
local SourceMasterTable = require("@lib/source_master_table")
local SourceW9Table = require("@lib/source_w9_table")
local SourceContactTable = require("@lib/source_contact_table")
local FullTargetTable = require("@lib/full_target_table")

local CarlyleMappings = {}

-- Re-export splitName type for tests
export type NameParts = {
	firstName: string,
	middleName: string,
	lastName: string,
}

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function getField(source: any, fieldName: string): any
	if source == nil then
		return nil
	end
	return (source :: { [string]: any })[fieldName]
end

local function getSubField(source: any, parentName: string, fieldName: string): any
	local parent = getField(source, parentName)
	if parent == nil then
		return nil
	end
	local vsf = (parent :: { [string]: any }).valueSubFields
	if vsf == nil then
		return nil
	end
	return (vsf :: { [string]: any })[fieldName]
end

-- Source descriptor: {ns: string, field: string, parent: string?}
type SourceDesc = { ns: string, field: string, parent: string? }

local function collectTextValues(sources: { [string]: any }, srcList: { SourceDesc }): string
	local parts: { string } = {}
	for _, src in srcList do
		local ns = sources[src.ns]
		if ns ~= nil then
			local raw: any
			if src.parent ~= nil then
				raw = getSubField(ns, src.parent :: string, src.field)
			else
				raw = getField(ns, src.field)
			end
			if raw ~= nil then
				local v = (raw :: { [string]: any }).value
				if v ~= nil and v ~= "" then
					table.insert(parts, v :: string)
				end
			end
		end
	end
	return table.concat(parts, "")
end

local function collectSelectedKeys(sources: { [string]: any }, srcList: { SourceDesc }): { string }
	local result: { string } = {}
	for _, src in srcList do
		local ns = sources[src.ns]
		if ns ~= nil then
			local raw: any
			if src.parent ~= nil then
				raw = getSubField(ns, src.parent :: string, src.field)
			else
				raw = getField(ns, src.field)
			end
			if raw ~= nil then
				local keys = (raw :: { [string]: any }).selectedKeys
				if keys ~= nil then
					for _, k in keys :: { string } do
						table.insert(result, k)
					end
				end
			end
		end
	end
	return result
end

local function mapAndDedup(keys: { string }, optionMap: { [string]: string }): { string }
	local result: { string } = {}
	local seen: { [string]: boolean } = {}
	for _, k in keys do
		local mapped = optionMap[k]
		if mapped ~= nil and not seen[mapped] then
			seen[mapped] = true
			table.insert(result, mapped)
		end
	end
	return result
end

function CarlyleMappings.splitName(fullname: string): NameParts
	local trimmed = string.gsub(fullname, "^%s+", "")
	trimmed = string.gsub(trimmed, "%s+$", "")

	if trimmed == "" then
		return { firstName = "", middleName = "", lastName = "" }
	end

	local parts: { string } = {}
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
		local middleParts: { string } = {}
		for i = 2, #parts - 1 do
			table.insert(middleParts, parts[i])
		end
		local middle = table.concat(middleParts, " ")
		return { firstName = first, middleName = middle, lastName = last }
	end
end

--------------------------------------------------------------------------------
-- Pattern Executors
--------------------------------------------------------------------------------

type TextboxRule = {
	target: string,
	sources: { SourceDesc },
}

type RadioGroupRule = {
	target: string,
	sources: { SourceDesc },
	optionMap: { [string]: string },
}

type CheckboxBooleanRule = {
	target: string,
	sources: { SourceDesc },
	trueKeys: { string },
}

type NameSplitRule = {
	targetFirst: string,
	targetMiddle: string,
	targetLast: string,
	sources: { SourceDesc },
}

type W9TextboxRule = {
	target: string,
	w9Field: string,
}

type W9RadioGroupRule = {
	target: string,
	sources: { SourceDesc },
	optionMap: { [string]: string },
}

local function applyTextbox(sources: { [string]: any }, rule: TextboxRule): DataTypes.StringType?
	local value = collectTextValues(sources, rule.sources)
	if value == "" then
		return nil
	end
	return DataTypes.makeStringType({ typeId = "String", value = value })
end

local function applyRadioGroup(sources: { [string]: any }, rule: RadioGroupRule): DataTypes.MultipleCheckboxType?
	local keys = collectSelectedKeys(sources, rule.sources)
	local mapped = mapAndDedup(keys, rule.optionMap)
	if #mapped == 0 then
		return nil
	end
	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = mapped })
end

local function applyCheckboxBoolean(sources: { [string]: any }, rule: CheckboxBooleanRule): DataTypes.MultipleCheckboxType
	local keys = collectSelectedKeys(sources, rule.sources)
	local trueSet: { [string]: boolean } = {}
	for _, tk in rule.trueKeys do
		trueSet[tk] = true
	end
	for _, k in keys do
		if trueSet[k] then
			return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = { "true" } })
		end
	end
	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = { "false" } })
end

local function applyW9Textbox(w9: SourceW9Table.SourceW9TableFieldsMap, rule: W9TextboxRule): DataTypes.StringType?
	local raw = getField(w9, rule.w9Field)
	if raw == nil then
		return nil
	end
	local v = (raw :: { [string]: any }).value
	if v == nil or v == "" then
		return nil
	end
	return DataTypes.makeStringType({ typeId = "String", value = v :: string })
end

--------------------------------------------------------------------------------
-- Rule Tables
--------------------------------------------------------------------------------

-- Non-W9 textbox rules (always applied)
local textboxRules: { TextboxRule } = {
	-- // textbox: sf_Account_SubscriptionInvestor_Name
	{
		target = "sfAccountSubscriptionInvestorName",
		sources = {
			{ ns = "master", field = "asaFullnameInvestornameAmlquestionnaire" },
			{ ns = "master", field = "asaFullnameInvestornameGeneralinfo1" },
			{ ns = "feeder", field = "asaFullnameInvestornameAmlquestionnaire" },
			{ ns = "feeder", field = "asaFullnameInvestornameGeneralinfo1" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Occupation_c
	{
		target = "sfAccountSubscriptionInvestorWLCOccupationC",
		sources = {
			{ ns = "master", field = "asaOccupationIndividualAmlquestionnaire" },
			{ ns = "feeder", field = "asaOccupationIndividualAmlquestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Title_c
	{
		target = "sfAccountSubscriptionInvestorWLCTitleC",
		sources = {
			{ ns = "master", field = "professionalactivityAndTitleIndividualAmlquestionnaire" },
			{ ns = "feeder", field = "professionalactivityAndTitleIndividualAmlquestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Employer_Name_c
	{
		target = "sfAccountSubscriptionInvestorWLCEmployerNameC",
		sources = {
			{ ns = "master", field = "nameofemployerPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "nameofemployerPart1Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Subscribing_as_Representative_Details_c
	{
		target = "sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC",
		sources = {
			{ ns = "master", field = "specifyotherCategoryNomineePart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "specifyotherCategoryNomineePart1Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Trade_Name_c
	{
		target = "sfAccountSubscriptionInvestorWLCTradeNameC",
		sources = {
			{ ns = "master", field = "tradenamePart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "tradenamePart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_AML_Address_Country_c
	{
		target = "sfAccountSubscriptionInvestorAMLAddressCountryC",
		sources = {
			{ ns = "master", field = "jurisdictionoforganizationPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "jurisdictionoforganizationPart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Date_of_Organization_Formation_Date_c
	{
		target = "sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC",
		sources = {
			{ ns = "master", field = "asaDateofestablishmentEntityAmlquestionnaire" },
			{ ns = "feeder", field = "asaDateofestablishmentEntityAmlquestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Website
	{
		target = "sfAccountSubscriptionInvestorWebsite",
		sources = {
			{ ns = "master", field = "websitePart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "websitePart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Equity_Tax_Id_c (appears twice in CUE, only keep once)
	{
		target = "sfAccountSubscriptionInvestorEquityTaxIdC",
		sources = {
			{ ns = "master", field = "ssnorftiorppnoPart1Duediligencequestionnaire" },
			{ ns = "master", field = "tinPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "ssnorftiorppnoPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "tinPart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Regulator_c
	{
		target = "sfAccountSubscriptionInvestorWLCRegulatorC",
		sources = {
			{ ns = "master", field = "indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Exchange_c
	{
		target = "sfAccountSubscriptionInvestorWLCExchangeC",
		sources = {
			{ ns = "master", field = "indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_WLC_Ticker_Symbol_c
	{
		target = "sfAccountSubscriptionInvestorWLCTickerSymbolC",
		sources = {
			{ ns = "master", field = "tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Tax_Country_Jurisdiction_c
	{
		target = "sfAccountSubscriptionInvestorTaxCountryJurisdictionC",
		sources = {
			{ ns = "master", field = "asaJurisdictionoftaxresidencyGeneralinfo" },
			{ ns = "feeder", field = "asaJurisdictionoftaxresidencyGeneralinfo" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Joint_Account_Name_c
	{
		target = "sfAccountSubscriptionInvestorJointAccountNameC",
		sources = {
			{ ns = "master", field = "jointaccountholdersnamesPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "jointaccountholdersnamesPart1Duediligencequestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Date_Of_Birth_c
	{
		target = "sfAccountSubscriptionInvestorDateOfBirthC",
		sources = {
			{ ns = "master", field = "asaDateofbirthIndividualAmlquestionnaire" },
			{ ns = "feeder", field = "asaDateofbirthIndividualAmlquestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Country_of_Birth_c
	{
		target = "sfAccountSubscriptionInvestorCountryOfBirthC",
		sources = {
			{ ns = "master", field = "asaPlaceofbirthIndividualAmlquestionnaire" },
			{ ns = "feeder", field = "asaPlaceofbirthIndividualAmlquestionnaire" },
		},
	},
	-- // textbox: sf_Account_SubscriptionInvestor_Citizenship_Country_c
	{
		target = "sfAccountSubscriptionInvestorCitizenshipCountryC",
		sources = {
			{ ns = "master", field = "asaNationalityIndividualAmlquestionnaire" },
			{ ns = "feeder", field = "asaNationalityIndividualAmlquestionnaire" },
		},
	},
	-- // textbox with parent: sf_Account_SubscriptionInvestor_Bank_Name_c
	{
		target = "sfAccountSubscriptionInvestorBankNameC",
		sources = {
			{ ns = "master", field = "asaBanknameWireinstructionstoWireinfo", parent = "wireInstructions" },
			{ ns = "feeder", field = "asaBanknameWireinstructionstoWireinfo", parent = "wireInstructions" },
		},
	},
	-- // textbox with parent: sf_Account_SubscriptionInvestor_Bank_Location_c
	{
		target = "sfAccountSubscriptionInvestorBankLocationC",
		sources = {
			{ ns = "master", field = "asaBanklocationWireinstructionstoWireinfo", parent = "wireInstructions" },
			{ ns = "feeder", field = "asaBanklocationWireinstructionstoWireinfo", parent = "wireInstructions" },
		},
	},
	-- // textbox with parent: sf_Agreement_null_Commitment_c
	{
		target = "sfAgreementNullCommitmentC",
		sources = {
			{ ns = "master", field = "asaCommitmentAmount", parent = "lpSignatory" },
			{ ns = "feeder", field = "asaCommitmentAmount", parent = "lpSignatory" },
		},
	},
	-- // subdoc address: sf_Account_SubscriptionInvestor_BillingStreet
	{
		target = "sfAccountSubscriptionInvestorBillingStreet",
		sources = {
			{ ns = "master", field = "asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "master", field = "asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
			{ ns = "feeder", field = "asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "feeder", field = "asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
		},
	},
	-- // subdoc address: sf_Account_SubscriptionInvestor_BillingCity
	{
		target = "sfAccountSubscriptionInvestorBillingCity",
		sources = {
			{ ns = "master", field = "asaCityCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "master", field = "asaCityCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
			{ ns = "feeder", field = "asaCityCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "feeder", field = "asaCityCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
		},
	},
	-- // subdoc address: sf_Account_SubscriptionInvestor_BillingState
	{
		target = "sfAccountSubscriptionInvestorBillingState",
		sources = {
			{ ns = "master", field = "asaStateCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "master", field = "asaStateCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
			{ ns = "feeder", field = "asaStateCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "feeder", field = "asaStateCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
		},
	},
	-- // subdoc address: sf_Account_SubscriptionInvestor_BillingPostalCode
	{
		target = "sfAccountSubscriptionInvestorBillingPostalCode",
		sources = {
			{ ns = "master", field = "asaZipCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "master", field = "asaZipCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
			{ ns = "feeder", field = "asaZipCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "feeder", field = "asaZipCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
		},
	},
	-- // subdoc address: sf_Account_SubscriptionInvestor_BillingCountry
	{
		target = "sfAccountSubscriptionInvestorBillingCountry",
		sources = {
			{ ns = "master", field = "asaCountryCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "master", field = "asaCountryCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
			{ ns = "feeder", field = "asaCountryCurrentresidentialaddressIndividualAmlquestionnaire", parent = "residentialaddressIndividual" },
			{ ns = "feeder", field = "asaCountryCurrentbusinessaddressEntityAmlquestionnaire", parent = "placeofbusinessEntity" },
		},
	},
}

-- Non-W9 radioGroup rules (always applied)
local radioGroupRules: { RadioGroupRule } = {
	-- // radioGroup: sf_Account_SubscriptionInvestor_WLC_Publicly_Listed_On_A_Stock_Exchange_c
	{
		target = "sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC",
		sources = {
			{ ns = "master", field = "luxsentityRegulatedstatusPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "luxsentityRegulatedstatusPart2Duediligencequestionnaire" },
		},
		optionMap = {
			["yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "true",
			["no_luxsentity_regulatedstatus_part2_duediligencequestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_null_WLC_International_Supplements_c
	{
		target = "sfAgreementNullWLCInternationalSupplementsC",
		sources = {
			{ ns = "master", field = "indiInternationalsupplementsPart1Duediligencequestionnaire" },
			{ ns = "master", field = "entityInternationalsupplementsPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "indiInternationalsupplementsPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "entityInternationalsupplementsPart1Duediligencequestionnaire" },
		},
		optionMap = {
			["eea_indi_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
			["eea_entity_internationalsupplements_part1_duediligencequestionnaire"] = "European Economic Area - Supplement",
			["uk_indi_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
			["uk_entity_internationalsupplements_part1_duediligencequestionnaire"] = "United Kingdom - Supplement",
			["swiss_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
			["swiss_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Swiss - Supplement",
			["canada_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
			["canada_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Canadian - Supplement",
			["japan_indi_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
			["japan_entity_internationalsupplements_part1_duediligencequestionnaire"] = "Japanese - Supplement",
			["none_indi_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
			["none_entity_internationalsupplements_part1_duediligencequestionnaire"] = "No Supplement",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Nominee_Intermediary_c
	{
		target = "sfAccountSubscriptionInvestorNomineeIntermediaryC",
		sources = {
			{ ns = "master", field = "nomineePart1Duediligencequestionnaire" },
			{ ns = "master", field = "nomineePart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "nomineePart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "nomineePart2Duediligencequestionnaire" },
		},
		optionMap = {
			["yes_nominee_part1_duediligencequestionnaire"] = "Yes",
			["yes_nominee_part2_duediligencequestionnaire"] = "Yes",
			["no_nominee_part1_duediligencequestionnaire"] = "No",
			["no_nominee_part2_duediligencequestionnaire"] = "No",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_WLC_Subscribing_as_a_Representative_c
	{
		target = "sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC",
		sources = {
			{ ns = "master", field = "categoryNomineePart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "categoryNomineePart1Duediligencequestionnaire" },
		},
		optionMap = {
			["nominee_category_nominee_part1_duediligencequestionnaire"] = "Nominee",
			["trustee_category_nominee_part1_duediligencequestionnaire"] = "Trustee",
			["custodian_category_nominee_part1_duediligencequestionnaire"] = "Custodian",
			["other_category_nominee_part1_duediligencequestionnaire"] = "Other representative for another investor",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Politically_Exposed_Person_PEP_c
	{
		target = "sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC",
		sources = {
			{ ns = "master", field = "asaPoliticallyexposedpersonsAmlquestionnaire" },
			{ ns = "feeder", field = "asaPoliticallyexposedpersonsAmlquestionnaire" },
		},
		optionMap = {
			["asa_yes_politicallyexposedpersons_amlquestionnaire"] = "true",
			["asa_no_politicallyexposedpersons_amlquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Legal_Status_c
	{
		target = "sfAccountSubscriptionInvestorLegalStatusC",
		sources = {
			{ ns = "master", field = "legalformofentityPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "legalformofentityPart2Duediligencequestionnaire" },
		},
		optionMap = {
			["corporation_legalformofentity_part2_duediligencequestionnaire"] = "Corporation",
			["partnership_legalformofentity_part2_duediligencequestionnaire"] = "Partnership",
			["ltdcompany_legalformofentity_part2_duediligencequestionnaire"] = "Limited Liability Company",
			["irrevocabletrust_legalformofentity_part2_duediligencequestionnaire"] = "Irrevocable Trust",
			["revocabletrust_legalformofentity_part2_duediligencequestionnaire"] = "Revocable Trust",
			["foundation_legalformofentity_part2_duediligencequestionnaire"] = "Foundation",
			["endowment_legalformofentity_part2_duediligencequestionnaire"] = "Endowment",
			["govpensinoplan_legalformofentity_part2_duediligencequestionnaire"] = "Government Pension Plan",
			["ira_legalformofentity_part2_duediligencequestionnaire"] = "Individual Retirement Account",
			["other_legalformofentity_part2_duediligencequestionnaire"] = "Other",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_AML_Investor_Type_c
	{
		target = "sfAccountSubscriptionInvestorAMLInvestorTypeC",
		sources = {
			{ ns = "master", field = "asaFormpfFormpf" },
			{ ns = "feeder", field = "asaFormpfFormpf" },
		},
		optionMap = {
			["asa_usindividualortrust_formpf"] = "Individual/Trust – US",
			["asa_nonusindividualortrust_formpf"] = "Individual/Trust - Non US",
			["usbrokerordealer_formpf_part2_duediligencequestionnaire"] = "Broker Dealer – US",
			["nonusbrokerdealer_formpf_part2_duediligencequestionnaire"] = "Broker Dealer - Non US",
			["usinsurancecompanies_formpf_part2_duediligencequestionnaire"] = "Insurance Company – US",
			["nonusinsurancecompanies_formpf_part2_duediligencequestionnaire"] = "Insurance Company - Non US",
			["asa_investmentcompany_formpf"] = "Investment Company - SEC Registered",
			["issuer_formpf_part2_duediligencequestionnaire"] = "Private Fund - 3c1 or 3c7",
			["usnonprofit_formpf_part2_duediligencequestionnaire"] = "Non Profit – US",
			["nonusnonprofit_formpf_part2_duediligencequestionnaire"] = "Non Profit - Non US",
			["uspensionplan_formpf_part2_duediligencequestionnaire"] = "Pension Plan - US (ex gov)",
			["nonuspensionplan_formpf_part2_duediligencequestionnaire"] = "Pension Plan - Non US (ex gov)",
			["usbanking_formpf_part2_duediligencequestionnaire"] = "Bank or Thrift - US",
			["nonusbanking_formpf_part2_duediligencequestionnaire"] = "Bank or Thrift - Non US",
			["asa_stateormunicipalgovernmententity_formpf"] = "Government Entity - US (ex pension)",
			["asa_governmentalpensionplan_formpf"] = "Pension Plan - US State or Municipal Government",
			["asa_sovereignwealthfundorforeigninstitution_formpf"] = "Sovereign Wealth Fund - Non US (ex pension)",
			["asa_nonusentities_formpf"] = "Subscriber - Non US Unknown Ownership",
			["asa_other_formpf"] = "Other",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Regulated_Entity_c
	{
		target = "sfAccountSubscriptionInvestorRegulatedEntityC",
		sources = {
			{ ns = "master", field = "financialinstitutionRegulatedstatusPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "financialinstitutionRegulatedstatusPart2Duediligencequestionnaire" },
		},
		optionMap = {
			["yes_financialinstitution_regulatedstatus_part2_duediligencequestionnaireregulatedstatus_part2_duediligencequestionnaire"] = "true",
			["no_financialinstitution_regulatedstatus_part2_duediligencequestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Qualified_Purchaser_c
	{
		target = "sfAccountSubscriptionInvestorQualifiedPurchaserC",
		sources = {
			{ ns = "master", field = "qualifiedpurchaserIndividualsInvestorquestionnaire" },
			{ ns = "feeder", field = "qualifiedpurchaserIndividualsInvestorquestionnaire" },
		},
		optionMap = {
			["yes_qualifiedpurchaser_individuals_investorquestionnaire"] = "Yes",
			["no_qualifiedpurchaser_individuals_investorquestionnaire"] = "No",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Qualified_Client_Status_c
	{
		target = "sfAccountSubscriptionInvestorQualifiedClientStatusC",
		sources = {
			{ ns = "master", field = "notinvest1100IndividualsInvestorquestionnaire" },
			{ ns = "master", field = "qualifiedclientEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "notinvest1100IndividualsInvestorquestionnaire" },
			{ ns = "feeder", field = "qualifiedclientEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_notinvest1100_individuals_investorquestionnaire"] = "Yes",
			["no_notinvest1100_individuals_investorquestionnaire"] = "No",
			["yes_qualifiedclient_entity_investorquestionnaire"] = "Yes",
			["no_qualifiedclient_entity_investorquestionnaire"] = "No",
		},
	},
	-- // radioGroup: sf_Agreement_null_Receive_Unapplied_Balance_Reduction_Amt_c
	{
		target = "sfAgreementNullReceiveUnappliedBalanceReductionAmtC",
		sources = {
			{ ns = "master", field = "electingfeepartnerIndividualsInvestorquestionnaire" },
			{ ns = "master", field = "electingfeepartnerEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "electingfeepartnerIndividualsInvestorquestionnaire" },
			{ ns = "feeder", field = "electingfeepartnerEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_electingfeepartner_individuals_investorquestionnaire"] = "true",
			["yes_electingfeepartner_entity_investorquestionnaire"] = "true",
			["no_electingfeepartner_individuals_investorquestionnaire"] = "false",
			["no_electingfeepartner_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Is_Indiv_Retirement_Benefit_Plan_c
	{
		target = "sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC",
		sources = {
			{ ns = "master", field = "voluntaryEmployeebenefitplanEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "voluntaryEmployeebenefitplanEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_voluntary_employeebenefitplan_entity_investorquestionnaire"] = "true",
			["no_voluntary_employeebenefitplan_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Is_US_Tax_Exempt_c
	{
		target = "sfAccountSubscriptionInvestorIsUSTaxExemptC",
		sources = {
			{ ns = "master", field = "exemptTaxmatterEntityInvestorquestionnaire" },
			{ ns = "master", field = "s511TaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "exemptTaxmatterEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "s511TaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_taxstatus_taxmatter_entity_investorquestionnaire"] = "true",
			["yes_s511_taxexempt_entity_investorquestionnaire"] = "true",
			["no_taxstatus_taxmatter_entity_investorquestionnaire"] = "false",
			["no_s511_taxexempt_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Exempt_from_State_and_Local_Income_Tax_c
	{
		target = "sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC",
		sources = {
			{ ns = "master", field = "entitledTaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "entitledTaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_entitled_taxexempt_entity_investorquestionnaire"] = "true",
			["no_entitled_taxexempt_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Tax_Exempt_Subtype_c
	{
		target = "sfAccountSubscriptionInvestorTaxExemptSubtypeC",
		sources = {
			{ ns = "master", field = "subtypeEntitledTaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "subtypeEntitledTaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["trust_subtype_entitled_taxexempt_entity_investorquestionnaire"] = "Exempt Organization - Trust",
			["corporation_subtype_entitled_taxexempt_entity_investorquestionnaire"] = "Exempt Organization - Corporation",
			["super_subtype_entitled_taxexempt_entity_investorquestionnaire"] = "Exempt Organization - Super Tax Exempt (I.R.C. section 115)",
			["insurancecompany_subtype_entitled_taxexempt_entity_investorquestionnaire"] = "Exempt Organization - Insurance Company",
		},
	},
	-- // radioGroup: sf_Agreement_null_ECI_c
	{
		target = "sfAgreementNullECIC",
		sources = {
			{ ns = "master", field = "electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire" },
		},
		optionMap = {
			["direct_electeciinvestments_nonustaxstatus_entity_investorquestionnaire"] = "Direct",
			["blocked_electeciinvestments_nonustaxstatus_entity_investorquestionnaire"] = "Blocked",
		},
	},
	-- // radioGroup: sf_Agreement_null_USRPHC_c
	{
		target = "sfAgreementNullUSRPHCC",
		sources = {
			{ ns = "master", field = "electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire" },
		},
		optionMap = {
			["direct_electusrphcinvestments_nonustaxstatus_entity_investorquestionnaire"] = "Direct",
			["blocked_electusrphcinvestments_nonustaxstatus_entity_investorquestionnaire"] = "Blocked",
		},
	},
	-- // radioGroup: sf_Agreement_Onboarding_SI_Investing_assets_of_any_retirement_pl_c
	{
		target = "sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC",
		sources = {
			{ ns = "master", field = "planassetsErisaEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "planassetsErisaEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_planassets_erisa_entity_investorquestionnaire"] = "true",
			["no_planassets_erisa_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_Onboarding_Is_Investor_Controlling_c
	{
		target = "sfAgreementOnboardingIsInvestorControllingC",
		sources = {
			{ ns = "master", field = "controllinginfluenceCheckyesornoEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "controllinginfluenceCheckyesornoEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_controllinginfluence_checkyesorno_entity_investorquestionnaire"] = "true",
			["no_controllinginfluence_checkyesorno_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_Onboarding_Is_ERISA_FOIA_c
	{
		target = "sfAgreementOnboardingIsERISAFOIAC",
		sources = {
			{ ns = "master", field = "publicaccesslawmattersEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "publicaccesslawmattersEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_publicaccesslawmatters_entity_investorquestionnaire"] = "true",
			["no_publicaccesslawmatters_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Is_BHC_c
	{
		target = "sfAccountSubscriptionInvestorIsBHCC",
		sources = {
			{ ns = "master", field = "asaBhcSpecialentities" },
			{ ns = "feeder", field = "asaBhcSpecialentities" },
		},
		optionMap = {
			["asa_yes_bhc_specialentities"] = "true",
			["asa_no_bhc_specialentities"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Eligible_Introducer_Letter_Certificate_c
	{
		target = "sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC",
		sources = {
			{ ns = "master", field = "beenrefferedThirdpartyreferralsEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "beenrefferedThirdpartyreferralsEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_beenreffered_thirdpartyreferrals_entity_investorquestionnaire"] = "true",
			["no_beenreffered_thirdpartyreferrals_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_null_UBTI_c
	{
		target = "sfAgreementNullUBTIC",
		sources = {
			{ ns = "master", field = "blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_blocked_taxexemptlp_taxexempt_entity_investorquestionnaire"] = "Blocked",
			["no_blocked_taxexemptlp_taxexempt_entity_investorquestionnaire"] = "Direct",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Is_Section_115_Entity
	{
		target = "sfAccountSubscriptionInvestorIsSection115Entity",
		sources = {
			{ ns = "master", field = "onwerexemptS511TaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "onwerexemptS511TaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_onwerexempt_s511_taxexempt_entity_investorquestionnaire"] = "true",
			["no_onwerexempt_s511_taxexempt_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Owner_Is_US_Tax_Exempt
	{
		target = "sfAccountSubscriptionInvestorOwnerIsUSTaxExempt",
		sources = {
			{ ns = "master", field = "partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_partnershiporflowthroughvehicle_taxexempt_entity_investorquestionnaire"] = "true",
			["no_partnershiporflowthroughvehicle_taxexempt_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Account_SubscriptionInvestor_Treated_as_Tax_Exempt_LP
	{
		target = "sfAccountSubscriptionInvestorTreatedAsTaxExemptLP",
		sources = {
			{ ns = "master", field = "taxexemptlpTaxexemptEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "taxexemptlpTaxexemptEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_taxexemptlp_taxexempt_entity_investorquestionnaire"] = "true",
			["no_taxexemptlp_taxexempt_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_null_Is_not_IRC_US_Person
	{
		target = "sfAgreementNullIsNotIRCUSPerson",
		sources = {
			{ ns = "master", field = "nonusNonustaxstatusEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "nonusNonustaxstatusEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_nonus_nonustaxstatus_entity_investorquestionnaire"] = "true",
			["no_nonus_nonustaxstatus_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_null_Owner_Is_not_IRC_US_Person
	{
		target = "sfAgreementNullOwnerIsNotIRCUSPerson",
		sources = {
			{ ns = "master", field = "partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_partnershiporflowthrough_nonustaxstatus_entity_investorquestionnaire"] = "true",
			["no_partnershiporflowthrough_nonustaxstatus_entity_investorquestionnaire"] = "false",
		},
	},
	-- // radioGroup: sf_Agreement_null_Treated_as_NonUS_LP
	{
		target = "sfAgreementNullTreatedAsNonUSLP",
		sources = {
			{ ns = "master", field = "nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire" },
			{ ns = "feeder", field = "nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire" },
		},
		optionMap = {
			["yes_nonuslimitedpartner_nonustaxstatus_entity_investorquestionnaire"] = "true",
			["no_nonuslimitedpartner_nonustaxstatus_entity_investorquestionnaire"] = "false",
		},
	},
}

-- checkboxGroup rules (standard multi-select with option mapping)
local checkboxGroupRules: { RadioGroupRule } = {
	-- // checkboxGroup: sf_Account_SubscriptionInvestor_Source_of_Wealth_Category_c
	{
		target = "sfAccountSubscriptionInvestorSourceOfWealthCategoryC",
		sources = {
			{ ns = "master", field = "sourceofwealthPart1Duediligencequestionnaire" },
			{ ns = "master", field = "sourceoffundsPart2Duediligencequestionnaire" },
			{ ns = "feeder", field = "sourceofwealthPart1Duediligencequestionnaire" },
			{ ns = "feeder", field = "sourceoffundsPart2Duediligencequestionnaire" },
		},
		optionMap = {
			["businessprofit_sourceofwealth_part1_duediligencequestionnaire"] = "Business profits or dividends",
			["businessprofits_sourceoffunds_part2_duediligencequestionnaire"] = "Business profits or dividends",
			["compensation_sourceofwealth_part1_duediligencequestionnaire"] = "Compensation, payment",
			["compensation_sourceoffunds_part2_duediligencequestionnaire"] = "Compensation, payment",
			["gift_sourceofwealth_part1_duediligencequestionnaire"] = "Gift",
			["gift_sourceoffunds_part2_duediligencequestionnaire"] = "Gift",
			["income_sourceofwealth_part1_duediligencequestionnaire"] = "Income from  employment",
			["income_sourceoffunds_part2_duediligencequestionnaire"] = "Income from  employment",
			["inheritance_sourceofwealth_part1_duediligencequestionnaire"] = "Inheritance",
			["inheritance_sourceoffunds_part2_duediligencequestionnaire"] = "Inheritance",
			["investments_sourceofwealth_part1_duediligencequestionnaire"] = "Investments",
			["investments_sourceoffunds_part2_duediligencequestionnaire"] = "Investments",
			["liquidation_sourceofwealth_part1_duediligencequestionnaire"] = "Liquidation of investment portfolio",
			["liquidation_sourceoffunds_part2_duediligencequestionnaire"] = "Liquidation of investment portfolio",
			["lottery_sourceofwealth_part1_duediligencequestionnaire"] = "Lottery/betting/casino winnings",
			["lottery_sourceoffunds_part2_duediligencequestionnaire"] = "Lottery/betting/casino winnings",
			["royalties_sourceofwealth_part1_duediligencequestionnaire"] = "Royalties",
			["royalties_sourceoffunds_part2_duediligencequestionnaire"] = "Royalties",
			["saleofbusiness_sourceofwealth_part1_duediligencequestionnaire"] = "Sale of business or partnership",
			["saleofbusiness_sourceoffunds_part2_duediligencequestionnaire"] = "Sale of business or partnership",
			["saleofproperty_sourceofwealth_part1_duediligencequestionnaire"] = "Sale of property",
			["saleofproperty_sourceoffunds_part2_duediligencequestionnaire"] = "Sale of property",
			["saleofshare_sourceofwealth_part1_duediligencequestionnaire"] = "Sales of shares or other investments",
			["salesofshare_sourceoffunds_part2_duediligencequestionnaire"] = "Sales of shares or other investments",
			["savings_sourceofwealth_part1_duediligencequestionnaire"] = "Savings",
			["savings_sourceoffunds_part2_duediligencequestionnaire"] = "Savings",
		},
	},
	-- // checkboxGroup: sf_Account_SubscriptionInvestor_Accredited_Investor_Status_Individual_c
	{
		target = "sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC",
		sources = {
			{ ns = "master", field = "asaAccreditedinvestorAccreditedinvestor" },
			{ ns = "feeder", field = "asaAccreditedinvestorAccreditedinvestor" },
		},
		optionMap = {
			["asa_yes_earn200k_naturalperson_accreditedinvestor"] = "Individual - Income",
			["asa_yes_worth1m_naturalperson_accreditedinvestor"] = "Individual - Net Worth",
			["asa_yes_procertification_naturalperson_accreditedinvestor"] = "Individual - Holds SEC Designated Licenses",
			["asa_yes_knowledgeableemployee_naturalperson_accreditedinvestor"] = "Individual - Knowledgeable Employee (3c5 Rule)",
			["familyclientorfamilyoffice_naturalperson_accreditedinvestor"] = "Individual - Family Client of Qualified Family Office",
		},
	},
	-- // checkboxGroup: sf_Account_SubscriptionInvestor_Accredited_Investor_Status_Entities_c
	{
		target = "sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC",
		sources = {
			{ ns = "master", field = "asaAccreditedinvestorAccreditedinvestor1" },
			{ ns = "feeder", field = "asaAccreditedinvestorAccreditedinvestor1" },
		},
		optionMap = {
			["asa_yes_specificown5m_otherentity_accreditedinvestor"] = "Corp/Org/LLC - Assets > $5M",
			["asa_yes_allequityholder_otherentity_accreditedinvestor"] = "Corp/Org/LLC - All Equity Owners Accredited",
			["asa_yes_trust_accreditedinvestor"] = "Trust - Assets > $5M Directed by Sophisticated Person",
			["trustbank_accreditedinvestor_entity_investorquestionnaire"] = "Trust - Bank or Institution Trustee",
			["asa_yes_revocabletrust_accreditedinvestor"] = "Revocable Trust - All Grantors Accredited",
			["asa_yes_erisaplan_accreditedinvestor"] = "ERISA Plan - Fiduciary Managed by Bank/Advisor",
			["excess5mplan_accreditedinvestor_entity_investorquestionnaire"] = "ERISA Plan - Assets > $5M",
			["asa_yes_plan_accreditedinvestor"] = "Gov't ERISA Plan - State or Municipal",
			["selfdirectedplan_accreditedinvestor_entity_investorquestionnaire"] = "Self-Directed ERISA Plan - All Participants Accredited",
			["asa_yes_bank_accreditedinvestor"] = "Bank or Savings Institution (Sec 3(a)(2) / 3(a)(5))",
			["asa_yes_insurancecompany_accreditedinvestor"] = "Insurance Company - Securities Act Section 2(13)",
			["investmentcompany_accreditedinvestor_entity_investorquestionnaire"] = "Investment Company - SEC Registered",
			["asa_yes_sec2a48company_accreditedinvestor"] = "Business Development Company - SEC Defined",
			["asa_yes_smallbusinessinvestmentcompany_accreditedinvestor"] = "Small Business Investment Company (SBA 301)",
			["asa_yes_rbic_accreditedinvestor"] = "Rural Business Investment Company (USDA 384A)",
			["asa_yes_broker_accreditedinvestor"] = "Broker-Dealer - Registered under Exchange Act Sec 15",
			["asa_yes_regsec203_investmentadviser_accreditedinvestor"] = "Investment Adviser - Registered under SEC/State Law",
			["asa_yes_exemptsec203_investmentadviser_accreditedinvestor"] = "Investment Adviser - Exempt under SEC 203(l)/(m)",
			["asa_yes_otherown5m_otherentity_accreditedinvestor"] = "Other Entity - Owns Investments > $5M",
			["asa_yes_familyoffice_accreditedinvestor"] = "Family Office - AUM > $5M Directed by Qualified Person",
			["asa_yes_familyclient_accreditedinvestor"] = "Family Client - Directed by Qualified Family Office",
			["none_accreditedinvestor_entity_investorquestionnaire"] = "None of the Above Categories",
		},
	},
}

-- checkboxBoolean rules (any match -> true, else false)
local checkboxBooleanRules: { CheckboxBooleanRule } = {
	-- // checkboxGroup: sf_Agreement_Onboarding_Is_ERISA_Title_I_c
	{
		target = "sfAgreementOnboardingIsERISATitleIC",
		sources = {
			{ ns = "master", field = "asaErisaErisa" },
			{ ns = "feeder", field = "asaErisaErisa" },
		},
		trueKeys = { "asa_employeebenefitplan_erisa", "asa_plandescribedunder4975_erisa" },
	},
	-- // checkboxGroup: sf_Account_SubscriptionInvestor_Does_the_Entity_Have_Controlling_Persons_c
	{
		target = "sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC",
		sources = {
			{ ns = "master", field = "skipFinraIndividualsInvestorquestionnaire" },
			{ ns = "feeder", field = "skipFinraIndividualsInvestorquestionnaire" },
		},
		trueKeys = { "yes_skip_finra_individuals_investorquestionnaire" },
	},
	-- // checkboxGroup: sf_Account_SubscriptionInvestor_Broker_Dealer_c
	{
		target = "sfAccountSubscriptionInvestorBrokerDealerC",
		sources = {
			{ ns = "master", field = "finraIndividualsInvestorquestionnaire" },
			{ ns = "feeder", field = "finraIndividualsInvestorquestionnaire" },
		},
		trueKeys = { "brokerdealer_finra_individuals_investorquestionnaire", "brokerdealerpersonnel_finra_individuals_investorquestionnaire" },
	},
}

-- Name split rules
local nameSplitRules: { NameSplitRule } = {
	-- // textbox split first/middle/last name: sf_Agreement_null_Signer_*
	{
		targetFirst = "sfAgreementNullSignerFirstName",
		targetMiddle = "sfAgreementNullSignerMiddleName",
		targetLast = "sfAgreementNullSignerLastName",
		sources = {
			{ ns = "master", field = "individualSubscribernameSignaturepage", parent = "lpSignatory" },
			{ ns = "master", field = "entityAuthorizednameSignaturepage", parent = "lpSignatory" },
			{ ns = "feeder", field = "individualSubscribernameSignaturepage", parent = "lpSignatory" },
			{ ns = "feeder", field = "entityAuthorizednameSignaturepage", parent = "lpSignatory" },
		},
	},
	-- // textbox split first/middle/last name: sf_Account_SubscriptionInvestor_Signer_*
	{
		targetFirst = "sfAccountSubscriptionInvestorSignerFirstName",
		targetMiddle = "sfAccountSubscriptionInvestorSignerMiddleName",
		targetLast = "sfAccountSubscriptionInvestorSignerLastName",
		sources = {
			{ ns = "master", field = "signernamePart1Duediligencequestionnaire", parent = "clientquestionnairePart1Signatory" },
			{ ns = "master", field = "signernamePart2Duediligencequestionnaire", parent = "clientquestionnairePart2Signatory" },
			{ ns = "feeder", field = "signernamePart1Duediligencequestionnaire", parent = "clientquestionnairePart1Signatory" },
			{ ns = "feeder", field = "signernamePart2Duediligencequestionnaire", parent = "clientquestionnairePart2Signatory" },
		},
	},
	-- // textbox split first/middle/last name: sf_Agreement_Onboarding_Signer_*
	{
		targetFirst = "sfAgreementOnboardingSignerFirstName",
		targetMiddle = "sfAgreementOnboardingSignerMiddleName",
		targetLast = "sfAgreementOnboardingSignerLastName",
		sources = {
			{ ns = "master", field = "nameAuthorizedsignatoryConsentstatement" },
		},
	},
}

-- W9 rules: direct (no disregarded entity), TAO (with disregarded entity), always
local w9DirectTextboxRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9TaxAccountOwner", w9Field = "w9Line1" },
	{ target = "sfTaxFormW9ExemptPayeeCodeC", w9Field = "w9Line4Exemptpayee" },
	{ target = "sfTaxFormW9ExemptionFromFATCAReportingCodeC", w9Field = "w9Line4Exemptfatca" },
	{ target = "sfTaxFormW9BillingStreet", w9Field = "w9Line5" },
	{ target = "sfTaxFormW9BillingCity", w9Field = "w9CityLine6" },
	{ target = "sfTaxFormW9BillingState", w9Field = "w9StateLine6" },
	{ target = "sfTaxFormW9BillingPostalCode", w9Field = "w9ZipLine6" },
	{ target = "sfTaxFormW9BillingCountry", w9Field = "w9CountryLine6" },
}

local w9TaoTextboxRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9TAOTaxAccountOwner", w9Field = "w9Line1" },
	{ target = "sfTaxFormW9TAOExemptPayeeCodeC", w9Field = "w9Line4Exemptpayee" },
	{ target = "sfTaxFormW9TAOExemptionFromFATCAReportingCodeC", w9Field = "w9Line4Exemptfatca" },
	{ target = "sfTaxFormW9TAOBillingStreetC", w9Field = "w9Line5" },
	{ target = "sfTaxFormW9TAOBillingCityC", w9Field = "w9CityLine6" },
	{ target = "sfTaxFormW9TAOBillingStateC", w9Field = "w9StateLine6" },
	{ target = "sfTaxFormW9TAOBillingPostalCodeC", w9Field = "w9ZipLine6" },
	{ target = "sfTaxFormW9TAOBillingCountryC", w9Field = "w9CountryLine6" },
}

local w9AlwaysTextboxRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9DisregardedEntityName", w9Field = "w9Line2" },
	{ target = "sfTaxFormW9TaxEntityTypeC", w9Field = "w9Line31OtherSpecify" },
}

--------------------------------------------------------------------------------
-- W9 special-case helpers
--------------------------------------------------------------------------------

-- Tax Status: maps w9_line3_1 selectedKeys to status string, with LLC sub-map
local w9TaxStatusMap: { [string]: string } = {
	["w9_line3_1_individual"] = "Individual",
	["w9_line3_1_Ccorp"] = "C Corporation",
	["w9_line3_1_SCorp"] = "S Corporation",
	["w9_line3_1_Partnership"] = "Partnership",
	["w9_line3_1_Trust"] = "Trust/Estate",
	["w9_line3_1_other"] = "Other",
	["w9_line3_1_llc"] = "LLC",
}

local w9LlcMap: { [string]: string } = {
	["C"] = "LLC - C Corporation",
	["S"] = "LLC - S Corporation",
	["P"] = "LLC- Partnership",
	[""] = "LLC- Unclassified",
}

local function resolveW9TaxStatus(w9: SourceW9Table.SourceW9TableFieldsMap): { string }?
	local line31 = w9.w9Line31
	if line31 == nil then
		return nil
	end
	local keys = line31.selectedKeys
	if keys == nil or #keys == 0 then
		return nil
	end
	-- Use first matching key
	for _, k in keys do
		local mapped = w9TaxStatusMap[k]
		if mapped ~= nil then
			if mapped == "LLC" then
				-- Resolve LLC subtype
				local llcClass = ""
				if w9.w9Line31LLCclass ~= nil then
					local v = w9.w9Line31LLCclass.value
					if v ~= nil and v ~= "" then
						llcClass = string.upper(v)
					end
				end
				local llcMapped = w9LlcMap[llcClass]
				if llcMapped ~= nil then
					return { llcMapped }
				end
				return nil
			else
				return { mapped }
			end
		end
	end
	return nil
end

-- TIN Type: SSN if w9_parti_ssn1 has value, EIN if w9_parti_ein1 has value
local function resolveW9TINType(w9: SourceW9Table.SourceW9TableFieldsMap): { string }?
	if w9.w9PartiSsn1 ~= nil then
		local v = w9.w9PartiSsn1.value
		if v ~= nil and v ~= "" then
			return { "SSN" }
		end
	end
	if w9.w9PartiEin1 ~= nil then
		local v = w9.w9PartiEin1.value
		if v ~= nil and v ~= "" then
			return { "EIN" }
		end
	end
	return nil
end

-- FM Tax Id: concatenation of SSN and EIN fields
local function resolveW9FMTaxId(w9: SourceW9Table.SourceW9TableFieldsMap): string
	local parts: { string } = {}
	if w9.w9PartiSsn1 ~= nil then
		local v = w9.w9PartiSsn1.value
		if v ~= nil and v ~= "" then
			table.insert(parts, v)
		end
	end
	if w9.w9PartiEin1 ~= nil then
		local v = w9.w9PartiEin1.value
		if v ~= nil and v ~= "" then
			table.insert(parts, v)
		end
	end
	return table.concat(parts, "")
end

-- 894 Eligible: special default-to-false logic
local function resolve894Eligible(sources: { [string]: any }): DataTypes.MultipleCheckboxType
	local rule894Sources: { SourceDesc } = {
		{ ns = "master", field = "fiscallytransparentS894benefitsEntityInvestorquestionnaire" },
		{ ns = "master", field = "caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire" },
		{ ns = "feeder", field = "fiscallytransparentS894benefitsEntityInvestorquestionnaire" },
		{ ns = "feeder", field = "caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire" },
	}
	local optionMap894: { [string]: string } = {
		["yes_fiscallytransparent_s894benefits_entity_investorquestionnaire"] = "true",
		["yes_caymanfiscallytransparent_s894benefits_entity_investorquestionnaire"] = "true",
	}

	local keys = collectSelectedKeys(sources, rule894Sources)
	local mapped = mapAndDedup(keys, optionMap894)
	if #mapped == 1 then
		return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = mapped })
	end
	-- Default to false
	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = { "false" } })
end

--------------------------------------------------------------------------------
-- Array Mappers
--------------------------------------------------------------------------------

-- Index suffixes matching CUE _indices: ["", "_0", "_1", "_2", "_3"]
-- In camelCase, the underscore prefix is dropped: "", "0", "1", "2", "3"
local ARRAY_INDEX_SUFFIXES = { "", "0", "1", "2", "3" }

local function makeEmptyStringType(): DataTypes.StringType
	return DataTypes.makeStringType({ typeId = "String", value = "" })
end

local function makeEmptyMultipleCheckboxType(): DataTypes.MultipleCheckboxType
	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = {} })
end

local function makeBoolCheckbox(val: boolean): DataTypes.MultipleCheckboxType
	local sk = if val then { "true" } else { "false" }
	return DataTypes.makeMultipleCheckboxType({ typeId = "MultipleCheckbox", selectedKeys = sk })
end

--
-- mapControllingPersons: builds an array of FullTargetTableSfControllingpersonsType
-- from source master/feeder name fields with index suffixes.
--
local function mapControllingPersons(sources: { [string]: any }): { any }
	local namespaces = { "master", "feeder" }
	local result: { any } = {}

	for _, suffix in ARRAY_INDEX_SUFFIXES do
		local sourceFieldName = "nameControlpersonPart2Duediligencequestionnaire" .. suffix
		-- Collect the full name from the first namespace that has it
		local fullName = ""
		for _, ns in namespaces do
			local nsTable = sources[ns]
			if nsTable ~= nil then
				local raw = getField(nsTable, sourceFieldName)
				if raw ~= nil then
					local v = (raw :: { [string]: any }).value
					if v ~= nil and v ~= "" then
						fullName = fullName .. (v :: string)
					end
				end
			end
		end

		local names = CarlyleMappings.splitName(fullName)

		-- Build the sub-fields dict: all 45 fields of FullTargetTableSfControllingpersonsFields
		-- Only 3 are mapped (firstName, middleName, lastName), rest are empty defaults
		local subFields: { [string]: any } = {
			-- Mapped fields
			sfControllingPersonsNullFirstNameC = DataTypes.makeStringType({ typeId = "String", value = names.firstName }),
			sfControllingPersonsNullMiddleNameC = DataTypes.makeStringType({ typeId = "String", value = names.middleName }),
			sfControllingPersonsNullLastNameC = DataTypes.makeStringType({ typeId = "String", value = names.lastName }),
			-- All StringType fields default to empty
			sfControllingPersonsNullTINUnavailableC = makeEmptyStringType(),
			sfControllingPersonsNullMailingStateC = makeEmptyStringType(),
			sfControllingPersonsNullMailingCityC = makeEmptyStringType(),
			sfControllingPersonsNullDateOfBirthC = makeEmptyStringType(),
			sfControllingPersonsNullSubscriptionInvestorC = makeEmptyStringType(),
			sfControllingPersonsNullCRSDocumentIDC = makeEmptyStringType(),
			sfControllingPersonsNullSubscriptionInvestorIDC = makeEmptyStringType(),
			sfControllingPersonsNullResidenceCountryC = makeEmptyStringType(),
			sfControllingPersonsNullTINCountryNo5C = makeEmptyStringType(),
			sfControllingPersonsNullCountryOfBirthC = makeEmptyStringType(),
			sfControllingPersonsNullEffectiveDateC = makeEmptyStringType(),
			sfControllingPersonsNullMailingAddress2C = makeEmptyStringType(),
			sfControllingPersonsNullMailingCountryC = makeEmptyStringType(),
			sfControllingPersonsNullTINNo5C = makeEmptyStringType(),
			sfControllingPersonsNullMailingPostalCodeC = makeEmptyStringType(),
			sfControllingPersonsNullTINNo1C = makeEmptyStringType(),
			sfControllingPersonsNullTINCountryNo3C = makeEmptyStringType(),
			sfControllingPersonsNullReportingCountriesC = makeEmptyStringType(),
			sfControllingPersonsNullResidencePostalCodeC = makeEmptyStringType(),
			sfControllingPersonsNullTypeC = makeEmptyStringType(),
			sfControllingPersonsNullResidenceStateC = makeEmptyStringType(),
			sfControllingPersonsNullType2C = makeEmptyStringType(),
			sfControllingPersonsNullTINNo4C = makeEmptyStringType(),
			sfControllingPersonsNullResidenceStreetC = makeEmptyStringType(),
			sfControllingPersonsNullControllingPersonPackageC = makeEmptyStringType(),
			sfControllingPersonsNullCRSReportingThresholdC = makeEmptyStringType(),
			sfControllingPersonsNullTINCountryNo4C = makeEmptyStringType(),
			sfControllingPersonsNullTINNo2C = makeEmptyStringType(),
			sfControllingPersonsNullResidenceCityC = makeEmptyStringType(),
			sfControllingPersonsNullType3C = makeEmptyStringType(),
			sfControllingPersonsNullTINNo3C = makeEmptyStringType(),
			sfControllingPersonsNullTINCountryNo1C = makeEmptyStringType(),
			sfControllingPersonsNullPlaceOfBirthC = makeEmptyStringType(),
			sfControllingPersonsNullMailingStreetC = makeEmptyStringType(),
			sfControllingPersonsNullCRSValidationResultC = makeEmptyStringType(),
			sfControllingPersonsNullTINCountryNo2C = makeEmptyStringType(),
			sfControllingPersonsNullResidenceAddress2C = makeEmptyStringType(),
			sfControllingPersonsNullCRSStatusC = makeEmptyStringType(),
			sfControllingPersonsNullName = makeEmptyStringType(),
			sfControllingPersonsNullTaxStatusC = makeEmptyStringType(),
			-- MultipleCheckboxType field
			sfControllingPersonsNullInactiveC = makeEmptyMultipleCheckboxType(),
		}

		table.insert(result, {
			typeId = "CustomCompound",
			valueSubFields = subFields,
			subFieldKeysInOrder = {},
			label = nil,
		})
	end

	return result
end

--
-- mapBeneficialOwner: builds an array of FullTargetTableSfBeneficialownerType
-- from source master/feeder fields with index suffixes.
-- Maps 12 sub-fields: 3 name, 5 address, 4 direct.
--
local function mapBeneficialOwner(sources: { [string]: any }): { any }
	local namespaces = { "master", "feeder" }
	local result: { any } = {}

	-- Address sub-field base names (without index suffix)
	local addressSubFieldBases = {
		sfBeneficialOwnerNullInvestorRegisteredStreetAddressC = "numberandstreetResidentialaddressBeneficialownerAmlquestionnaire",
		sfBeneficialOwnerNullInvestorRegisteredCityC = "cityResidentialaddressBeneficialownerAmlquestionnaire",
		sfBeneficialOwnerNullInvestorRegisteredStateProvinceC = "stateResidentialaddressBeneficialownerAmlquestionnaire",
		sfBeneficialOwnerNullInvestorRegisteredPostalCodeC = "zipResidentialaddressBeneficialownerAmlquestionnaire",
		sfBeneficialOwnerNullInvestorRegisteredCountryC = "countryResidentialaddressBeneficialownerAmlquestionnaire",
	}

	for _, suffix in ARRAY_INDEX_SUFFIXES do
		-- 1. Name fields: split full name
		local nameField = "asaFullnameBeneficialownerAmlquestionnaire" .. suffix
		local fullName = ""
		for _, ns in namespaces do
			local nsTable = sources[ns]
			if nsTable ~= nil then
				local raw = getField(nsTable, nameField)
				if raw ~= nil then
					local v = (raw :: { [string]: any }).value
					if v ~= nil and v ~= "" then
						fullName = fullName .. (v :: string)
					end
				end
			end
		end
		local names = CarlyleMappings.splitName(fullName)

		-- 2. Direct mapped fields (simple value lookup)
		local directMappings = {
			{ target = "sfBeneficialOwnerNullDateOfBirthC", source = "asaDateofbirthBeneficialownerAmlquestionnaire" },
			{ target = "anduinBeneficialOwnerNullInvestorRegisteredFullAddress", source = "asaResidentialaddressBeneficialownerAmlquestionnaire" },
			{ target = "sfBeneficialOwnerNullPEPStatusC", source = "pepBeneficialownerPart2Duediligencequestionnaire" },
			{ target = "sfBeneficialOwnerNullUSTaxIDC", source = "idBeneficialownerPart2Duediligencequestionnaire" },
		}

		-- Build sub-fields dict
		local subFields: { [string]: any } = {
			-- Name split
			sfBeneficialOwnerNullFirstName = DataTypes.makeStringType({ typeId = "String", value = names.firstName }),
			sfBeneficialOwnerNullMiddleNameC = DataTypes.makeStringType({ typeId = "String", value = names.middleName }),
			sfBeneficialOwnerNullLastName = DataTypes.makeStringType({ typeId = "String", value = names.lastName }),
			-- All other StringType fields: empty defaults
			sfBeneficialOwnerNullWebsiteC = makeEmptyStringType(),
			sfBeneficialOwnerNullNonUSTaxIDCountryC = makeEmptyStringType(),
			sfBeneficialOwnerNullTCGGlobalIdC = makeEmptyStringType(),
			sfBeneficialOwnerNullLastModifiedById = makeEmptyStringType(),
			sfBeneficialOwnerNullName = makeEmptyStringType(),
			sfBeneficialOwnerNullOwnerId = makeEmptyStringType(),
			sfBeneficialOwnerNullAMLRefreshNotesC = makeEmptyStringType(),
			sfBeneficialOwnerNullGovernmentIssuedIDOnFileC = makeEmptyStringType(),
			sfBeneficialOwnerNullIndividualOrganizationC = makeEmptyStringType(),
			sfBeneficialOwnerNullCountryOfBirthC = makeEmptyStringType(),
			sfBeneficialOwnerNullPercentageOfOwnershipC = makeEmptyStringType(),
			sfBeneficialOwnerNullGovernmentIDNumberC = makeEmptyStringType(),
			sfBeneficialOwnerNullGovernmentIDCountryC = makeEmptyStringType(),
			sfBeneficialOwnerNullGovernmentIDExpirationDateC = makeEmptyStringType(),
			sfBeneficialOwnerNullNonUSTaxIDC = makeEmptyStringType(),
			sfBeneficialOwnerNullBeneficialOwnerLongNameC = makeEmptyStringType(),
			sfBeneficialOwnerNullUSTaxIDTypeC = makeEmptyStringType(),
			sfBeneficialOwnerNullLastTriggeredTimestampC = makeEmptyStringType(),
			sfBeneficialOwnerNullRiskRatingC = makeEmptyStringType(),
			sfBeneficialOwnerNullSourceOfWealthC = makeEmptyStringType(),
			sfBeneficialOwnerNullAMLNotesC = makeEmptyStringType(),
			sfBeneficialOwnerNullMaxComplyIdC = makeEmptyStringType(),
			sfBeneficialOwnerNullBeneficialCountryC = makeEmptyStringType(),
			sfBeneficialOwnerNullCreatedById = makeEmptyStringType(),
			sfBeneficialOwnerNullGovernmentIDJurisdictionStateC = makeEmptyStringType(),
			-- MultipleCheckboxType fields: empty defaults
			sfBeneficialOwnerNullAMLMonitoringC = makeEmptyMultipleCheckboxType(),
			sfBeneficialOwnerNullPoliticallyExposedPersonC = makeEmptyMultipleCheckboxType(),
			sfBeneficialOwnerNullIsActiveC = makeEmptyMultipleCheckboxType(),
			sfBeneficialOwnerNullKYCRefreshC = makeEmptyMultipleCheckboxType(),
		}

		-- Fill direct mapped fields
		for _, dm in directMappings do
			local sourceField = dm.source .. suffix
			local value = ""
			for _, ns in namespaces do
				local nsTable = sources[ns]
				if nsTable ~= nil then
					local raw = getField(nsTable, sourceField)
					if raw ~= nil then
						local v = (raw :: { [string]: any }).value
						if v ~= nil and v ~= "" then
							value = value .. (v :: string)
						end
					end
				end
			end
			subFields[dm.target] = DataTypes.makeStringType({ typeId = "String", value = value })
		end

		-- Fill address sub-fields from addressUbo compound
		local addressParent = "addressUbo" .. suffix
		for targetField, addressSubFieldBase in addressSubFieldBases do
			-- The sub-field name within the compound includes the index suffix
			local addressSubField = addressSubFieldBase .. suffix
			local value = ""
			for _, ns in namespaces do
				local nsTable = sources[ns]
				if nsTable ~= nil then
					local raw = getSubField(nsTable, addressParent, addressSubField)
					if raw ~= nil then
						local v = (raw :: { [string]: any }).value
						if v ~= nil and v ~= "" then
							value = value .. (v :: string)
						end
					end
				end
			end
			subFields[targetField] = DataTypes.makeStringType({ typeId = "String", value = value })
		end

		table.insert(result, {
			typeId = "CustomCompound",
			valueSubFields = subFields,
			subFieldKeysInOrder = {},
			label = nil,
		})
	end

	return result
end

--
-- mapContact: builds an array of FullTargetTableSfContactType
-- from the raw contact JSON data where contactInfo is an array.
--
local function mapContact(contactData: any): { any }
	if contactData == nil then
		return {}
	end

	local contactInfo = getField(contactData, "contactInfo")
	if contactInfo == nil or type(contactInfo) ~= "table" then
		return {}
	end

	-- Role key → target field mapping
	local roleMap = {
		["primarycontact_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCPrimaryContactC",
		["secondarycontact_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCSecondaryContactC",
		["taxadvisor_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCTaxAdvisorC",
		["legaladvisor_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCLegalAdvisorC",
		["financecontact_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCFinanceContactC",
		["amlkyccontact_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCAMLKYCContactC",
		["wireapprover_contactrole_part3_duediligencequestionnaire"] = "sfContactIFCWireApproverC",
	}
	local roleKeys = {
		"primarycontact_contactrole_part3_duediligencequestionnaire",
		"secondarycontact_contactrole_part3_duediligencequestionnaire",
		"taxadvisor_contactrole_part3_duediligencequestionnaire",
		"legaladvisor_contactrole_part3_duediligencequestionnaire",
		"financecontact_contactrole_part3_duediligencequestionnaire",
		"amlkyccontact_contactrole_part3_duediligencequestionnaire",
		"wireapprover_contactrole_part3_duediligencequestionnaire",
	}

	-- Notification key → target field mapping
	local notiMap = {
		["capitalcallnotices_contactnotification_part3_duediligencequestionnaire"] = "sfContactIFCCapitalCallManagementNotC",
		["distributionnotices_contactnotification_part3_duediligencequestionnaire"] = "sfContactIFCDistributionManagementNotC",
		["financialreporting_contactnotification_part3_duediligencequestionnaire"] = "sfContactIFCFinancialReportingNotC",
		["legalinfo_contactnotification_part3_duediligencequestionnaire"] = "sfContactIFCLegalInformationNotC",
		["taxinfo_contactnotification_part3_duediligencequestionnaire"] = "sfContactIFCTaxInformationNotC",
	}
	local notiKeys = {
		"capitalcallnotices_contactnotification_part3_duediligencequestionnaire",
		"distributionnotices_contactnotification_part3_duediligencequestionnaire",
		"financialreporting_contactnotification_part3_duediligencequestionnaire",
		"legalinfo_contactnotification_part3_duediligencequestionnaire",
		"taxinfo_contactnotification_part3_duediligencequestionnaire",
	}

	local result: { any } = {}

	for _, row in contactInfo :: { any } do
		if row == nil then
			continue
		end
		-- Each row has a rawValue or is the sub-field dict directly.
		-- In stripped fixtures, each row is: { rawValue: { subFieldName: { rawValue: {value/selectedKeys} } } }
		-- But we need to handle both SV-wrapped and SV-stripped formats.
		-- The CUE says: subValue = row.rawValue, then subValue.name_contact_...rawValue.value
		-- In our Luau SV-stripped format, the contact row's sub-fields are accessed like:
		-- row.valueSubFields.nameContactPart3Duediligencequestionnaire.value
		-- But the spec says contactData is raw JSON, so let's handle the raw (SV-wrapped) case:
		-- row.rawValue.name_contact_part3_duediligencequestionnaire.rawValue.value
		--
		-- We handle both: check for valueSubFields (typed) or rawValue (raw JSON CUE output)
		local subValue: { [string]: any }
		local rawVal = (row :: { [string]: any }).rawValue
		local vsf = (row :: { [string]: any }).valueSubFields
		if rawVal ~= nil and type(rawVal) == "table" then
			subValue = rawVal :: { [string]: any }
		elseif vsf ~= nil and type(vsf) == "table" then
			subValue = vsf :: { [string]: any }
		else
			-- row IS the sub-field dict
			subValue = row :: { [string]: any }
		end

		-- Helper to get a string value from a sub-field
		-- Handles both: subValue[key].rawValue.value (CUE raw) and subValue[key].value (stripped)
		local function getContactStringValue(fieldName: string): string
			local field = subValue[fieldName]
			if field == nil then return "" end
			local fMap = field :: { [string]: any }
			-- Check rawValue wrapper
			if fMap.rawValue ~= nil and type(fMap.rawValue) == "table" then
				local rv = fMap.rawValue :: { [string]: any }
				if rv.value ~= nil then
					return rv.value :: string
				end
			end
			-- Direct value
			if fMap.value ~= nil then
				return fMap.value :: string
			end
			return ""
		end

		-- Helper to get selectedKeys from a sub-field
		local function getContactSelectedKeys(fieldName: string): { string }
			local field = subValue[fieldName]
			if field == nil then return {} end
			local fMap = field :: { [string]: any }
			-- Check rawValue wrapper
			if fMap.rawValue ~= nil and type(fMap.rawValue) == "table" then
				local rv = fMap.rawValue :: { [string]: any }
				if rv.selectedKeys ~= nil then
					return rv.selectedKeys :: { string }
				end
			end
			-- Direct selectedKeys
			if fMap.selectedKeys ~= nil then
				return fMap.selectedKeys :: { string }
			end
			return {}
		end

		-- Extract name and split
		local fullName = getContactStringValue("nameContactPart3Duediligencequestionnaire")
		local nameParts = CarlyleMappings.splitName(fullName)

		-- Extract role and notification selected keys
		local selectedRoles = getContactSelectedKeys("contactrolePart3Duediligencequestionnaire")
		local selectedNotis = getContactSelectedKeys("contactnotificationPart3Duediligencequestionnaire")

		-- Build role set for quick lookup
		local roleSet: { [string]: boolean } = {}
		for _, k in selectedRoles do
			roleSet[k] = true
		end
		local notiSet: { [string]: boolean } = {}
		for _, k in selectedNotis do
			notiSet[k] = true
		end

		-- Build output sub-fields
		local subFields: { [string]: any } = {
			-- Name fields
			sfContactNullFirstName = DataTypes.makeStringType({ typeId = "String", value = nameParts.firstName }),
			sfContactNullMiddleNameC = DataTypes.makeStringType({ typeId = "String", value = nameParts.middleName }),
			sfContactNullLastName = DataTypes.makeStringType({ typeId = "String", value = nameParts.lastName }),
			sfContactNullName = DataTypes.makeStringType({ typeId = "String", value = fullName }),
			-- Address fields
			sfContactNullMailingAddress = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("addressContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullMailingStreet = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("numberandstreetAddressContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullMailingCity = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("cityAddressContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullMailingState = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("stateAddressContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullMailingPostalCode = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("zipAddressContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullMailingCountry = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("countryAddressContactPart3Duediligencequestionnaire"),
			}),
			-- Contact details
			sfContactNullOpBusinessPhoneC = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("phoneContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullFax = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("faxContactPart3Duediligencequestionnaire"),
			}),
			sfContactNullOpEmailPrimaryC = DataTypes.makeStringType({
				typeId = "String",
				value = getContactStringValue("emailContactPart3Duediligencequestionnaire"),
			}),
			-- Static empty fields
			sfContactNullAccountId = makeEmptyStringType(),
			sfContactNullSalutation = makeEmptyStringType(),
			sfContactNullTCGGlobalIdC = makeEmptyStringType(),
			sfContactNullEmailFundraising = makeEmptyStringType(),
			sfContactNullBusinessPhone = makeEmptyStringType(),
			-- Empty MultipleCheckbox fields
			sfContactIFCNotificationsNotC = makeEmptyMultipleCheckboxType(),
			sfContactIFCNotificationsC = makeEmptyMultipleCheckboxType(),
			anduinContactNotification = makeEmptyMultipleCheckboxType(),
			anduinContactRole = makeEmptyMultipleCheckboxType(),
		}

		-- Set role boolean fields
		for _, rk in roleKeys do
			local targetField = roleMap[rk]
			subFields[targetField] = makeBoolCheckbox(roleSet[rk] == true)
		end

		-- Set notification boolean fields
		for _, nk in notiKeys do
			local targetField = notiMap[nk]
			subFields[targetField] = makeBoolCheckbox(notiSet[nk] == true)
		end

		table.insert(result, {
			typeId = "CustomCompound",
			valueSubFields = subFields,
			subFieldKeysInOrder = {},
			label = nil,
		})
	end

	return result
end

--------------------------------------------------------------------------------
-- Main Transform
--------------------------------------------------------------------------------

function CarlyleMappings.transformScalars(
	feeder: SourceFeederTable.SourceFeederTableFieldsMap?,
	master: SourceMasterTable.SourceMasterTableFieldsMap?,
	w9: SourceW9Table.SourceW9TableFieldsMap?
): FullTargetTable.FullTargetTableFieldsMap
	local sources: { [string]: any } = { master = master, feeder = feeder, w9 = w9 }
	local output: { [string]: any } = {}

	-- Textbox rules
	for _, rule in textboxRules do
		local result = applyTextbox(sources, rule)
		if result ~= nil then
			output[rule.target] = result
		end
	end

	-- RadioGroup rules (produces MultipleCheckboxType)
	for _, rule in radioGroupRules do
		local result = applyRadioGroup(sources, rule)
		if result ~= nil then
			output[rule.target] = result
		end
	end

	-- CheckboxGroup rules (same logic as radioGroup but multi-select)
	for _, rule in checkboxGroupRules do
		local result = applyRadioGroup(sources, rule)
		if result ~= nil then
			output[rule.target] = result
		end
	end

	-- CheckboxBoolean rules (always produces a value)
	for _, rule in checkboxBooleanRules do
		local result = applyCheckboxBoolean(sources, rule)
		output[rule.target] = result
	end

	-- NameSplit rules
	for _, rule in nameSplitRules do
		local value = collectTextValues(sources, rule.sources)
		if value ~= "" then
			local parts = CarlyleMappings.splitName(value)
			output[rule.targetFirst] = DataTypes.makeStringType({ typeId = "String", value = parts.firstName })
			output[rule.targetMiddle] = DataTypes.makeStringType({ typeId = "String", value = parts.middleName })
			output[rule.targetLast] = DataTypes.makeStringType({ typeId = "String", value = parts.lastName })
		end
	end

	-- Special: 894 Eligible (defaults to false)
	output["sfAgreementNullWLC894EligibleC"] = resolve894Eligible(sources)

	-- Custom: Individual vs Organization detection
	local indOrg: string? = nil
	local indOrgSources: { { ns: string, indField: string, orgField: string } } = {
		{ ns = "master", indField = "asaFullnameInvestornameAmlquestionnaire", orgField = "asaFullnameInvestornameGeneralinfo1" },
		{ ns = "feeder", indField = "asaFullnameInvestornameAmlquestionnaire", orgField = "asaFullnameInvestornameGeneralinfo1" },
	}
	for _, src in indOrgSources do
		if indOrg ~= nil then
			break
		end
		local ns = sources[src.ns]
		if ns ~= nil then
			local indRaw = getField(ns, src.indField)
			if indRaw ~= nil then
				local v = (indRaw :: { [string]: any }).value
				if v ~= nil and v ~= "" then
					indOrg = "Individual"
				end
			end
			if indOrg == nil then
				local orgRaw = getField(ns, src.orgField)
				if orgRaw ~= nil then
					local v = (orgRaw :: { [string]: any }).value
					if v ~= nil and v ~= "" then
						indOrg = "Organization"
					end
				end
			end
		end
	end
	if indOrg ~= nil then
		output["sfAccountSubscriptionInvestorIndividualOrganizationC"] = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = { indOrg :: string },
		})
	end

	-- Custom: Form Type detection (w9_line1 non-empty -> "W-9")
	if w9 ~= nil then
		local w9Data = w9 :: SourceW9Table.SourceW9TableFieldsMap
		if w9Data.w9Line1 ~= nil then
			local v = w9Data.w9Line1.value
			if v ~= nil and v ~= "" then
				output["sfAccountSubscriptionInvestorFormTypeC"] = DataTypes.makeMultipleCheckboxType({
					typeId = "MultipleCheckbox",
					selectedKeys = { "W-9" },
				})
			end
		end
	end

	-- W9 conditional rules
	if w9 ~= nil then
		local w9Data = w9 :: SourceW9Table.SourceW9TableFieldsMap

		-- Determine if disregarded entity exists
		local hasDisregardedEntity = false
		if w9Data.w9Line2 ~= nil then
			local v = w9Data.w9Line2.value
			if v ~= nil and v ~= "" then
				hasDisregardedEntity = true
			end
		end

		-- Always rules
		for _, rule in w9AlwaysTextboxRules do
			local result = applyW9Textbox(w9Data, rule)
			if result ~= nil then
				output[rule.target] = result
			end
		end

		if hasDisregardedEntity then
			-- TAO textbox rules (with disregarded entity)
			for _, rule in w9TaoTextboxRules do
				local result = applyW9Textbox(w9Data, rule)
				if result ~= nil then
					output[rule.target] = result
				end
			end

			-- TAO Tax Status (special LLC logic)
			local taoTaxStatus = resolveW9TaxStatus(w9Data)
			if taoTaxStatus ~= nil then
				output["sfTaxFormW9TAOTaxStatusC"] = DataTypes.makeMultipleCheckboxType({
					typeId = "MultipleCheckbox",
					selectedKeys = taoTaxStatus,
				})
			end

			-- TAO TIN Type
			local taoTinType = resolveW9TINType(w9Data)
			if taoTinType ~= nil then
				output["sfTaxFormW9TAOUSTINTypeC"] = DataTypes.makeMultipleCheckboxType({
					typeId = "MultipleCheckbox",
					selectedKeys = taoTinType,
				})
			end

			-- TAO US Tax ID
			local taoTaxId = resolveW9FMTaxId(w9Data)
			if taoTaxId ~= "" then
				output["sfTaxFormW9TAOUSTaxIDC"] = DataTypes.makeStringType({
					typeId = "String",
					value = taoTaxId,
				})
			end
		else
			-- Direct textbox rules (no disregarded entity)
			for _, rule in w9DirectTextboxRules do
				local result = applyW9Textbox(w9Data, rule)
				if result ~= nil then
					output[rule.target] = result
				end
			end

			-- Direct Tax Status (special LLC logic)
			local directTaxStatus = resolveW9TaxStatus(w9Data)
			if directTaxStatus ~= nil then
				output["sfTaxFormW9TaxStatusC"] = DataTypes.makeMultipleCheckboxType({
					typeId = "MultipleCheckbox",
					selectedKeys = directTaxStatus,
				})
			end

			-- Direct TIN Type
			local directTinType = resolveW9TINType(w9Data)
			if directTinType ~= nil then
				output["sfTaxFormW9USTINTypeC"] = DataTypes.makeMultipleCheckboxType({
					typeId = "MultipleCheckbox",
					selectedKeys = directTinType,
				})
			end

			-- Direct FM Tax Id
			local directTaxId = resolveW9FMTaxId(w9Data)
			if directTaxId ~= "" then
				output["sfTaxFormW9FMTaxIdC"] = DataTypes.makeStringType({
					typeId = "String",
					value = directTaxId,
				})
			end
		end
	end

	return FullTargetTable.makeFullTargetTableFieldsMap(output :: any)
end

--------------------------------------------------------------------------------
-- Orchestrating Transform (scalars + arrays)
--------------------------------------------------------------------------------

function CarlyleMappings.transform(
	contact: any, -- raw JSON, not typed (contactInfo is array)
	w9: SourceW9Table.SourceW9TableFieldsMap?,
	feeder: SourceFeederTable.SourceFeederTableFieldsMap?,
	master: SourceMasterTable.SourceMasterTableFieldsMap?
): FullTargetTable.FullTargetTableFieldsMap
	local output: { [string]: any } = CarlyleMappings.transformScalars(feeder, master, w9) :: any
	local sources: { [string]: any } = { master = master, feeder = feeder }

	output["sfControllingPersons"] = mapControllingPersons(sources)
	output["sfBeneficialOwner"] = mapBeneficialOwner(sources)
	output["sfContact"] = mapContact(contact)

	return FullTargetTable.makeFullTargetTableFieldsMap(output :: any)
end

return CarlyleMappings
