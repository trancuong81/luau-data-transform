--!strict
local T = require("@lib/test_runner")
local CM = require("@lib/carlyle_mappings")
local DataTypes = require("@lib/data_types")
local SourceMasterTable = require("@lib/source_master_table")
local SourceFeederTable = require("@lib/source_feeder_table")
local SourceW9Table = require("@lib/source_w9_table")

T.describe("carlyle_scalar_mappings", function()
	-- 1. textbox single source
	T.it("textbox single source", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ value = "John Doe" }),
		})
		local target = CM.transformScalars(nil, master, nil)
		local name = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(name).toBeTruthy()
		T.expect(name.value).toBe("John Doe")
	end)

	-- 2. textbox multi-source concatenation
	T.it("textbox multi-source concatenation", function()
		-- When first source is empty and second has value, we get the second
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ value = "" }),
			asaFullnameInvestornameGeneralinfo1 = DataTypes.makeStringType({ value = "ACME Corp" }),
		})
		local target = CM.transformScalars(nil, master, nil)
		local name = target.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(name).toBeTruthy()
		T.expect(name.value).toBe("ACME Corp")
	end)

	-- 3. textbox nil source returns nil
	T.it("textbox nil source returns nil", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({})
		local target = CM.transformScalars(nil, master, nil)
		T.expect(target.sfAccountSubscriptionInvestorName).toBeNil()
	end)

	-- 4. textbox with parent field access (name split uses parent)
	T.it("textbox with parent field access", function()
		local lpFields = SourceMasterTable.makeSourceMasterTableLpSignatoryFields({
			individualSubscribernameSignaturepage = DataTypes.makeStringType({ value = "Jane Smith" }),
		})
		local lp = SourceMasterTable.makeSourceMasterTableLpSignatoryType({
			typeId = "CustomCompound",
			valueSubFields = lpFields,
		})
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			lpSignatory = lp,
		})
		local target = CM.transformScalars(nil, master, nil)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		T.expect(first).toBeTruthy()
		T.expect(first.value).toBe("Jane")
		local last = target.sfAgreementNullSignerLastName :: DataTypes.StringType
		T.expect(last.value).toBe("Smith")
	end)

	-- 5. radioGroup basic mapping
	T.it("radioGroup basic mapping", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
			}),
		})
		local target = CM.transformScalars(nil, master, nil)
		local mc = target.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("true")
	end)

	-- 6. radioGroup no match returns nil
	T.it("radioGroup no match returns nil", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "unknown_key" },
			}),
		})
		local target = CM.transformScalars(nil, master, nil)
		T.expect(target.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC).toBeNil()
	end)

	-- 7. radioGroup deduplication across namespaces
	T.it("radioGroup deduplication across namespaces", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
			}),
		})
		local feeder = SourceFeederTable.makeSourceFeederTableFieldsMap({
			luxsentityRegulatedstatusPart2Duediligencequestionnaire = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire" },
			}),
		})
		local target = CM.transformScalars(feeder, master, nil)
		local mc = target.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		-- Both master and feeder have "yes" which maps to "true", but dedup keeps only one
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("true")
	end)

	-- 8. checkboxBoolean true when key present
	T.it("checkboxBoolean true when key present", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaErisaErisa = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "asa_employeebenefitplan_erisa" },
			}),
		})
		local target = CM.transformScalars(nil, master, nil)
		local mc = target.sfAgreementOnboardingIsERISATitleIC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("true")
	end)

	-- 9. checkboxBoolean false when no matching key
	T.it("checkboxBoolean false when no matching key", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaErisaErisa = DataTypes.makeMultipleCheckboxType({
				selectedKeys = { "some_other_key" },
			}),
		})
		local target = CM.transformScalars(nil, master, nil)
		local mc = target.sfAgreementOnboardingIsERISATitleIC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("false")
	end)

	-- 10. name split full name (first/middle/last)
	T.it("name split full name", function()
		local lpFields = SourceMasterTable.makeSourceMasterTableLpSignatoryFields({
			entityAuthorizednameSignaturepage = DataTypes.makeStringType({ value = "Catherine L Ziobro" }),
		})
		local lp = SourceMasterTable.makeSourceMasterTableLpSignatoryType({
			typeId = "CustomCompound",
			valueSubFields = lpFields,
		})
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			lpSignatory = lp,
		})
		local target = CM.transformScalars(nil, master, nil)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		local middle = target.sfAgreementNullSignerMiddleName :: DataTypes.StringType
		local last = target.sfAgreementNullSignerLastName :: DataTypes.StringType
		T.expect(first.value).toBe("Catherine")
		T.expect(middle.value).toBe("L")
		T.expect(last.value).toBe("Ziobro")
	end)

	-- 11. name split two parts (first/last)
	T.it("name split two parts", function()
		local lpFields = SourceMasterTable.makeSourceMasterTableLpSignatoryFields({
			individualSubscribernameSignaturepage = DataTypes.makeStringType({ value = "Jane Doe" }),
		})
		local lp = SourceMasterTable.makeSourceMasterTableLpSignatoryType({
			typeId = "CustomCompound",
			valueSubFields = lpFields,
		})
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			lpSignatory = lp,
		})
		local target = CM.transformScalars(nil, master, nil)
		local first = target.sfAgreementNullSignerFirstName :: DataTypes.StringType
		local middle = target.sfAgreementNullSignerMiddleName :: DataTypes.StringType
		local last = target.sfAgreementNullSignerLastName :: DataTypes.StringType
		T.expect(first.value).toBe("Jane")
		T.expect(middle.value).toBe("")
		T.expect(last.value).toBe("Doe")
	end)

	-- 12. custom Individual detection
	T.it("custom Individual detection", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ value = "John Individual" }),
			asaFullnameInvestornameGeneralinfo1 = DataTypes.makeStringType({ value = "Org Corp" }),
		})
		local target = CM.transformScalars(nil, master, nil)
		local mc = target.sfAccountSubscriptionInvestorIndividualOrganizationC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("Individual")
	end)

	-- 13. custom Organization detection
	T.it("custom Organization detection", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ value = "" }),
			asaFullnameInvestornameGeneralinfo1 = DataTypes.makeStringType({ value = "ACME Corp" }),
		})
		local target = CM.transformScalars(nil, master, nil)
		local mc = target.sfAccountSubscriptionInvestorIndividualOrganizationC :: DataTypes.MultipleCheckboxType
		T.expect(mc).toBeTruthy()
		T.expect(#mc.selectedKeys).toBe(1)
		T.expect(mc.selectedKeys[1]).toBe("Organization")
	end)

	-- 14. W9 direct fields when no disregarded entity
	T.it("W9 direct fields when no disregarded entity", function()
		local w9 = SourceW9Table.makeSourceW9TableFieldsMap({
			w9Line1 = DataTypes.makeStringType({ value = "Tax Account Owner" }),
			w9Line2 = DataTypes.makeStringType({ value = "" }),
			w9Line5 = DataTypes.makeStringType({ value = "123 Main St" }),
		})
		local target = CM.transformScalars(nil, nil, w9)
		-- Direct rules apply
		local owner = target.sfTaxFormW9TaxAccountOwner :: DataTypes.StringType
		T.expect(owner).toBeTruthy()
		T.expect(owner.value).toBe("Tax Account Owner")
		local street = target.sfTaxFormW9BillingStreet :: DataTypes.StringType
		T.expect(street).toBeTruthy()
		T.expect(street.value).toBe("123 Main St")
		-- TAO rules should NOT apply
		T.expect(target.sfTaxFormW9TAOTaxAccountOwner).toBeNil()
	end)

	-- 15. W9 TAO fields when disregarded entity present
	T.it("W9 TAO fields when disregarded entity present", function()
		local w9 = SourceW9Table.makeSourceW9TableFieldsMap({
			w9Line1 = DataTypes.makeStringType({ value = "TAO Owner Name" }),
			w9Line2 = DataTypes.makeStringType({ value = "Some Disregarded LLC" }),
			w9Line5 = DataTypes.makeStringType({ value = "456 Oak Ave" }),
		})
		local target = CM.transformScalars(nil, nil, w9)
		-- TAO rules apply
		local taoOwner = target.sfTaxFormW9TAOTaxAccountOwner :: DataTypes.StringType
		T.expect(taoOwner).toBeTruthy()
		T.expect(taoOwner.value).toBe("TAO Owner Name")
		-- Direct rules should NOT apply
		T.expect(target.sfTaxFormW9TaxAccountOwner).toBeNil()
		T.expect(target.sfTaxFormW9BillingStreet).toBeNil()
		-- Always rules apply: disregarded entity name
		local deName = target.sfTaxFormW9DisregardedEntityName :: DataTypes.StringType
		T.expect(deName).toBeTruthy()
		T.expect(deName.value).toBe("Some Disregarded LLC")
	end)
end)
