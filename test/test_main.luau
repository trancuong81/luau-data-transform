--!strict
local T = require("@lib/test_runner")
require("@test/test_placeholder")
require("@test/test_protobuf_json")
require("@test/test_schema")
require("@test/test_json_path")
T.run()
