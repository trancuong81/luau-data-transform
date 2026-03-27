--!strict
local DataTypes = require("@lib/data_types")
local SourceFeederTable = require("@lib/source_feeder_table")
local SourceMasterTable = require("@lib/source_master_table")
local SourceW9Table = require("@lib/source_w9_table")
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
-- Rule Tables (populated in Task 2; representative rules here for testing)
--------------------------------------------------------------------------------

local textboxRules: { TextboxRule } = {
	{
		target = "sfAccountSubscriptionInvestorName",
		sources = {
			{ ns = "master", field = "asaFullnameInvestornameAmlquestionnaire" },
			{ ns = "master", field = "asaFullnameInvestornameGeneralinfo1" },
			{ ns = "feeder", field = "asaFullnameInvestornameAmlquestionnaire" },
			{ ns = "feeder", field = "asaFullnameInvestornameGeneralinfo1" },
		},
	},
}

local radioGroupRules: { RadioGroupRule } = {
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
}

local checkboxBooleanRules: { CheckboxBooleanRule } = {
	{
		target = "sfAgreementOnboardingIsERISATitleIC",
		sources = {
			{ ns = "master", field = "asaErisaErisa" },
			{ ns = "feeder", field = "asaErisaErisa" },
		},
		trueKeys = { "asa_employeebenefitplan_erisa", "asa_plandescribedunder4975_erisa" },
	},
}

local nameSplitRules: { NameSplitRule } = {
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
}

-- W9 rules: direct (no disregarded entity), TAO (with disregarded entity), always
local w9DirectRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9TaxAccountOwner", w9Field = "w9Line1" },
	{ target = "sfTaxFormW9BillingStreet", w9Field = "w9Line5" },
}

local w9TaoRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9TAOTaxAccountOwner", w9Field = "w9Line1" },
}

local w9AlwaysRules: { W9TextboxRule } = {
	{ target = "sfTaxFormW9DisregardedEntityName", w9Field = "w9Line2" },
}

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

	-- Custom: Individual vs Organization detection
	-- Checks asaFullnameInvestornameAmlquestionnaire (Individual) vs
	-- asaFullnameInvestornameGeneralinfo1 (Organization), first non-empty wins across master then feeder
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

	-- W9 conditional rules
	if w9 ~= nil then
		local w9Data = w9 :: SourceW9Table.SourceW9TableFieldsMap

		-- Determine if disregarded entity exists
		local hasDisregardedEntity = false
		local line2 = getField(w9Data, "w9Line2")
		if line2 ~= nil then
			local v = (line2 :: { [string]: any }).value
			if v ~= nil and v ~= "" then
				hasDisregardedEntity = true
			end
		end

		-- Always rules
		for _, rule in w9AlwaysRules do
			local result = applyW9Textbox(w9Data, rule)
			if result ~= nil then
				output[rule.target] = result
			end
		end

		if hasDisregardedEntity then
			-- TAO rules (with disregarded entity)
			for _, rule in w9TaoRules do
				local result = applyW9Textbox(w9Data, rule)
				if result ~= nil then
					output[rule.target] = result
				end
			end
		else
			-- Direct rules (no disregarded entity)
			for _, rule in w9DirectRules do
				local result = applyW9Textbox(w9Data, rule)
				if result ~= nil then
					output[rule.target] = result
				end
			end
		end
	end

	return FullTargetTable.makeFullTargetTableFieldsMap(output :: any)
end

return CarlyleMappings
