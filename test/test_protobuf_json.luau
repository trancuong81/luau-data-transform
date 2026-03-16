--!strict
local T = require("@lib/test_runner")
local DataTypes = require("@lib/data_types")
local TableSchema = require("@lib/table_schema")

T.describe("json roundtrip", function()
	T.it("StringType roundtrip (Ssn)", function()
		local original = DataTypes.makeStringType({
			typeId = "Ssn",
			value = "123-45-6789",
			regex = "^\\d{3}-\\d{2}-\\d{4}$",
			formatPatterns = { "000-00-0000" },
		})
		local json = DataTypes.encodeJsonStringType(original)
		local decoded = DataTypes.decodeJsonStringType(json)
		T.expect(decoded.typeId).toBe("Ssn")
		T.expect(decoded.value).toBe("123-45-6789")
		T.expect(decoded.regex).toBe("^\\d{3}-\\d{2}-\\d{4}$")
		T.expect(#decoded.formatPatterns).toBe(1)
		T.expect(decoded.formatPatterns[1]).toBe("000-00-0000")
	end)

	T.it("StringType roundtrip (Email)", function()
		local original = DataTypes.makeStringType({
			typeId = "Email",
			value = "test@example.com",
		})
		local json = DataTypes.encodeJsonStringType(original)
		local decoded = DataTypes.decodeJsonStringType(json)
		T.expect(decoded.typeId).toBe("Email")
		T.expect(decoded.value).toBe("test@example.com")
	end)

	T.it("MultipleCheckboxType roundtrip", function()
		local original = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = { "opt1", "opt3" },
			allOptionKeysInOrder = { "opt1", "opt2", "opt3" },
			allOptionLabelsInOrder = { "Option 1", "Option 2", "Option 3" },
		})
		local json = DataTypes.encodeJsonMultipleCheckboxType(original)
		local decoded = DataTypes.decodeJsonMultipleCheckboxType(json)
		T.expect(#decoded.selectedKeys).toBe(2)
		T.expect(decoded.selectedKeys[1]).toBe("opt1")
		T.expect(decoded.selectedKeys[2]).toBe("opt3")
	end)

	T.it("AddressType roundtrip", function()
		local cityField = DataTypes.makeStringType({ typeId = "City", value = "Springfield" })
		local subFields = DataTypes.makeAddressSubFields({ city = cityField })
		local original = DataTypes.makeAddressType({
			typeId = "Address",
			valueSubFields = subFields,
			subFieldKeysInOrder = {
				"numberAndStreet", "city", "stateProvince",
				"country", "postalZipCode", "fullAddress",
			},
		})
		local json = DataTypes.encodeJsonAddressType(original)
		local decoded = DataTypes.decodeJsonAddressType(json)
		T.expect(decoded.typeId).toBe("Address")
		T.expect(decoded.valueSubFields).toBeTruthy()
		local decodedCity = (decoded.valueSubFields :: any).city
		T.expect(decodedCity.value).toBe("Springfield")
		T.expect(#decoded.subFieldKeysInOrder).toBe(6)
	end)

	T.it("TableSchema roundtrip", function()
		local strVal = DataTypes.makeStringType({ typeId = "String", value = "hello" })
		local field = TableSchema.makeSingleFieldType({
			value = strVal :: any,
			label = "Test Field",
		})
		local schema = TableSchema.makeTableSchema({
			fieldsMap = { field1 = field },
			fieldKeysInOrder = { "field1" },
			label = "Test Schema",
		})
		local json = TableSchema.encodeJsonTableSchema(schema)
		local decoded = TableSchema.decodeJsonTableSchema(json)
		T.expect(decoded.label).toBe("Test Schema")
		T.expect(#decoded.fieldKeysInOrder).toBe(1)
		T.expect(decoded.fieldKeysInOrder[1]).toBe("field1")
		local decodedField = decoded.fieldsMap.field1
		T.expect(decodedField).toBeTruthy()
		T.expect(decodedField.label).toBe("Test Field")
		T.expect(decodedField.value).toBeTruthy()
		T.expect((decodedField.value :: any).typeId).toBe("String")
		T.expect((decodedField.value :: any).value).toBe("hello")
	end)
end)
