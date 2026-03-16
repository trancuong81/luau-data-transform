--!strict
local T = require("@lib/test_runner")
local Schema = require("@lib/schema")

T.describe("schema", function()
	T.it("load data type constants", function()
		local constants = Schema.loadDataTypeConstants()
		-- Verify total count
		T.expect(Schema.typeCount(constants)).toBe(47)
		-- Verify Ssn has regex
		local ssn = Schema.findTypeConstants(constants, "Ssn")
		T.expect(ssn).toBeTruthy()
		T.expect(Schema.hasRegex(ssn :: any)).toBe(true)
	end)

	T.it("load source table schema", function()
		local schema = Schema.loadSourceTableSchema()
		T.expect(schema.label).toBe("subdoc")
		T.expect(#schema.fieldKeysInOrder).toBe(7)

		local fm = schema.fieldsMap
		T.expect(fm).toBeTruthy()

		-- Check StringType field
		local strField = (fm :: any).asaFullnameInvestornameGeneralinfo1
		T.expect(strField).toBeTruthy()
		T.expect(strField.typeId).toBe("String")

		-- Check lp_signatory compound field
		local sigField = (fm :: any).lpSignatory
		T.expect(sigField).toBeTruthy()
		T.expect(sigField.typeId).toBe("CustomCompound")
		T.expect(#sigField.subFieldKeysInOrder).toBe(3)

		-- Check sub-field is typed
		local subFields = sigField.valueSubFields
		T.expect(subFields).toBeTruthy()
		local commitmentSub = subFields.asaCommitmentAmount
		T.expect(commitmentSub).toBeTruthy()
		T.expect(commitmentSub.typeId).toBe("String")

		-- Check MultipleCheckbox has option keys
		local checkbox = (fm :: any).luxsentityRegulatedstatusPart2Duediligencequestionnaire
		T.expect(checkbox).toBeTruthy()
		T.expect(checkbox.typeId).toBe("MultipleCheckbox")
		T.expect(#checkbox.allOptionKeysInOrder).toBe(2)
		T.expect(#checkbox.allOptionLabelsInOrder).toBe(2)
	end)

	T.it("load target table schema", function()
		local schema = Schema.loadTargetTableSchema()
		T.expect(schema.label).toBe("target")
		T.expect(#schema.fieldKeysInOrder).toBe(8)

		local fm = schema.fieldsMap
		T.expect(fm).toBeTruthy()

		-- Check MoneyType field
		local moneyField = (fm :: any).sfAgreementNullCommitmentC
		T.expect(moneyField).toBeTruthy()
		T.expect(moneyField.typeId).toBe("Money")

		-- Check RadioGroupType field
		local radioField = (fm :: any).sfTaxFormW9UsTinTypeC
		T.expect(radioField).toBeTruthy()
		T.expect(radioField.typeId).toBe("RadioGroup")
		T.expect(#radioField.allOptionKeysInOrder).toBe(2)
		T.expect(radioField.allOptionKeysInOrder[1]).toBe("SSN")
		T.expect(radioField.allOptionKeysInOrder[2]).toBe("EIN")

		-- Check StringType field
		local strField = (fm :: any).sfAgreementNullSignerFirstName
		T.expect(strField).toBeTruthy()
		T.expect(strField.typeId).toBe("String")

		-- Check MultipleCheckbox has 6 option keys
		local mcField = (fm :: any).sfAgreementNullWlcInternationalSupplementsC
		T.expect(mcField).toBeTruthy()
		T.expect(#mcField.allOptionKeysInOrder).toBe(6)
	end)
end)
