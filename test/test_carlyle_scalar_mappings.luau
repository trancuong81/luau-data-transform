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

--------------------------------------------------------------------------------
-- Array mapper tests
--------------------------------------------------------------------------------

T.describe("carlyle_array_mappings", function()
	-- 16. mapControllingPersons with name data
	T.it("mapControllingPersons splits name into first/middle/last", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			nameControlpersonPart2Duediligencequestionnaire = DataTypes.makeStringType({ value = "Alice B Cooper" }),
			nameControlpersonPart2Duediligencequestionnaire0 = DataTypes.makeStringType({ value = "Jane Doe" }),
		})
		local result = CM.transform(nil, nil, nil, master)
		-- sfControllingPersons is an array-like value in the output
		local cpArr = (result :: any).sfControllingPersons :: { any }
		T.expect(cpArr).toBeTruthy()
		T.expect(#cpArr).toBe(5) -- 5 indices: "", "0", "1", "2", "3"

		-- First entry: "Alice B Cooper"
		local cp0 = cpArr[1]
		local sf0 = cp0.valueSubFields :: { [string]: any }
		T.expect((sf0.sfControllingPersonsNullFirstNameC :: DataTypes.StringType).value).toBe("Alice")
		T.expect((sf0.sfControllingPersonsNullMiddleNameC :: DataTypes.StringType).value).toBe("B")
		T.expect((sf0.sfControllingPersonsNullLastNameC :: DataTypes.StringType).value).toBe("Cooper")

		-- Second entry: "Jane Doe"
		local cp1 = cpArr[2]
		local sf1 = cp1.valueSubFields :: { [string]: any }
		T.expect((sf1.sfControllingPersonsNullFirstNameC :: DataTypes.StringType).value).toBe("Jane")
		T.expect((sf1.sfControllingPersonsNullMiddleNameC :: DataTypes.StringType).value).toBe("")
		T.expect((sf1.sfControllingPersonsNullLastNameC :: DataTypes.StringType).value).toBe("Doe")

		-- Third entry: no data → empty name parts
		local cp2 = cpArr[3]
		local sf2 = cp2.valueSubFields :: { [string]: any }
		T.expect((sf2.sfControllingPersonsNullFirstNameC :: DataTypes.StringType).value).toBe("")
	end)

	-- 17. mapControllingPersons has empty defaults for unmapped fields
	T.it("mapControllingPersons has empty defaults for unmapped fields", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			nameControlpersonPart2Duediligencequestionnaire = DataTypes.makeStringType({ value = "Test Name" }),
		})
		local result = CM.transform(nil, nil, nil, master)
		local cpArr = (result :: any).sfControllingPersons :: { any }
		local sf = cpArr[1].valueSubFields :: { [string]: any }
		-- Unmapped StringType fields should be empty
		T.expect((sf.sfControllingPersonsNullDateOfBirthC :: DataTypes.StringType).value).toBe("")
		T.expect((sf.sfControllingPersonsNullMailingCityC :: DataTypes.StringType).value).toBe("")
		-- Unmapped MultipleCheckboxType field should have empty selectedKeys
		local mc = sf.sfControllingPersonsNullInactiveC :: DataTypes.MultipleCheckboxType
		T.expect(#mc.selectedKeys).toBe(0)
	end)

	-- 18. mapBeneficialOwner splits name and maps address
	T.it("mapBeneficialOwner maps name, direct, and address fields", function()
		local feederAddrFields = SourceFeederTable.makeSourceFeederTableAddressUboFields({
			numberandstreetResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "123 Main St" }),
			cityResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "Springfield" }),
			stateResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "IL" }),
			zipResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "62701" }),
			countryResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "US" }),
		})
		local feeder = SourceFeederTable.makeSourceFeederTableFieldsMap({
			asaFullnameBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "Robert James Smith" }),
			asaDateofbirthBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "1980-01-15" }),
			pepBeneficialownerPart2Duediligencequestionnaire = DataTypes.makeStringType({ value = "No" }),
			idBeneficialownerPart2Duediligencequestionnaire = DataTypes.makeStringType({ value = "123-45-6789" }),
			asaResidentialaddressBeneficialownerAmlquestionnaire = DataTypes.makeStringType({ value = "123 Main St Springfield IL" }),
			addressUbo = SourceFeederTable.makeSourceFeederTableAddressUboType({
				typeId = "CustomCompound",
				valueSubFields = feederAddrFields,
			}),
		})
		local result = CM.transform(nil, nil, feeder, nil)
		local boArr = (result :: any).sfBeneficialOwner :: { any }
		T.expect(boArr).toBeTruthy()
		T.expect(#boArr).toBe(5)

		local sf = boArr[1].valueSubFields :: { [string]: any }
		-- Name split
		T.expect((sf.sfBeneficialOwnerNullFirstName :: DataTypes.StringType).value).toBe("Robert")
		T.expect((sf.sfBeneficialOwnerNullMiddleNameC :: DataTypes.StringType).value).toBe("James")
		T.expect((sf.sfBeneficialOwnerNullLastName :: DataTypes.StringType).value).toBe("Smith")
		-- Direct fields
		T.expect((sf.sfBeneficialOwnerNullDateOfBirthC :: DataTypes.StringType).value).toBe("1980-01-15")
		T.expect((sf.sfBeneficialOwnerNullPEPStatusC :: DataTypes.StringType).value).toBe("No")
		T.expect((sf.sfBeneficialOwnerNullUSTaxIDC :: DataTypes.StringType).value).toBe("123-45-6789")
		T.expect((sf.anduinBeneficialOwnerNullInvestorRegisteredFullAddress :: DataTypes.StringType).value).toBe("123 Main St Springfield IL")
		-- Address sub-fields
		T.expect((sf.sfBeneficialOwnerNullInvestorRegisteredStreetAddressC :: DataTypes.StringType).value).toBe("123 Main St")
		T.expect((sf.sfBeneficialOwnerNullInvestorRegisteredCityC :: DataTypes.StringType).value).toBe("Springfield")
		T.expect((sf.sfBeneficialOwnerNullInvestorRegisteredStateProvinceC :: DataTypes.StringType).value).toBe("IL")
		T.expect((sf.sfBeneficialOwnerNullInvestorRegisteredPostalCodeC :: DataTypes.StringType).value).toBe("62701")
		T.expect((sf.sfBeneficialOwnerNullInvestorRegisteredCountryC :: DataTypes.StringType).value).toBe("US")
	end)

	-- 19. mapContact with role and notification booleans
	T.it("mapContact maps roles and notifications to booleans", function()
		local contactData = {
			contactInfo = {
				{
					valueSubFields = {
						nameContactPart3Duediligencequestionnaire = { value = "John A Doe" },
						contactrolePart3Duediligencequestionnaire = {
							selectedKeys = {
								"primarycontact_contactrole_part3_duediligencequestionnaire",
								"wireapprover_contactrole_part3_duediligencequestionnaire",
							},
						},
						contactnotificationPart3Duediligencequestionnaire = {
							selectedKeys = {
								"capitalcallnotices_contactnotification_part3_duediligencequestionnaire",
								"taxinfo_contactnotification_part3_duediligencequestionnaire",
							},
						},
						addressContactPart3Duediligencequestionnaire = { value = "100 Broadway" },
						numberandstreetAddressContactPart3Duediligencequestionnaire = { value = "100 Broadway" },
						cityAddressContactPart3Duediligencequestionnaire = { value = "New York" },
						stateAddressContactPart3Duediligencequestionnaire = { value = "NY" },
						zipAddressContactPart3Duediligencequestionnaire = { value = "10001" },
						countryAddressContactPart3Duediligencequestionnaire = { value = "US" },
						phoneContactPart3Duediligencequestionnaire = { value = "212-555-1234" },
						faxContactPart3Duediligencequestionnaire = { value = "212-555-4321" },
						emailContactPart3Duediligencequestionnaire = { value = "john@example.com" },
					},
				},
			},
		}
		local result = CM.transform(contactData, nil, nil, nil)
		local ctArr = (result :: any).sfContact :: { any }
		T.expect(ctArr).toBeTruthy()
		T.expect(#ctArr).toBe(1)

		local sf = ctArr[1].valueSubFields :: { [string]: any }
		-- Name
		T.expect((sf.sfContactNullFirstName :: DataTypes.StringType).value).toBe("John")
		T.expect((sf.sfContactNullMiddleNameC :: DataTypes.StringType).value).toBe("A")
		T.expect((sf.sfContactNullLastName :: DataTypes.StringType).value).toBe("Doe")
		T.expect((sf.sfContactNullName :: DataTypes.StringType).value).toBe("John A Doe")
		-- Address
		T.expect((sf.sfContactNullMailingAddress :: DataTypes.StringType).value).toBe("100 Broadway")
		T.expect((sf.sfContactNullMailingStreet :: DataTypes.StringType).value).toBe("100 Broadway")
		T.expect((sf.sfContactNullMailingCity :: DataTypes.StringType).value).toBe("New York")
		T.expect((sf.sfContactNullMailingState :: DataTypes.StringType).value).toBe("NY")
		T.expect((sf.sfContactNullMailingPostalCode :: DataTypes.StringType).value).toBe("10001")
		T.expect((sf.sfContactNullMailingCountry :: DataTypes.StringType).value).toBe("US")
		-- Contact details
		T.expect((sf.sfContactNullOpBusinessPhoneC :: DataTypes.StringType).value).toBe("212-555-1234")
		T.expect((sf.sfContactNullFax :: DataTypes.StringType).value).toBe("212-555-4321")
		T.expect((sf.sfContactNullOpEmailPrimaryC :: DataTypes.StringType).value).toBe("john@example.com")
		-- Roles: primary=true, wire=true, others=false
		T.expect((sf.sfContactIFCPrimaryContactC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("true")
		T.expect((sf.sfContactIFCWireApproverC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("true")
		T.expect((sf.sfContactIFCSecondaryContactC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCTaxAdvisorC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCLegalAdvisorC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCFinanceContactC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCAMLKYCContactC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		-- Notifications: capital=true, tax=true, others=false
		T.expect((sf.sfContactIFCCapitalCallManagementNotC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("true")
		T.expect((sf.sfContactIFCTaxInformationNotC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("true")
		T.expect((sf.sfContactIFCDistributionManagementNotC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCFinancialReportingNotC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		T.expect((sf.sfContactIFCLegalInformationNotC :: DataTypes.MultipleCheckboxType).selectedKeys[1]).toBe("false")
		-- Empty static fields
		T.expect(#(sf.sfContactIFCNotificationsNotC :: DataTypes.MultipleCheckboxType).selectedKeys).toBe(0)
		T.expect(#(sf.sfContactIFCNotificationsC :: DataTypes.MultipleCheckboxType).selectedKeys).toBe(0)
		T.expect(#(sf.anduinContactNotification :: DataTypes.MultipleCheckboxType).selectedKeys).toBe(0)
		T.expect(#(sf.anduinContactRole :: DataTypes.MultipleCheckboxType).selectedKeys).toBe(0)
	end)

	-- 20. mapContact with empty input returns empty array
	T.it("mapContact with nil input returns empty array", function()
		local result = CM.transform(nil, nil, nil, nil)
		local ctArr = (result :: any).sfContact :: { any }
		T.expect(#ctArr).toBe(0)
	end)

	-- 21. transform orchestrator produces all 3 array fields
	T.it("transform orchestrates scalars and arrays", function()
		local master = SourceMasterTable.makeSourceMasterTableFieldsMap({
			asaFullnameInvestornameAmlquestionnaire = DataTypes.makeStringType({ value = "Test Investor" }),
			nameControlpersonPart2Duediligencequestionnaire = DataTypes.makeStringType({ value = "CP Name" }),
		})
		local result = CM.transform(nil, nil, nil, master)
		-- Scalar field should be present
		local investorName = result.sfAccountSubscriptionInvestorName :: DataTypes.StringType
		T.expect(investorName).toBeTruthy()
		T.expect(investorName.value).toBe("Test Investor")
		-- Array fields should be present
		local cpArr = (result :: any).sfControllingPersons :: { any }
		T.expect(#cpArr).toBe(5)
		local boArr = (result :: any).sfBeneficialOwner :: { any }
		T.expect(#boArr).toBe(5)
		local ctArr = (result :: any).sfContact :: { any }
		T.expect(#ctArr).toBe(0) -- no contact data
	end)
end)
