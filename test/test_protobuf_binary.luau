--!strict
local T = require("@lib/test_runner")
local DataTypes = require("@lib/data_types")
local Encoder = require("@lib/pb/encoder")
local Decoder = require("@lib/pb/decoder")

T.describe("protobuf binary roundtrip", function()
	T.it("StringType roundtrip (Ssn)", function()
		local original = DataTypes.makeStringType({
			typeId = "Ssn",
			value = "123-45-6789",
			regex = "^\\d{3}-\\d{2}-\\d{4}$",
			formatPatterns = { "000-00-0000" },
		})
		local bytes = Encoder.encodePbStringType(original)
		local decoded = Decoder.decodePbStringType(bytes)
		T.expect(decoded).toEqual(original)
	end)

	T.it("MultipleCheckboxType roundtrip", function()
		local original = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = { "key1", "key2", "key3" },
			allOptionKeysInOrder = { "key1", "key2", "key3" },
			allOptionLabelsInOrder = { "Label 1", "Label 2", "Label 3" },
		})
		local bytes = Encoder.encodePbMultipleCheckboxType(original)
		local decoded = Decoder.decodePbMultipleCheckboxType(bytes)
		T.expect(decoded).toEqual(original)
	end)

	T.it("AddressType roundtrip", function()
		local cityField = DataTypes.makeStringType({ typeId = "City", value = "Springfield" })
		local stateField = DataTypes.makeStringType({ typeId = "StateProvince", value = "IL" })
		local subFields = DataTypes.makeAddressSubFields({
			city = cityField,
			stateProvince = stateField,
		})
		local original = DataTypes.makeAddressType({
			typeId = "Address",
			valueSubFields = subFields,
			subFieldKeysInOrder = {
				"numberAndStreet", "city", "stateProvince",
				"country", "postalZipCode", "fullAddress",
			},
		})
		local bytes = Encoder.encodePbAddressType(original)
		local decoded = Decoder.decodePbAddressType(bytes)
		T.expect(decoded.typeId).toBe("Address")
		T.expect(decoded.valueSubFields).toBeTruthy()
		local sf = decoded.valueSubFields :: DataTypes.AddressSubFields
		T.expect(sf.city).toBeTruthy()
		T.expect((sf.city :: DataTypes.StringType).value).toBe("Springfield")
		T.expect(sf.stateProvince).toBeTruthy()
		T.expect((sf.stateProvince :: DataTypes.StringType).value).toBe("IL")
		T.expect(#decoded.subFieldKeysInOrder).toBe(6)
	end)

	T.it("JSON-then-binary interop (SourceTableFieldsMap)", function()
		local fs = require("@lune/fs")
		local serde = require("@lune/serde")
		local SourceTable = require("@lib/source_table")
		local SchemaRegistry = require("@lib/pb/schema_registry")

		local jsonStr = fs.readFile("test/fixtures/values.json")
		local jsonData = serde.decode("json", jsonStr)
		local original = SourceTable.decodeJsonSourceTableFieldsMap(jsonData)

		local bytes = SchemaRegistry.encode("SourceTableFieldsMap", original)
		local decoded = SchemaRegistry.decode("SourceTableFieldsMap", bytes)

		-- Verify key fields survived round-trip (avoid checking empty-string fields due to proto3 lossy semantics)
		T.expect(decoded.asaFullnameInvestornameGeneralinfo1).toBeTruthy()
		T.expect((decoded :: any).asaFullnameInvestornameGeneralinfo1.value).toBe("The Lincoln National Life Insurance Company")
		T.expect(decoded.lpSignatory).toBeTruthy()
		local lp = (decoded :: any).lpSignatory
		T.expect(lp.typeId).toBe("CustomCompound")
		T.expect(lp.valueSubFields).toBeTruthy()
		T.expect(lp.valueSubFields.asaCommitmentAmount.value).toBe("75,000,000")
		T.expect(decoded.entityInternationalsupplementsPart1Duediligencequestionnaire).toBeTruthy()
		T.expect(#(decoded :: any).entityInternationalsupplementsPart1Duediligencequestionnaire.selectedKeys).toBe(1)
	end)

	T.it("TableSchema roundtrip with map", function()
		local TableSchema = require("@lib/table_schema")
		local strVal = DataTypes.makeStringType({ typeId = "String", value = "hello" })
		local mcVal = DataTypes.makeMultipleCheckboxType({
			typeId = "MultipleCheckbox",
			selectedKeys = { "a" },
			allOptionKeysInOrder = { "a", "b" },
			allOptionLabelsInOrder = { "A", "B" },
		})
		local field1 = TableSchema.makeSingleFieldType({
			value = strVal :: any,
			label = "Field One",
		})
		local field2 = TableSchema.makeSingleFieldType({
			value = mcVal :: any,
			label = "Field Two",
		})
		local schema = TableSchema.makeTableSchema({
			fieldsMap = { fieldA = field1, fieldB = field2 },
			fieldKeysInOrder = { "fieldA", "fieldB" },
			label = "Test Schema",
			groups = {
				TableSchema.makeFieldGroup({ label = "Group 1", startIdx = 0, endIdx = 1 }),
			},
		})
		local bytes = Encoder.encodePbTableSchema(schema)
		local decoded = Decoder.decodePbTableSchema(bytes)
		T.expect(decoded.label).toBe("Test Schema")
		T.expect(#decoded.fieldKeysInOrder).toBe(2)
		T.expect(#decoded.groups).toBe(1)
		T.expect(decoded.groups[1].label).toBe("Group 1")
		local dfA = decoded.fieldsMap.fieldA
		T.expect(dfA).toBeTruthy()
		T.expect(dfA.label).toBe("Field One")
		T.expect(dfA.value).toBeTruthy()
		T.expect((dfA.value :: any).typeId).toBe("String")
		T.expect((dfA.value :: any).value).toBe("hello")
		local dfB = decoded.fieldsMap.fieldB
		T.expect(dfB).toBeTruthy()
		T.expect(dfB.label).toBe("Field Two")
		T.expect((dfB.value :: any).typeId).toBe("MultipleCheckbox")
		T.expect(#(dfB.value :: any).selectedKeys).toBe(1)
	end)
end)
