--!strict
local process = require("@lune/process")

if #process.args < 1 then
	print(`Usage: lune run bin/main <values.json>`)
	print("  Transforms source table JSON to target table JSON.")
	print("  (Not yet implemented — see spec 3: transform-engine)")
	process.exit(1)
end

print("Transform not yet implemented. Run tests with: lune run test/test_main")
process.exit(1)
