--!strict
local T = require("@lib/test_runner")
local DataTypes = require("@lib/data_types")

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
end)
