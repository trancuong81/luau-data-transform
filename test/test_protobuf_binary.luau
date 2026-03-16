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
end)
