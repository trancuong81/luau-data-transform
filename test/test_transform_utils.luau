--!strict
local T = require("@lib/test_runner")
local TU = require("@lib/transform_utils")

T.describe("transform_utils", function()
	T.it("identity", function()
		T.expect(TU.identity(42)).toBe(42)
		T.expect(TU.identity("hello")).toBe("hello")
	end)

	T.it("groupBy", function()
		local items = { { "a", 1 }, { "b", 2 }, { "a", 3 } }
		local result = TU.groupBy(items, function(item: any): string
			return (item :: {any})[1] :: string
		end, function(item: any): any
			return (item :: {any})[2]
		end)
		-- result should be { {"a", {1, 3}}, {"b", {2}} }
		T.expect(#result).toBe(2)
		T.expect(result[1][1]).toBe("a")
		local aValues = result[1][2] :: {any}
		T.expect(#aValues).toBe(2)
		T.expect(aValues[1]).toBe(1)
		T.expect(aValues[2]).toBe(3)
		T.expect(result[2][1]).toBe("b")
		local bValues = result[2][2] :: {any}
		T.expect(#bValues).toBe(1)
		T.expect(bValues[1]).toBe(2)
	end)

	T.it("mergeBy", function()
		local items = { { "a", 1 }, { "b", 2 }, { "c", 3 } }
		local result = TU.mergeBy(items, function(item: any): string
			return (item :: {any})[1] :: string
		end, function(item: any): any
			return (item :: {any})[2]
		end)
		T.expect(#result).toBe(3)
		T.expect(result[1][1]).toBe("a")
		T.expect(result[1][2]).toBe(1)
		T.expect(result[2][1]).toBe("b")
		T.expect(result[2][2]).toBe(2)
		T.expect(result[3][1]).toBe("c")
		T.expect(result[3][2]).toBe(3)
	end)

	T.it("mapValues", function()
		local pairs = { { "x", 1 }, { "y", 2 } }
		local result = TU.mapValues(pairs, function(_k: string, v: any): any
			return (v :: number) * 10
		end)
		T.expect(result[1][1]).toBe("x")
		T.expect(result[1][2]).toBe(10)
		T.expect(result[2][1]).toBe("y")
		T.expect(result[2][2]).toBe(20)
	end)

	T.it("deepMerge", function()
		local a = { x = 1, nested = { a = 1 } }
		local b = { y = 2, nested = { b = 2 } }
		local result = TU.deepMerge({ a, b }) :: {[string]: any}
		T.expect(result.x).toBe(1)
		T.expect(result.y).toBe(2)
		local nested = result.nested :: {[string]: any}
		T.expect(nested.a).toBe(1)
		T.expect(nested.b).toBe(2)
	end)

	T.it("deepMerge overwrite", function()
		local a = { x = 1 }
		local b = { x = 2 }
		local result = TU.deepMerge({ a, b }) :: {[string]: any}
		T.expect(result.x).toBe(2)
	end)
end)
