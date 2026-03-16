--!strict
local T = require("@lib/test_runner")
local EM = require("@lib/example_mappings")
local DataTypes = require("@lib/data_types")
local SourceTable = require("@lib/source_table")

-- Helper factory matching OCaml test_example_mappings.ml make_source
local function makeSource(config: {
	commitment: string?,
	indName: string?,
	entName: string?,
	amlName: string?,
	generalName: string?,
	regulatedKeys: {string}?,
	indiIntlKeys: {string}?,
	entityIntlKeys: {string}?,
	ssn: string?,
	ein: string?,
	w9Line2: string?,
}?): SourceTable.SourceTableFieldsMap
	local c = config or {}
	local commitment = c.commitment or "5000000"
	local indName = c.indName or ""
	local entName = c.entName or "John Doe"
	local amlName = c.amlName or ""
	local generalName = c.generalName or "ACME Corp"
	local regulatedKeys = c.regulatedKeys or { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" }
	local indiIntlKeys = c.indiIntlKeys or {}
	local entityIntlKeys = c.entityIntlKeys or {}
	local ssn = c.ssn or ""
	local ein = c.ein or ""
	local w9Line2 = c.w9Line2 or ""

	local lpFields = SourceTable.makeLpSignatoryFields({
		asaCommitmentAmount = DataTypes.makeStringType({ typeId = "String", value = commitment }),
		individualSubscribernameSignaturepage = DataTypes.makeStringType({ typeId = "String", value = indName }),
		entityAuthorizednameSignaturepage = DataTypes.makeStringType({ typeId = "String", value = entName }),
	})
	local lp = SourceTable.makeLpSignatoryType({ typeId = "CustomCompound", valueSubFields = lpFields })

	local w9Fields = SourceTable.makeW9Fields({
		w9PartiSsn1 = DataTypes.makeStringType({ typeId = "String", value = ssn }),
		w9PartiEin1 = DataTypes.makeStringType({ typeId = "String", value = ein }),
		w9Line2 = DataTypes.makeStringType({ typeId = "String", value = w9Line2 }),
	})
	local w9 = SourceTable.makeW9Type({ typeId = "CustomCompound", valueSubFields = w9Fields })

	return SourceTable.makeSourceTableFieldsMap({
		lpSignatory = lp,
		asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ typeId = "String", value = amlName }),
		asaFullnameInvestornameGeneralinfo1 = DataTypes.makeStringType({ typeId = "String", value = generalName }),
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = regulatedKeys,
		}),
		indiInternationalsupplementsPart1Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = indiIntlKeys,
		}),
		entityInternationalsupplementsPart1Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = entityIntlKeys,
		}),
		w9 = w9,
	})
end

T.describe("example_mappings", function()
	-- split_name tests (4)
	T.it("split_name full", function()
		local result = EM.splitName("John Michael Smith")
		T.expect(result.firstName).toBe("John")
		T.expect(result.middleName).toBe("Michael")
		T.expect(result.lastName).toBe("Smith")
	end)

	T.it("split_name two parts", function()
		local result = EM.splitName("Jane Doe")
		T.expect(result.firstName).toBe("Jane")
		T.expect(result.middleName).toBe("")
		T.expect(result.lastName).toBe("Doe")
	end)

	T.it("split_name empty", function()
		local result = EM.splitName("")
		T.expect(result.firstName).toBe("")
		T.expect(result.middleName).toBe("")
		T.expect(result.lastName).toBe("")
	end)

	T.it("split_name single", function()
		local result = EM.splitName("Madonna")
		T.expect(result.firstName).toBe("Madonna")
		T.expect(result.lastName).toBe("Madonna")
	end)

	-- commitment (1)
	T.it("commitment mapping", function()
		local src = makeSource({ commitment = "1,000,000" })
		local target = EM.transform(src)
		T.expect(target.sfAgreementNullCommitmentC).toBeTruthy()
		local money = target.sfAgreementNullCommitmentC :: DataTypes.MoneyType
		T.expect(money.valueSubFields).toBeTruthy()
		local sub = money.valueSubFields :: DataTypes.MoneySubFields
		T.expect(sub.amount).toBeTruthy()
		local amount = sub.amount :: DataTypes.NumberType
		T.expect(amount.value).toBe(1000000)
	end)

	-- investor name (2)
	T.it("investor name prefers aml", function()
		local src = makeSource({ amlName = "AML Name", generalName = "General Name" })
		local target = EM.transform(src)
		local nameField = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(nameField.value).toBe("AML Name")
	end)

	T.it("investor name falls back", function()
		local src = makeSource({ amlName = "", generalName = "General Name" })
		local target = EM.transform(src)
		local nameField = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(nameField.value).toBe("General Name")
	end)

	-- regulated status (2)
	T.it("regulated status yes", function()
		local src = makeSource({
			regulatedKeys = { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local radio = target.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("true")
	end)

	T.it("regulated status no", function()
		local src = makeSource({
			regulatedKeys = { "no_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local radio = target.sfAccountSubscriptionInvestorWlcPubliclyListedOnAStockExchangeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("false")
	end)

	-- international supplements (1)
	T.it("international supplements", function()
		local src = makeSource({
			entityIntlKeys = { "none_entity_internationalsupplements_part1_duediligencequestionnaire" },
		})
		local target = EM.transform(src)
		local mc = target.sfAgreementNullWlcInternationalSupplementsC :: DataTypes.MultipleCheckboxType
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("No Supplement")
	end)

	-- signer name (2)
	T.it("signer name split", function()
		local src = makeSource({ entName = "Catherine L Ziobro", indName = "" })
		local target = EM.transform(src)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		local middle = target.sfAgreementNullSignerMiddleName :: DataTypes.StringType
		local last = target.sfAgreementNullSignerLastName :: DataTypes.StringType
		T.expect(first.value).toBe("Catherine")
		T.expect(middle.value).toBe("L")
		T.expect(last.value).toBe("Ziobro")
	end)

	T.it("signer name prefers individual", function()
		local src = makeSource({ indName = "Jane Smith", entName = "Entity Auth" })
		local target = EM.transform(src)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		T.expect(first.value).toBe("Jane")
	end)

	-- w9 tin type (3)
	T.it("w9 tin type ein", function()
		local src = makeSource({ ssn = "", ein = "" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("EIN")
	end)

	T.it("w9 tin type ssn", function()
		local src = makeSource({ ssn = "123-45-6789" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("SSN")
	end)

	T.it("w9 tin type line2", function()
		local src = makeSource({ w9Line2 = "Some LLC" })
		local target = EM.transform(src)
		local radio = target.sfTaxFormW9UsTinTypeC :: DataTypes.RadioGroupType
		T.expect(radio.selectedKey).toBe("")
	end)
end)
