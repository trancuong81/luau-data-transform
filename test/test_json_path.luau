--!strict
local T = require("@lib/test_runner")
local JP = require("@lib/json_path")

T.describe("json_path", function()
	T.it("get nested path", function()
		local json = { a = { b = { c = 42 } } }
		local result = JP.getPath(json, { "a", "b", "c" })
		T.expect(result).toBe(42)
	end)

	T.it("get missing path", function()
		local json = { a = { b = 1 } }
		local result = JP.getPath(json, { "a", "x" })
		T.expect(result).toBeNil()
	end)

	T.it("get empty path", function()
		local json = { a = 1 }
		local result = JP.getPath(json, {})
		T.expect(type(result)).toBe("table")
		T.expect((result :: any).a).toBe(1)
	end)

	T.it("set nested path", function()
		local result = JP.setPath({}, { "a", "b" }, "hello")
		local value = JP.getPath(result, { "a", "b" })
		T.expect(value).toBe("hello")
	end)
end)
