--!strict
local process = require("@lune/process")

-- State
type TestCase = { name: string, fn: () -> () }
type Suite = { name: string, tests: { TestCase } }
local suites: { Suite } = {}
local currentSuite: Suite? = nil

-- Registration
local function describe(name: string, fn: () -> ())
	local suite: Suite = { name = name, tests = {} }
	currentSuite = suite
	table.insert(suites, suite)
	fn()
	currentSuite = nil
end

local function it(name: string, fn: () -> ())
	assert(currentSuite ~= nil, "it() must be called inside describe()")
	table.insert((currentSuite :: Suite).tests, { name = name, fn = fn })
end

-- Deep equality
local function deepEqual(a: any, b: any): boolean
	if a == b then
		return true
	end
	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	end
	for k, v in a :: { [any]: any } do
		if not deepEqual(v, (b :: { [any]: any })[k]) then
			return false
		end
	end
	for k, _ in b :: { [any]: any } do
		if (a :: { [any]: any })[k] == nil then
			return false
		end
	end
	return true
end

local function formatValue(v: any): string
	if type(v) == "string" then
		return `"{v}"`
	elseif type(v) == "nil" then
		return "nil"
	else
		return tostring(v)
	end
end

-- Assertions
type Expectation = {
	toBe: (expected: any) -> (),
	toEqual: (expected: any) -> (),
	toBeNil: () -> (),
	toBeTruthy: () -> (),
}

local function expect(actual: any): Expectation
	local self: Expectation
	self = {
		toBe = function(expected: any)
			if actual ~= expected then
				error(`Expected {formatValue(expected)}, got {formatValue(actual)}`)
			end
		end,
		toEqual = function(expected: any)
			if not deepEqual(actual, expected) then
				error(`Expected {formatValue(expected)}, got {formatValue(actual)}`)
			end
		end,
		toBeNil = function()
			if actual ~= nil then
				error(`Expected nil, got {formatValue(actual)}`)
			end
		end,
		toBeTruthy = function()
			if not actual then
				error(`Expected truthy value, got {formatValue(actual)}`)
			end
		end,
	}
	return self
end

-- Runner
local function run()
	local passed = 0
	local failed = 0

	for _, suite in suites do
		print(`[{suite.name}]`)
		for _, test in suite.tests do
			local ok, err = pcall(test.fn)
			if ok then
				print(`  PASS {test.name}`)
				passed += 1
			else
				print(`  FAIL {test.name}`)
				print(`    {err}`)
				failed += 1
			end
		end
		print("")
	end

	local total = passed + failed
	print(`Results: {passed}/{total} passed, {failed} failed`)

	if failed > 0 then
		process.exit(1)
	end
end

return {
	describe = describe,
	it = it,
	expect = expect,
	run = run,
}
