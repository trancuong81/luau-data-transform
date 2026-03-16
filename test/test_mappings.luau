--!strict
local T = require("@lib/test_runner")
local Mappings = require("@lib/mappings")
local JP = require("@lib/json_path")

T.describe("mappings", function()
	T.it("textbox mapping", function()
		local input = {
			subdoc = {
				lp_signatory = {
					asa_commitment_amount = { value = "1000000" },
				},
			},
		}
		local mapping = Mappings.textboxMapping({
			name = "sf_Agreement_null_Commitment_c",
			inputPaths = {
				{ "subdoc", { "subdoc", "lp_signatory", "asa_commitment_amount" } },
			},
			outputPath = { "sf_Agreement_null_Commitment_c" },
		})
		local result = Mappings.applyMapping(mapping, input)
		local value = JP.getString(result, { "sf_Agreement_null_Commitment_c", "value" })
		T.expect(value).toBe("1000000")
	end)

	T.it("checkbox mapping", function()
		local input = {
			subdoc = {
				luxsentity_regulatedstatus_part2_duediligencequestionnaire = {
					selectedKeys = {
						"yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire",
					},
				},
			},
		}
		local mapping = Mappings.checkboxMapping({
			name = "sf_Account_SubscriptionInvestor_WLC",
			inputPaths = {
				{ "subdoc", { "subdoc", "luxsentity_regulatedstatus_part2_duediligencequestionnaire" } },
			},
			outputPath = { "sf_Account_SubscriptionInvestor_WLC" },
			optionMap = {
				{ "yes_luxsentity_regulatedstatus_part2_duediligencequestionnaire", "true" },
				{ "no_luxsentity_regulatedstatus_part2_duediligencequestionnaire", "false" },
			},
		})
		local result = Mappings.applyMapping(mapping, input)
		local keys = JP.getStringList(result, { "sf_Account_SubscriptionInvestor_WLC", "selectedKeys" })
		T.expect(#keys).toBe(1)
		T.expect(keys[1]).toBe("true")
	end)
end)
