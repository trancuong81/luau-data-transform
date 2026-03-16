--!strict
local fs = require("@lune/fs")
local serde = require("@lune/serde")
local T = require("@lib/test_runner")

T.describe("placeholder", function()
	T.it("can read and parse JSON fixture", function()
		local content = fs.readFile("test/fixtures/values.json")
		local data = serde.decode("json", content)
		T.expect(type(data)).toBe("table")
		T.expect(data).toBeTruthy()
	end)
end)
