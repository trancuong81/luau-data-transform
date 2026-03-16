# Protobuf Binary Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement pure-Luau protobuf binary wire format encoding and decoding for all message types, with 5 binary round-trip tests.

**Architecture:** Four modules in `lib/pb/`: `wire.luau` (primitives), `encoder.luau` (type-specific encode), `decoder.luau` (type-specific decode), `schema_registry.luau` (dispatch). Each message type gets paired `encodePb*/decodePb*` functions mirroring the existing `encodeJson*/decodeJson*` pattern.

**Tech Stack:** Luau (--!strict), Lune runtime, `buffer` library, `bit32`, existing test runner (`lib/test_runner.luau`)

**Spec:** `docs/specs/2026-03-17-protobuf-binary-design.md`

---

## Chunk 1: Wire Primitives and Simple Type Round-Trips

### Task 1: Wire Format Primitives (`lib/pb/wire.luau`)

**Files:**
- Create: `lib/pb/wire.luau`
- Create: `test/test_wire.luau`
- Modify: `test/test_main.luau`

**Depends on:** None — parallelizable

- [ ] **Step 1: Write failing wire primitive tests**

Create `test/test_wire.luau`:

```luau
--!strict
local T = require("@lib/test_runner")
local Wire = require("@lib/pb/wire")

T.describe("wire primitives", function()
	T.it("varint roundtrip small value", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeVarint(wb, 150)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeVarint(buf, 0)
		T.expect(val).toBe(150)
		T.expect(offset).toBe(2) -- 150 needs 2 bytes
	end)

	T.it("varint roundtrip zero", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeVarint(wb, 0)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeVarint(buf, 0)
		T.expect(val).toBe(0)
		T.expect(offset).toBe(1)
	end)

	T.it("varint roundtrip max 32-bit", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeVarint(wb, 0xFFFFFFFF)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeVarint(buf, 0)
		T.expect(val).toBe(0xFFFFFFFF)
	end)

	T.it("tag roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeTag(wb, 4, Wire.LENGTH_DELIMITED)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local fieldNum, wireType, offset = Wire.decodeTag(buf, 0)
		T.expect(fieldNum).toBe(4)
		T.expect(wireType).toBe(Wire.LENGTH_DELIMITED)
	end)

	T.it("string roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeString(wb, "hello world")
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeString(buf, 0)
		T.expect(val).toBe("hello world")
	end)

	T.it("double roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeDouble(wb, 3.14159)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeDouble(buf, 0)
		T.expect(val).toBe(3.14159)
	end)

	T.it("bool roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeBool(wb, true)
		Wire.encodeBool(wb, false)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val1, off1 = Wire.decodeBool(buf, 0)
		local val2, off2 = Wire.decodeBool(buf, off1)
		T.expect(val1).toBe(true)
		T.expect(val2).toBe(false)
	end)

	T.it("int32 roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeInt32(wb, 42)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeInt32(buf, 0)
		T.expect(val).toBe(42)
	end)

	T.it("WriteBuf auto-grows", function()
		local wb = Wire.WriteBuf.new(4) -- start tiny
		Wire.encodeString(wb, "this string is longer than 4 bytes")
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeString(buf, 0)
		T.expect(val).toBe("this string is longer than 4 bytes")
	end)

	T.it("skipField skips varint", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeVarint(wb, 12345)
		Wire.encodeString(wb, "after")
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local offset = Wire.skipField(buf, 0, Wire.VARINT)
		local val, _ = Wire.decodeString(buf, offset)
		T.expect(val).toBe("after")
	end)

	T.it("skipField skips length-delimited", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeString(wb, "skip me")
		Wire.encodeString(wb, "keep me")
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local offset = Wire.skipField(buf, 0, Wire.LENGTH_DELIMITED)
		local val, _ = Wire.decodeString(buf, offset)
		T.expect(val).toBe("keep me")
	end)

	T.it("skipField skips 64-bit", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeDouble(wb, 99.99)
		Wire.encodeVarint(wb, 7)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local offset = Wire.skipField(buf, 0, Wire.FIXED64)
		local val, _ = Wire.decodeVarint(buf, offset)
		T.expect(val).toBe(7)
	end)

	T.it("fixed32 roundtrip", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeFixed32(wb, 12345)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeFixed32(buf, 0)
		T.expect(val).toBe(12345)
		T.expect(offset).toBe(4)
	end)

	T.it("int32 roundtrip negative", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeInt32(wb, -1)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local val, offset = Wire.decodeInt32(buf, 0)
		T.expect(val).toBe(-1)
	end)

	T.it("skipField skips 32-bit", function()
		local wb = Wire.WriteBuf.new()
		Wire.encodeFixed32(wb, 42)
		Wire.encodeVarint(wb, 99)
		local bytes = wb:tostring()
		local buf = buffer.fromstring(bytes)
		local offset = Wire.skipField(buf, 0, Wire.FIXED32)
		local val, _ = Wire.decodeVarint(buf, offset)
		T.expect(val).toBe(99)
	end)
end)
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `lune run test/test_main`
Expected: FAIL (module `@lib/pb/wire` not found)

- [ ] **Step 3: Implement `lib/pb/wire.luau`**

```luau
--!strict

local Wire = {}

-- Wire type constants
Wire.VARINT = 0
Wire.FIXED64 = 1
Wire.LENGTH_DELIMITED = 2
Wire.FIXED32 = 5

-- ============================================================
-- WriteBuf: growable buffer for encoding
-- ============================================================

type WriteBufImpl = {
	buf: buffer,
	pos: number,
}

export type WriteBuf = typeof(setmetatable({} :: WriteBufImpl, {} :: { __index: any }))

local WriteBufMethods = {}
WriteBufMethods.__index = WriteBufMethods

function WriteBufMethods.ensure(self: WriteBufImpl, bytes: number)
	local needed = self.pos + bytes
	local size = buffer.len(self.buf)
	if needed <= size then
		return
	end
	local newSize = size
	while newSize < needed do
		newSize = newSize * 2
	end
	local newBuf = buffer.create(newSize)
	buffer.copy(newBuf, 0, self.buf, 0, self.pos)
	self.buf = newBuf
end

function WriteBufMethods.tostring(self: WriteBufImpl): string
	return buffer.tostring(self.buf, 0, self.pos)
end

Wire.WriteBuf = {}
Wire.WriteBuf.__index = WriteBufMethods

function Wire.WriteBuf.new(initialSize: number?): WriteBuf
	local size = initialSize or 256
	local self: WriteBufImpl = {
		buf = buffer.create(size),
		pos = 0,
	}
	return setmetatable(self, WriteBufMethods) :: any
end

-- ============================================================
-- Encoding functions
-- ============================================================

function Wire.encodeVarint(wb: WriteBuf, value: number)
	local impl = wb :: any :: WriteBufImpl
	impl:ensure(5) -- max 5 bytes for 32-bit varint
	-- Handle as unsigned 32-bit
	local v = if value < 0 then value + 0x100000000 else value
	while v >= 0x80 do
		buffer.writeu8(impl.buf, impl.pos, bit32.bor(bit32.band(v, 0x7F), 0x80))
		impl.pos += 1
		v = bit32.rshift(v, 7)
	end
	buffer.writeu8(impl.buf, impl.pos, v)
	impl.pos += 1
end

function Wire.encodeTag(wb: WriteBuf, fieldNumber: number, wireType: number)
	Wire.encodeVarint(wb, bit32.bor(bit32.lshift(fieldNumber, 3), wireType))
end

function Wire.encodeString(wb: WriteBuf, str: string)
	local impl = wb :: any :: WriteBufImpl
	local len = #str
	Wire.encodeVarint(wb, len)
	impl:ensure(len)
	buffer.writestring(impl.buf, impl.pos, str)
	impl.pos += len
end

function Wire.encodeDouble(wb: WriteBuf, value: number)
	local impl = wb :: any :: WriteBufImpl
	impl:ensure(8)
	buffer.writef64(impl.buf, impl.pos, value)
	impl.pos += 8
end

function Wire.encodeFixed32(wb: WriteBuf, value: number)
	local impl = wb :: any :: WriteBufImpl
	impl:ensure(4)
	buffer.writeu32(impl.buf, impl.pos, value)
	impl.pos += 4
end

function Wire.encodeBool(wb: WriteBuf, value: boolean)
	Wire.encodeVarint(wb, if value then 1 else 0)
end

function Wire.encodeInt32(wb: WriteBuf, value: number)
	Wire.encodeVarint(wb, value)
end

-- Encode raw bytes (for nested messages)
function Wire.encodeBytes(wb: WriteBuf, bytes: string)
	Wire.encodeString(wb, bytes) -- same format: length-prefixed
end

-- ============================================================
-- Decoding functions
-- ============================================================

function Wire.decodeVarint(buf: buffer, offset: number): (number, number)
	local result = 0
	local shift = 0
	local pos = offset
	while true do
		if pos >= buffer.len(buf) then
			error("unexpected end of buffer reading varint")
		end
		local b = buffer.readu8(buf, pos)
		pos += 1
		result = bit32.bor(result, bit32.lshift(bit32.band(b, 0x7F), shift))
		if bit32.band(b, 0x80) == 0 then
			break
		end
		shift += 7
		if shift >= 35 then
			error("varint too long (>5 bytes for 32-bit)")
		end
	end
	return result, pos
end

function Wire.decodeTag(buf: buffer, offset: number): (number, number, number)
	local tag, newOffset = Wire.decodeVarint(buf, offset)
	local fieldNumber = bit32.rshift(tag, 3)
	local wireType = bit32.band(tag, 0x07)
	return fieldNumber, wireType, newOffset
end

function Wire.decodeString(buf: buffer, offset: number): (string, number)
	local len, pos = Wire.decodeVarint(buf, offset)
	if pos + len > buffer.len(buf) then
		error("unexpected end of buffer reading string")
	end
	local str = buffer.readstring(buf, pos, len)
	return str, pos + len
end

function Wire.decodeDouble(buf: buffer, offset: number): (number, number)
	if offset + 8 > buffer.len(buf) then
		error("unexpected end of buffer reading double")
	end
	return buffer.readf64(buf, offset), offset + 8
end

function Wire.decodeFixed32(buf: buffer, offset: number): (number, number)
	if offset + 4 > buffer.len(buf) then
		error("unexpected end of buffer reading fixed32")
	end
	return buffer.readu32(buf, offset), offset + 4
end

function Wire.decodeBool(buf: buffer, offset: number): (boolean, number)
	local val, newOffset = Wire.decodeVarint(buf, offset)
	return val ~= 0, newOffset
end

function Wire.decodeInt32(buf: buffer, offset: number): (number, number)
	local val, newOffset = Wire.decodeVarint(buf, offset)
	-- Convert unsigned to signed 32-bit
	if val >= 0x80000000 then
		val = val - 0x100000000
	end
	return val, newOffset
end

function Wire.skipField(buf: buffer, offset: number, wireType: number): number
	if wireType == Wire.VARINT then
		local _, newOffset = Wire.decodeVarint(buf, offset)
		return newOffset
	elseif wireType == Wire.FIXED64 then
		return offset + 8
	elseif wireType == Wire.LENGTH_DELIMITED then
		local len, pos = Wire.decodeVarint(buf, offset)
		return pos + len
	elseif wireType == Wire.FIXED32 then
		return offset + 4
	else
		error(`unknown wire type: {wireType}`)
	end
end

return Wire
```

- [ ] **Step 4: Add wire test to test_main.luau**

Modify `test/test_main.luau` — add `require("@test/test_wire")` before `T.run()`.

- [ ] **Step 5: Run tests to verify wire primitives pass**

Run: `lune run test/test_main`
Expected: All wire primitive tests PASS (+ existing 9 tests still pass)

- [ ] **Step 6: Commit**

```bash
git add lib/pb/wire.luau test/test_wire.luau test/test_main.luau
git commit -m "feat: add protobuf wire format primitives with WriteBuf and 15 unit tests"
```

---

### Task 2: Simple Type Encoders/Decoders + Round-Trip Tests 1 & 2

**Files:**
- Create: `lib/pb/encoder.luau`
- Create: `lib/pb/decoder.luau`
- Create: `test/test_protobuf_binary.luau`
- Modify: `test/test_main.luau`

**Depends on:** Task 1

- [ ] **Step 1: Write failing round-trip tests for StringType and MultipleCheckboxType**

Create `test/test_protobuf_binary.luau`:

```luau
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
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `lune run test/test_main`
Expected: FAIL (module `@lib/pb/encoder` not found)

- [ ] **Step 3: Implement encoder.luau with all 6 simple type encoders**

Create `lib/pb/encoder.luau`. The encoder needs:
- All 6 simple type encode functions
- A public `encode(messageType, data)` dispatch (will be extended in later tasks)
- Helper for encoding nested messages (encode to temp WriteBuf, then write as length-delimited)

```luau
--!strict
local Wire = require("@lib/pb/wire")
local DataTypes = require("@lib/data_types")

local Encoder = {}

-- Helper: encode a nested message. Encodes via fn into a temp WriteBuf,
-- then writes the result as length-delimited bytes into the parent WriteBuf.
local function encodeNested(wb: Wire.WriteBuf, fieldNumber: number, encodeFn: (Wire.WriteBuf) -> ())
	local inner = Wire.WriteBuf.new()
	encodeFn(inner)
	local bytes = inner:tostring()
	if #bytes > 0 then
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeBytes(wb, bytes)
	end
end

-- Helper: encode a string field (skip if empty — proto3 default)
local function encodeStringField(wb: Wire.WriteBuf, fieldNumber: number, value: string)
	if value ~= "" then
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeString(wb, value)
	end
end

-- Helper: encode an optional string field (skip if nil)
local function encodeOptionalStringField(wb: Wire.WriteBuf, fieldNumber: number, value: string?)
	if value ~= nil and value ~= "" then
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeString(wb, value)
	end
end

-- Helper: encode a repeated string field
local function encodeRepeatedStringField(wb: Wire.WriteBuf, fieldNumber: number, values: {string})
	for _, v in values do
		Wire.encodeTag(wb, fieldNumber, Wire.LENGTH_DELIMITED)
		Wire.encodeString(wb, v)
	end
end

-- Helper: encode a double field (skip if 0 — proto3 default)
local function encodeDoubleField(wb: Wire.WriteBuf, fieldNumber: number, value: number)
	if value ~= 0 then
		Wire.encodeTag(wb, fieldNumber, Wire.FIXED64)
		Wire.encodeDouble(wb, value)
	end
end

-- Helper: encode an optional double field (skip if nil)
local function encodeOptionalDoubleField(wb: Wire.WriteBuf, fieldNumber: number, value: number?)
	if value ~= nil and value ~= 0 then
		Wire.encodeTag(wb, fieldNumber, Wire.FIXED64)
		Wire.encodeDouble(wb, value)
	end
end

-- Helper: encode an int32 field (skip if 0 — proto3 default)
local function encodeInt32Field(wb: Wire.WriteBuf, fieldNumber: number, value: number)
	if value ~= 0 then
		Wire.encodeTag(wb, fieldNumber, Wire.VARINT)
		Wire.encodeInt32(wb, value)
	end
end

-- Helper: encode a bool field (skip if false — proto3 default)
local function encodeBoolField(wb: Wire.WriteBuf, fieldNumber: number, value: boolean)
	if value then
		Wire.encodeTag(wb, fieldNumber, Wire.VARINT)
		Wire.encodeBool(wb, value)
	end
end

-- ============================================================
-- Simple type encoders
-- ============================================================

-- StringType: 1=typeId, 2=value, 3=regex, 4=formatPatterns(repeated)
local function encodePbStringTypeInner(wb: Wire.WriteBuf, st: DataTypes.StringType)
	encodeStringField(wb, 1, st.typeId)
	encodeStringField(wb, 2, st.value)
	encodeOptionalStringField(wb, 3, st.regex)
	encodeRepeatedStringField(wb, 4, st.formatPatterns)
end

function Encoder.encodePbStringType(st: DataTypes.StringType): string
	local wb = Wire.WriteBuf.new()
	encodePbStringTypeInner(wb, st)
	return wb:tostring()
end

-- NumberType: 1=typeId, 2=value(double), 3=decimalPlaces(varint), 4=minValue(double), 5=maxValue(double)
local function encodePbNumberTypeInner(wb: Wire.WriteBuf, nt: DataTypes.NumberType)
	encodeStringField(wb, 1, nt.typeId)
	encodeDoubleField(wb, 2, nt.value)
	encodeInt32Field(wb, 3, nt.decimalPlaces)
	encodeOptionalDoubleField(wb, 4, nt.minValue)
	encodeOptionalDoubleField(wb, 5, nt.maxValue)
end

function Encoder.encodePbNumberType(nt: DataTypes.NumberType): string
	local wb = Wire.WriteBuf.new()
	encodePbNumberTypeInner(wb, nt)
	return wb:tostring()
end

-- BooleanType: 1=typeId, 2=value(bool)
local function encodePbBooleanTypeInner(wb: Wire.WriteBuf, bt: DataTypes.BooleanType)
	encodeStringField(wb, 1, bt.typeId)
	encodeBoolField(wb, 2, bt.value)
end

function Encoder.encodePbBooleanType(bt: DataTypes.BooleanType): string
	local wb = Wire.WriteBuf.new()
	encodePbBooleanTypeInner(wb, bt)
	return wb:tostring()
end

-- EnumType: 1=typeId, 2=value, 3=options(repeated)
local function encodePbEnumTypeInner(wb: Wire.WriteBuf, et: DataTypes.EnumType)
	encodeStringField(wb, 1, et.typeId)
	encodeStringField(wb, 2, et.value)
	encodeRepeatedStringField(wb, 3, et.options)
end

function Encoder.encodePbEnumType(et: DataTypes.EnumType): string
	local wb = Wire.WriteBuf.new()
	encodePbEnumTypeInner(wb, et)
	return wb:tostring()
end

-- MultipleCheckboxType: 1=typeId, 2=selectedKeys(repeated), 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)
local function encodePbMultipleCheckboxTypeInner(wb: Wire.WriteBuf, mc: DataTypes.MultipleCheckboxType)
	encodeStringField(wb, 1, mc.typeId)
	encodeRepeatedStringField(wb, 2, mc.selectedKeys)
	encodeRepeatedStringField(wb, 3, mc.allOptionKeysInOrder)
	encodeRepeatedStringField(wb, 4, mc.allOptionLabelsInOrder)
end

function Encoder.encodePbMultipleCheckboxType(mc: DataTypes.MultipleCheckboxType): string
	local wb = Wire.WriteBuf.new()
	encodePbMultipleCheckboxTypeInner(wb, mc)
	return wb:tostring()
end

-- RadioGroupType: 1=typeId, 2=selectedKey, 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)
local function encodePbRadioGroupTypeInner(wb: Wire.WriteBuf, rg: DataTypes.RadioGroupType)
	encodeStringField(wb, 1, rg.typeId)
	encodeStringField(wb, 2, rg.selectedKey)
	encodeRepeatedStringField(wb, 3, rg.allOptionKeysInOrder)
	encodeRepeatedStringField(wb, 4, rg.allOptionLabelsInOrder)
end

function Encoder.encodePbRadioGroupType(rg: DataTypes.RadioGroupType): string
	local wb = Wire.WriteBuf.new()
	encodePbRadioGroupTypeInner(wb, rg)
	return wb:tostring()
end

-- Export inner encoders for use by compound/union encoders in later tasks
Encoder._inner = {
	encodePbStringType = encodePbStringTypeInner,
	encodePbNumberType = encodePbNumberTypeInner,
	encodePbBooleanType = encodePbBooleanTypeInner,
	encodePbEnumType = encodePbEnumTypeInner,
	encodePbMultipleCheckboxType = encodePbMultipleCheckboxTypeInner,
	encodePbRadioGroupType = encodePbRadioGroupTypeInner,
	encodeNested = encodeNested,
	encodeStringField = encodeStringField,
	encodeOptionalStringField = encodeOptionalStringField,
	encodeRepeatedStringField = encodeRepeatedStringField,
	encodeDoubleField = encodeDoubleField,
	encodeOptionalDoubleField = encodeOptionalDoubleField,
	encodeInt32Field = encodeInt32Field,
	encodeBoolField = encodeBoolField,
}

return Encoder
```

- [ ] **Step 4: Implement decoder.luau with all 6 simple type decoders**

Create `lib/pb/decoder.luau`:

```luau
--!strict
local Wire = require("@lib/pb/wire")
local DataTypes = require("@lib/data_types")

local Decoder = {}

-- Helper: decode a nested message from length-delimited bytes
local function decodeNestedBytes(buf: buffer, offset: number): (buffer, number, number, number)
	local len, pos = Wire.decodeVarint(buf, offset)
	local endPos = pos + len
	return buf, pos, endPos, endPos
end

-- ============================================================
-- Simple type decoders
-- ============================================================

-- StringType: 1=typeId, 2=value, 3=regex, 4=formatPatterns(repeated)
local function decodePbStringTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.StringType
	local result = DataTypes.makeStringType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.value, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			result.regex, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.formatPatterns, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbStringType(bytes: string): DataTypes.StringType
	local buf = buffer.fromstring(bytes)
	return decodePbStringTypeFromBuf(buf, 0, buffer.len(buf))
end

-- NumberType: 1=typeId, 2=value(double), 3=decimalPlaces(varint), 4=minValue(double), 5=maxValue(double)
local function decodePbNumberTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.NumberType
	local result = DataTypes.makeNumberType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.FIXED64 then
			result.value, offset = Wire.decodeDouble(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.VARINT then
			result.decimalPlaces, offset = Wire.decodeInt32(buf, offset)
		elseif fieldNum == 4 and wireType == Wire.FIXED64 then
			result.minValue, offset = Wire.decodeDouble(buf, offset)
		elseif fieldNum == 5 and wireType == Wire.FIXED64 then
			result.maxValue, offset = Wire.decodeDouble(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbNumberType(bytes: string): DataTypes.NumberType
	local buf = buffer.fromstring(bytes)
	return decodePbNumberTypeFromBuf(buf, 0, buffer.len(buf))
end

-- BooleanType: 1=typeId, 2=value(bool)
local function decodePbBooleanTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.BooleanType
	local result = DataTypes.makeBooleanType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.VARINT then
			result.value, offset = Wire.decodeBool(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbBooleanType(bytes: string): DataTypes.BooleanType
	local buf = buffer.fromstring(bytes)
	return decodePbBooleanTypeFromBuf(buf, 0, buffer.len(buf))
end

-- EnumType: 1=typeId, 2=value, 3=options(repeated)
local function decodePbEnumTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.EnumType
	local result = DataTypes.makeEnumType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.value, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.options, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbEnumType(bytes: string): DataTypes.EnumType
	local buf = buffer.fromstring(bytes)
	return decodePbEnumTypeFromBuf(buf, 0, buffer.len(buf))
end

-- MultipleCheckboxType: 1=typeId, 2=selectedKeys(repeated), 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)
local function decodePbMultipleCheckboxTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.MultipleCheckboxType
	local result = DataTypes.makeMultipleCheckboxType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.selectedKeys, val)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionLabelsInOrder, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbMultipleCheckboxType(bytes: string): DataTypes.MultipleCheckboxType
	local buf = buffer.fromstring(bytes)
	return decodePbMultipleCheckboxTypeFromBuf(buf, 0, buffer.len(buf))
end

-- RadioGroupType: 1=typeId, 2=selectedKey, 3=allOptionKeysInOrder(repeated), 4=allOptionLabelsInOrder(repeated)
local function decodePbRadioGroupTypeFromBuf(buf: buffer, startOffset: number, endOffset: number): DataTypes.RadioGroupType
	local result = DataTypes.makeRadioGroupType()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			result.typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			result.selectedKey, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(result.allOptionLabelsInOrder, val)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

function Decoder.decodePbRadioGroupType(bytes: string): DataTypes.RadioGroupType
	local buf = buffer.fromstring(bytes)
	return decodePbRadioGroupTypeFromBuf(buf, 0, buffer.len(buf))
end

-- Export inner decoders for use by compound/union decoders in later tasks
Decoder._inner = {
	decodePbStringType = decodePbStringTypeFromBuf,
	decodePbNumberType = decodePbNumberTypeFromBuf,
	decodePbBooleanType = decodePbBooleanTypeFromBuf,
	decodePbEnumType = decodePbEnumTypeFromBuf,
	decodePbMultipleCheckboxType = decodePbMultipleCheckboxTypeFromBuf,
	decodePbRadioGroupType = decodePbRadioGroupTypeFromBuf,
	decodeNestedBytes = decodeNestedBytes,
}

return Decoder
```

- [ ] **Step 5: Add test file to test_main.luau**

Modify `test/test_main.luau` — add `require("@test/test_protobuf_binary")` before `T.run()`.

- [ ] **Step 6: Run tests to verify round-trips pass**

Run: `lune run test/test_main`
Expected: StringType and MultipleCheckboxType binary round-trip tests PASS (+ all previous tests)

- [ ] **Step 7: Commit**

```bash
git add lib/pb/encoder.luau lib/pb/decoder.luau test/test_protobuf_binary.luau test/test_main.luau
git commit -m "feat: add simple type protobuf encode/decode with StringType and MultipleCheckboxType round-trip tests"
```

---

## Chunk 2: Compound Types, Oneof, Maps, and Remaining Tests

### Task 3: Compound Type Encoders/Decoders + AddressType Round-Trip Test

**Files:**
- Modify: `lib/pb/encoder.luau`
- Modify: `lib/pb/decoder.luau`
- Modify: `test/test_protobuf_binary.luau`

**Depends on:** Task 2

This task adds all 15 compound types (SubFields + wrapper). The key pattern: all wrappers share the same structure (1=typeId, 2=valueSubFields as nested, 3=subFieldKeysInOrder as repeated, 4=label). A shared helper reduces each wrapper to a one-liner.

- [ ] **Step 1: Add AddressType round-trip test**

Add to `test/test_protobuf_binary.luau` inside the existing `describe` block:

```luau
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
```

- [ ] **Step 2: Run tests to verify AddressType test fails**

Run: `lune run test/test_main`
Expected: FAIL (`encodePbAddressType` not found on Encoder)

- [ ] **Step 3: Add compound type encoder helpers and all 15 SubFields + wrapper encoders to encoder.luau**

Add to `lib/pb/encoder.luau` after the simple type encoders:

The compound wrapper helper:

```luau
-- Shared compound wrapper encoder: 1=typeId, 2=valueSubFields(nested), 3=subFieldKeysInOrder(repeated), 4=label
local function encodeCompoundWrapper(wb: Wire.WriteBuf, typeId: string, valueSubFields: any, subFieldKeysInOrder: {string}, label: string?, subFieldsEncoderFn: (Wire.WriteBuf, any) -> ())
	encodeStringField(wb, 1, typeId)
	if valueSubFields ~= nil then
		encodeNested(wb, 2, function(inner)
			subFieldsEncoderFn(inner, valueSubFields)
		end)
	end
	encodeRepeatedStringField(wb, 3, subFieldKeysInOrder)
	encodeOptionalStringField(wb, 4, label)
end
```

Then for each compound type, add SubFields encoder + wrapper. Example for AddressType:

```luau
-- AddressSubFields: 1=numberAndStreet, 2=city, 3=stateProvince, 4=country, 5=postalZipCode, 6=fullAddress (all StringType)
local function encodePbAddressSubFieldsInner(wb: Wire.WriteBuf, sf: DataTypes.AddressSubFields)
	if sf.numberAndStreet then encodeNested(wb, 1, function(inner) encodePbStringTypeInner(inner, sf.numberAndStreet :: DataTypes.StringType) end) end
	if sf.city then encodeNested(wb, 2, function(inner) encodePbStringTypeInner(inner, sf.city :: DataTypes.StringType) end) end
	if sf.stateProvince then encodeNested(wb, 3, function(inner) encodePbStringTypeInner(inner, sf.stateProvince :: DataTypes.StringType) end) end
	if sf.country then encodeNested(wb, 4, function(inner) encodePbStringTypeInner(inner, sf.country :: DataTypes.StringType) end) end
	if sf.postalZipCode then encodeNested(wb, 5, function(inner) encodePbStringTypeInner(inner, sf.postalZipCode :: DataTypes.StringType) end) end
	if sf.fullAddress then encodeNested(wb, 6, function(inner) encodePbStringTypeInner(inner, sf.fullAddress :: DataTypes.StringType) end) end
end

local function encodePbAddressTypeInner(wb: Wire.WriteBuf, at: DataTypes.AddressType)
	encodeCompoundWrapper(wb, at.typeId, at.valueSubFields, at.subFieldKeysInOrder, at.label, encodePbAddressSubFieldsInner)
end

function Encoder.encodePbAddressType(at: DataTypes.AddressType): string
	local wb = Wire.WriteBuf.new()
	encodePbAddressTypeInner(wb, at)
	return wb:tostring()
end
```

Follow this exact pattern for all 15 compound types. Each SubFields encoder encodes its specific fields at the proto field numbers from `data_types.proto`:

| Compound | SubFields | Field spec |
|----------|-----------|------------|
| PhoneFax | 1=countryCode(ST), 2=areaCode(ST), 3=subscriberNumber(ST) | All StringType nested |
| DateTime | 1=epochMs(NT), 2=zoneOffset(ST) | NumberType + StringType |
| Money | 1=amount(NT), 2=isoCurrencyCode(ST) | NumberType + StringType |
| Address | 1-6 all StringType | See above |
| IndividualName | 1-8 all StringType | prefixName through jobTitle |
| Country | 1=countryName(ST), 2=isoCountryCode(ST) | |
| BaseContact | 1-11 all StringType | prefixName through fax |
| SubmissionContact | 1-11 StringType, **12=typeOfCorrespondences(MCT), 13=contactTypes(MCT), 14=contactRoles(MCT)**, 15-34 StringType | Largest: 34 subfields. Fields 12-14 use `encodePbMultipleCheckboxTypeInner`, not StringType! |
| Signatory | 1-12 all StringType | |
| BankInfo | 1-4 all StringType | |
| BankAccountInfo | 1-10 all StringType | |
| WireInstructions | 1-11 all StringType | |
| BrokerageFirm | 1-2 all StringType | |
| BrokerageAccount | 1-12 all StringType | |
| ServiceContactPoint | 1-4 all StringType | |

Export all inner encoders via `Encoder._inner` for use by oneof dispatch in Task 4.

- [ ] **Step 4: Add compound type decoder helpers and all 15 SubFields + wrapper decoders to decoder.luau**

Add to `lib/pb/decoder.luau`. Same pattern as encoder — shared wrapper decoder + per-type SubFields decoder.

Compound wrapper decoder pattern:
```luau
local function decodeCompoundWrapper(buf, startOffset, endOffset, subFieldsDecoderFn)
	local typeId = ""
	local valueSubFields = nil
	local subFieldKeysInOrder: {string} = {}
	local label: string? = nil
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			valueSubFields = subFieldsDecoderFn(buf, offset, offset + len)
			offset = offset + len
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(subFieldKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return typeId, valueSubFields, subFieldKeysInOrder, label
end
```

Example for AddressType:
```luau
local function decodePbAddressSubFieldsFromBuf(buf, startOffset, endOffset)
	local result = DataTypes.makeAddressSubFields()
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 6 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local decoded = decodePbStringTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
			if fieldNum == 1 then result.numberAndStreet = decoded
			elseif fieldNum == 2 then result.city = decoded
			elseif fieldNum == 3 then result.stateProvince = decoded
			elseif fieldNum == 4 then result.country = decoded
			elseif fieldNum == 5 then result.postalZipCode = decoded
			elseif fieldNum == 6 then result.fullAddress = decoded
			end
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return result
end

local function decodePbAddressTypeFromBuf(buf, startOffset, endOffset)
	local typeId, subFields, keysInOrder, label = decodeCompoundWrapper(buf, startOffset, endOffset, decodePbAddressSubFieldsFromBuf)
	return DataTypes.makeAddressType({
		typeId = typeId,
		valueSubFields = subFields,
		subFieldKeysInOrder = keysInOrder,
		label = label,
	})
end

function Decoder.decodePbAddressType(bytes: string): DataTypes.AddressType
	local buf = buffer.fromstring(bytes)
	return decodePbAddressTypeFromBuf(buf, 0, buffer.len(buf))
end
```

Follow this pattern for all 15 compounds. Export all inner decoders via `Decoder._inner`.

- [ ] **Step 5: Run tests**

Run: `lune run test/test_main`
Expected: AddressType round-trip test PASS (+ all previous)

- [ ] **Step 6: Commit**

```bash
git add lib/pb/encoder.luau lib/pb/decoder.luau test/test_protobuf_binary.luau
git commit -m "feat: add compound type protobuf encode/decode (15 types) with AddressType round-trip test"
```

---

### Task 4: Oneof Dispatch + Map Encoding + TableSchema Round-Trip Test

**Files:**
- Modify: `lib/pb/encoder.luau`
- Modify: `lib/pb/decoder.luau`
- Modify: `test/test_protobuf_binary.luau`

**Depends on:** Task 3

This task adds `NonCustomFieldValue`, `CustomCompoundType`, `SingleFieldType`, `FieldGroup`, and `TableSchema` — the most complex encoding (oneof + maps).

- [ ] **Step 1: Add TableSchema round-trip test**

Add to `test/test_protobuf_binary.luau`:

```luau
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
		-- Verify map entries
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
```

- [ ] **Step 2: Run tests to verify it fails**

Run: `lune run test/test_main`
Expected: FAIL (`encodePbTableSchema` not found)

- [ ] **Step 3: Add typeId-to-field-number mapping and oneof encoder to encoder.luau**

Add the mapping table and `encodePbNonCustomFieldValue`, `encodePbSingleFieldType` functions:

```luau
-- typeId → (oneof field number, inner encoder function)
-- Reuses the same typeId groupings as data_types.luau dispatch tables
local TYPEID_TO_ONEOF: {[string]: {fieldNum: number, encode: (Wire.WriteBuf, any) -> ()}} = {}

-- Populate for StringType typeIds (field 1)
for _, id in {"String", "Ssn", "Ein", "Aba", "Itin", "Swift", "Iban", "Giin", "UsZip", "Email", "PhoneFaxString", "IsoCountryCode", "IsoCurrencyCode", "CountryString", "StateProvince", "City", "NumberAndStreet", "PostalZipCode", "MoneyString", "DateTimeString", "TimeZoneOffset"} do
	TYPEID_TO_ONEOF[id] = { fieldNum = 1, encode = encodePbStringTypeInner }
end
-- NumberType typeIds (field 2)
for _, id in {"Integer", "Float", "Percentage", "Year"} do
	TYPEID_TO_ONEOF[id] = { fieldNum = 2, encode = encodePbNumberTypeInner }
end
-- BooleanType (field 3)
TYPEID_TO_ONEOF["Boolean"] = { fieldNum = 3, encode = encodePbBooleanTypeInner }
-- EnumType typeIds (field 4)
for _, id in {"ShareClass", "TransactionType", "SubscriptionStatus"} do
	TYPEID_TO_ONEOF[id] = { fieldNum = 4, encode = encodePbEnumTypeInner }
end
-- SingleType typeIds (fields 5-6)
TYPEID_TO_ONEOF["MultipleCheckbox"] = { fieldNum = 5, encode = encodePbMultipleCheckboxTypeInner }
TYPEID_TO_ONEOF["RadioGroup"] = { fieldNum = 6, encode = encodePbRadioGroupTypeInner }
-- Compound typeIds (fields 7-21) — reference the compound inner encoders added in Task 3
TYPEID_TO_ONEOF["PhoneFax"] = { fieldNum = 7, encode = encodePbPhoneFaxTypeInner }
TYPEID_TO_ONEOF["DateTime"] = { fieldNum = 8, encode = encodePbDateTimeTypeInner }
TYPEID_TO_ONEOF["Money"] = { fieldNum = 9, encode = encodePbMoneyTypeInner }
TYPEID_TO_ONEOF["Address"] = { fieldNum = 10, encode = encodePbAddressTypeInner }
TYPEID_TO_ONEOF["IndividualName"] = { fieldNum = 11, encode = encodePbIndividualNameTypeInner }
TYPEID_TO_ONEOF["Country"] = { fieldNum = 12, encode = encodePbCountryTypeInner }
TYPEID_TO_ONEOF["BaseContact"] = { fieldNum = 13, encode = encodePbBaseContactTypeInner }
TYPEID_TO_ONEOF["SubmissionContact"] = { fieldNum = 14, encode = encodePbSubmissionContactTypeInner }
TYPEID_TO_ONEOF["Signatory"] = { fieldNum = 15, encode = encodePbSignatoryTypeInner }
TYPEID_TO_ONEOF["BankInfo"] = { fieldNum = 16, encode = encodePbBankInfoTypeInner }
TYPEID_TO_ONEOF["BankAccountInfo"] = { fieldNum = 17, encode = encodePbBankAccountInfoTypeInner }
TYPEID_TO_ONEOF["WireInstructions"] = { fieldNum = 18, encode = encodePbWireInstructionsTypeInner }
TYPEID_TO_ONEOF["BrokerageFirm"] = { fieldNum = 19, encode = encodePbBrokerageFirmTypeInner }
TYPEID_TO_ONEOF["BrokerageAccount"] = { fieldNum = 20, encode = encodePbBrokerageAccountTypeInner }
TYPEID_TO_ONEOF["ServiceContactPoint"] = { fieldNum = 21, encode = encodePbServiceContactPointTypeInner }
```

Then the oneof encoders:

```luau
-- NonCustomFieldValue: oneof with fields 1-21
local function encodePbNonCustomFieldValueInner(wb: Wire.WriteBuf, value: any)
	local typeId = value.typeId :: string
	local mapping = TYPEID_TO_ONEOF[typeId]
	if mapping == nil then
		error(`unknown typeId for NonCustomFieldValue: {typeId}`)
	end
	encodeNested(wb, mapping.fieldNum, function(inner)
		mapping.encode(inner, value)
	end)
end

-- CustomCompoundType: 1=typeId, 2=map<string, NonCustomFieldValue>, 3=subFieldKeysInOrder, 4=label
local function encodePbCustomCompoundTypeInner(wb: Wire.WriteBuf, cct: any)
	encodeStringField(wb, 1, cct.typeId)
	if cct.valueSubFields ~= nil then
		for key, val in cct.valueSubFields :: {[string]: any} do
			-- Map entry: nested message with 1=key(string), 2=value(nested NonCustomFieldValue)
			encodeNested(wb, 2, function(entry)
				encodeStringField(entry, 1, key)
				-- IMPORTANT: value must be wrapped in field 2 as a nested message
				encodeNested(entry, 2, function(inner)
					encodePbNonCustomFieldValueInner(inner, val)
				end)
			end)
		end
	end
	encodeRepeatedStringField(wb, 3, cct.subFieldKeysInOrder or {})
	encodeOptionalStringField(wb, 4, cct.label)
end

-- Add CustomCompound to TYPEID_TO_ONEOF for SingleFieldType field 22
-- (Note: CustomCompound is only in SingleFieldType, not NonCustomFieldValue)

-- SingleFieldType: oneof value (fields 1-22) + label (field 23)
local function encodePbSingleFieldTypeInner(wb: Wire.WriteBuf, sft: any)
	if sft.value ~= nil then
		local typeId = sft.value.typeId :: string
		-- Check standard types first (fields 1-21)
		local mapping = TYPEID_TO_ONEOF[typeId]
		if mapping ~= nil then
			encodeNested(wb, mapping.fieldNum, function(inner)
				mapping.encode(inner, sft.value)
			end)
		elseif typeId == "CustomCompound" then
			encodeNested(wb, 22, function(inner)
				encodePbCustomCompoundTypeInner(inner, sft.value)
			end)
		else
			error(`unknown typeId for SingleFieldType: {typeId}`)
		end
	end
	encodeOptionalStringField(wb, 23, sft.label)
end
```

Then FieldGroup and TableSchema:

```luau
-- FieldGroup: 1=label, 2=startIdx(int32), 3=endIdx(int32)
local function encodePbFieldGroupInner(wb: Wire.WriteBuf, fg: any)
	encodeStringField(wb, 1, fg.label)
	encodeInt32Field(wb, 2, fg.startIdx)
	encodeInt32Field(wb, 3, fg.endIdx)
end

-- TableSchema: 1=fieldsMap(map<string, SingleFieldType>), 2=fieldKeysInOrder(repeated), 3=label, 4=groups(repeated)
local function encodePbTableSchemaInner(wb: Wire.WriteBuf, ts: any)
	-- Map field: each entry is a nested message with 1=key, 2=value
	for key, sft in ts.fieldsMap :: {[string]: any} do
		encodeNested(wb, 1, function(entry)
			encodeStringField(entry, 1, key)
			encodeNested(entry, 2, function(inner)
				encodePbSingleFieldTypeInner(inner, sft)
			end)
		end)
	end
	encodeRepeatedStringField(wb, 2, ts.fieldKeysInOrder)
	encodeStringField(wb, 3, ts.label)
	for _, fg in ts.groups :: {any} do
		encodeNested(wb, 4, function(inner)
			encodePbFieldGroupInner(inner, fg)
		end)
	end
end

function Encoder.encodePbTableSchema(ts: any): string
	local wb = Wire.WriteBuf.new()
	encodePbTableSchemaInner(wb, ts)
	return wb:tostring()
end
```

- [ ] **Step 4: Add oneof decoder + map decoder + TableSchema decoder to decoder.luau**

The field-number-to-decoder mapping (reverse of the encoder's TYPEID_TO_ONEOF):

```luau
-- Field number → decoder function for NonCustomFieldValue/SingleFieldType oneof
local ONEOF_FIELD_DECODERS: {[number]: (buffer, number, number) -> any} = {
	[1] = decodePbStringTypeFromBuf,
	[2] = decodePbNumberTypeFromBuf,
	[3] = decodePbBooleanTypeFromBuf,
	[4] = decodePbEnumTypeFromBuf,
	[5] = decodePbMultipleCheckboxTypeFromBuf,
	[6] = decodePbRadioGroupTypeFromBuf,
	[7] = decodePbPhoneFaxTypeFromBuf,
	[8] = decodePbDateTimeTypeFromBuf,
	[9] = decodePbMoneyTypeFromBuf,
	[10] = decodePbAddressTypeFromBuf,
	[11] = decodePbIndividualNameTypeFromBuf,
	[12] = decodePbCountryTypeFromBuf,
	[13] = decodePbBaseContactTypeFromBuf,
	[14] = decodePbSubmissionContactTypeFromBuf,
	[15] = decodePbSignatoryTypeFromBuf,
	[16] = decodePbBankInfoTypeFromBuf,
	[17] = decodePbBankAccountInfoTypeFromBuf,
	[18] = decodePbWireInstructionsTypeFromBuf,
	[19] = decodePbBrokerageFirmTypeFromBuf,
	[20] = decodePbBrokerageAccountTypeFromBuf,
	[21] = decodePbServiceContactPointTypeFromBuf,
}
```

Then NonCustomFieldValue, CustomCompoundType, SingleFieldType, FieldGroup, TableSchema decoders:

```luau
-- NonCustomFieldValue: oneof fields 1-21
local function decodePbNonCustomFieldValueFromBuf(buf, startOffset, endOffset)
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		local decoder = ONEOF_FIELD_DECODERS[fieldNum]
		if decoder ~= nil and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			return decoder(buf, offset, offset + len)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return nil
end

-- CustomCompoundType: 1=typeId, 2=map<string, NonCustomFieldValue>, 3=subFieldKeysInOrder, 4=label
local function decodePbCustomCompoundTypeFromBuf(buf, startOffset, endOffset)
	local typeId = ""
	local valueSubFields: {[string]: any} = {}
	local subFieldKeysInOrder: {string} = {}
	local label: string? = nil
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			typeId, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			-- Map entry
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local entryEnd = offset + len
			local key = ""
			local value: any = nil
			while offset < entryEnd do
				local fn, wt, no = Wire.decodeTag(buf, offset)
				offset = no
				if fn == 1 and wt == Wire.LENGTH_DELIMITED then
					key, offset = Wire.decodeString(buf, offset)
				elseif fn == 2 and wt == Wire.LENGTH_DELIMITED then
					local vLen: number
					vLen, offset = Wire.decodeVarint(buf, offset)
					value = decodePbNonCustomFieldValueFromBuf(buf, offset, offset + vLen)
					offset = offset + vLen
				else
					offset = Wire.skipField(buf, offset, wt)
				end
			end
			if key ~= "" then
				valueSubFields[key] = value
			end
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(subFieldKeysInOrder, val)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		typeId = typeId,
		valueSubFields = valueSubFields,
		subFieldKeysInOrder = subFieldKeysInOrder,
		label = label,
	}
end

-- SingleFieldType: oneof (fields 1-22) + label (field 23)
local function decodePbSingleFieldTypeFromBuf(buf, startOffset, endOffset)
	local value: any = nil
	local label = ""
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum >= 1 and fieldNum <= 21 and wireType == Wire.LENGTH_DELIMITED then
			local decoder = ONEOF_FIELD_DECODERS[fieldNum]
			if decoder then
				local len: number
				len, offset = Wire.decodeVarint(buf, offset)
				value = decoder(buf, offset, offset + len)
				offset = offset + len
			else
				offset = Wire.skipField(buf, offset, wireType)
			end
		elseif fieldNum == 22 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			value = decodePbCustomCompoundTypeFromBuf(buf, offset, offset + len)
			offset = offset + len
		elseif fieldNum == 23 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return { value = value, label = label }
end

-- FieldGroup: 1=label, 2=startIdx, 3=endIdx
local function decodePbFieldGroupFromBuf(buf, startOffset, endOffset)
	local label = ""
	local startIdx = 0
	local endIdx = 0
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 2 and wireType == Wire.VARINT then
			startIdx, offset = Wire.decodeInt32(buf, offset)
		elseif fieldNum == 3 and wireType == Wire.VARINT then
			endIdx, offset = Wire.decodeInt32(buf, offset)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return { label = label, startIdx = startIdx, endIdx = endIdx }
end

-- TableSchema: 1=fieldsMap(map), 2=fieldKeysInOrder, 3=label, 4=groups
local function decodePbTableSchemaFromBuf(buf, startOffset, endOffset)
	local fieldsMap: {[string]: any} = {}
	local fieldKeysInOrder: {string} = {}
	local label = ""
	local groups: {any} = {}
	local offset = startOffset
	while offset < endOffset do
		local fieldNum, wireType, newOffset = Wire.decodeTag(buf, offset)
		offset = newOffset
		if fieldNum == 1 and wireType == Wire.LENGTH_DELIMITED then
			-- Map entry
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local entryEnd = offset + len
			local key = ""
			local value: any = nil
			while offset < entryEnd do
				local fn, wt, no = Wire.decodeTag(buf, offset)
				offset = no
				if fn == 1 and wt == Wire.LENGTH_DELIMITED then
					key, offset = Wire.decodeString(buf, offset)
				elseif fn == 2 and wt == Wire.LENGTH_DELIMITED then
					local vLen: number
					vLen, offset = Wire.decodeVarint(buf, offset)
					value = decodePbSingleFieldTypeFromBuf(buf, offset, offset + vLen)
					offset = offset + vLen
				else
					offset = Wire.skipField(buf, offset, wt)
				end
			end
			if key ~= "" then
				fieldsMap[key] = value
			end
		elseif fieldNum == 2 and wireType == Wire.LENGTH_DELIMITED then
			local val: string
			val, offset = Wire.decodeString(buf, offset)
			table.insert(fieldKeysInOrder, val)
		elseif fieldNum == 3 and wireType == Wire.LENGTH_DELIMITED then
			label, offset = Wire.decodeString(buf, offset)
		elseif fieldNum == 4 and wireType == Wire.LENGTH_DELIMITED then
			local len: number
			len, offset = Wire.decodeVarint(buf, offset)
			local fg = decodePbFieldGroupFromBuf(buf, offset, offset + len)
			offset = offset + len
			table.insert(groups, fg)
		else
			offset = Wire.skipField(buf, offset, wireType)
		end
	end
	return {
		fieldsMap = fieldsMap,
		fieldKeysInOrder = fieldKeysInOrder,
		label = label,
		groups = groups,
	}
end

function Decoder.decodePbTableSchema(bytes: string): any
	local buf = buffer.fromstring(bytes)
	return decodePbTableSchemaFromBuf(buf, 0, buffer.len(buf))
end
```

- [ ] **Step 5: Run tests**

Run: `lune run test/test_main`
Expected: TableSchema round-trip test PASS (+ all previous)

- [ ] **Step 6: Commit**

```bash
git add lib/pb/encoder.luau lib/pb/decoder.luau test/test_protobuf_binary.luau
git commit -m "feat: add oneof dispatch, map encoding, TableSchema protobuf encode/decode with round-trip test"
```

---

### Task 5: Source/Target Table Encoders + Schema Registry + JSON-Binary Interop Test

**Files:**
- Modify: `lib/pb/encoder.luau`
- Modify: `lib/pb/decoder.luau`
- Create: `lib/pb/schema_registry.luau`
- Modify: `test/test_protobuf_binary.luau`

**Depends on:** Task 4

- [ ] **Step 1: Add JSON-binary interop test**

Add to `test/test_protobuf_binary.luau`:

```luau
	T.it("JSON-then-binary interop (SourceTableFieldsMap)", function()
		local fs = require("@lune/fs")
		local serde = require("@lune/serde")
		local SourceTable = require("@lib/source_table")
		local SchemaRegistry = require("@lib/pb/schema_registry")

		-- Load fixture
		local jsonStr = fs.readFile("test/fixtures/values.json")
		local jsonData = serde.decode("json", jsonStr)
		local original = SourceTable.decodeJsonSourceTableFieldsMap(jsonData)

		-- Binary round-trip
		local bytes = SchemaRegistry.encode("SourceTableFieldsMap", original)
		local decoded = SchemaRegistry.decode("SourceTableFieldsMap", bytes)

		-- Verify key fields survived the round-trip
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `lune run test/test_main`
Expected: FAIL (`@lib/pb/schema_registry` not found)

- [ ] **Step 3: Add source/target table encoders to encoder.luau**

Source table types follow the same compound wrapper pattern:

```luau
-- LpSignatoryFields: 1=asaCommitmentAmount(ST), 2=individualSubscribernameSignaturepage(ST), 3=entityAuthorizednameSignaturepage(ST)
-- LpSignatoryType: compound wrapper (1=typeId, 2=valueSubFields, 3=subFieldKeysInOrder, 4=label)
-- W9Fields: 1=w9PartiSsn1(ST), 2=w9PartiEin1(ST), 3=w9Line2(ST)
-- W9Type: compound wrapper

-- SourceTableFieldsMap (fixed fields, NOT a map):
-- 1=lpSignatory(LpSignatoryType), 2=asaFullname...Aml(StringType), 3=asaFullname...General(StringType),
-- 4=luxsentity...(MultipleCheckboxType), 5=indi...(MCT), 6=entity...(MCT), 7=w9(W9Type)

-- SourceTableSchema: 1=fieldsMap(nested SourceTableFieldsMap), 2=fieldKeysInOrder, 3=label

-- TargetTableFieldsMap (fixed fields):
-- 1=sfAgreementNullCommitmentC(MoneyType), 2=sfAccountSubscriptionInvestorName(StringType),
-- 3=sfAccount...StockExchange(RadioGroupType), 4=sfAgreement...InternationalSupplements(MCT),
-- 5=sfAgreement...SignerFirstName(ST), 6=...MiddleName(ST), 7=...LastName(ST),
-- 8=sfTaxFormW9UsTinTypeC(RadioGroupType)

-- TargetTableSchema: 1=fieldsMap(nested TargetTableFieldsMap), 2=fieldKeysInOrder, 3=label
```

Follow the same patterns established in Tasks 2-4. Each optional field is nil-checked before encoding. Nested message types use `encodeNested`.

- [ ] **Step 4: Add source/target table decoders to decoder.luau**

Mirror the encoder. Each decoder loops through field tags, matches field numbers, and delegates to the appropriate type-specific decoder.

- [ ] **Step 5: Create schema_registry.luau**

Create `lib/pb/schema_registry.luau`:

```luau
--!strict
local Encoder = require("@lib/pb/encoder")
local Decoder = require("@lib/pb/decoder")

local SchemaRegistry = {}

type CodecEntry = {
	encode: (any) -> string,
	decode: (string) -> any,
}

local registry: {[string]: CodecEntry} = {
	StringType = { encode = Encoder.encodePbStringType, decode = Decoder.decodePbStringType },
	NumberType = { encode = Encoder.encodePbNumberType, decode = Decoder.decodePbNumberType },
	BooleanType = { encode = Encoder.encodePbBooleanType, decode = Decoder.decodePbBooleanType },
	EnumType = { encode = Encoder.encodePbEnumType, decode = Decoder.decodePbEnumType },
	MultipleCheckboxType = { encode = Encoder.encodePbMultipleCheckboxType, decode = Decoder.decodePbMultipleCheckboxType },
	RadioGroupType = { encode = Encoder.encodePbRadioGroupType, decode = Decoder.decodePbRadioGroupType },
	-- All 15 compound types (each follows same pattern)
	PhoneFaxType = { encode = Encoder.encodePbPhoneFaxType, decode = Decoder.decodePbPhoneFaxType },
	DateTimeType = { encode = Encoder.encodePbDateTimeType, decode = Decoder.decodePbDateTimeType },
	MoneyType = { encode = Encoder.encodePbMoneyType, decode = Decoder.decodePbMoneyType },
	AddressType = { encode = Encoder.encodePbAddressType, decode = Decoder.decodePbAddressType },
	IndividualNameType = { encode = Encoder.encodePbIndividualNameType, decode = Decoder.decodePbIndividualNameType },
	CountryType = { encode = Encoder.encodePbCountryType, decode = Decoder.decodePbCountryType },
	BaseContactType = { encode = Encoder.encodePbBaseContactType, decode = Decoder.decodePbBaseContactType },
	SubmissionContactType = { encode = Encoder.encodePbSubmissionContactType, decode = Decoder.decodePbSubmissionContactType },
	SignatoryType = { encode = Encoder.encodePbSignatoryType, decode = Decoder.decodePbSignatoryType },
	BankInfoType = { encode = Encoder.encodePbBankInfoType, decode = Decoder.decodePbBankInfoType },
	BankAccountInfoType = { encode = Encoder.encodePbBankAccountInfoType, decode = Decoder.decodePbBankAccountInfoType },
	WireInstructionsType = { encode = Encoder.encodePbWireInstructionsType, decode = Decoder.decodePbWireInstructionsType },
	BrokerageFirmType = { encode = Encoder.encodePbBrokerageFirmType, decode = Decoder.decodePbBrokerageFirmType },
	BrokerageAccountType = { encode = Encoder.encodePbBrokerageAccountType, decode = Decoder.decodePbBrokerageAccountType },
	ServiceContactPointType = { encode = Encoder.encodePbServiceContactPointType, decode = Decoder.decodePbServiceContactPointType },
	CustomCompoundType = { encode = Encoder.encodePbCustomCompoundType, decode = Decoder.decodePbCustomCompoundType },
	-- Table schema types
	TableSchema = { encode = Encoder.encodePbTableSchema, decode = Decoder.decodePbTableSchema },
	-- Source/Target table types
	SourceTableFieldsMap = { encode = Encoder.encodePbSourceTableFieldsMap, decode = Decoder.decodePbSourceTableFieldsMap },
	SourceTableSchema = { encode = Encoder.encodePbSourceTableSchema, decode = Decoder.decodePbSourceTableSchema },
	TargetTableFieldsMap = { encode = Encoder.encodePbTargetTableFieldsMap, decode = Decoder.decodePbTargetTableFieldsMap },
	TargetTableSchema = { encode = Encoder.encodePbTargetTableSchema, decode = Decoder.decodePbTargetTableSchema },
}

function SchemaRegistry.encode(messageType: string, data: any): string
	local entry = registry[messageType]
	if entry == nil then
		error(`unknown message type: {messageType}`)
	end
	return entry.encode(data)
end

function SchemaRegistry.decode(messageType: string, bytes: string): any
	local entry = registry[messageType]
	if entry == nil then
		error(`unknown message type: {messageType}`)
	end
	return entry.decode(bytes)
end

return SchemaRegistry
```

Each registered type requires a corresponding public `Encoder.encodePb*` / `Decoder.decodePb*` function exported from their respective modules. Also add `LpSignatoryType` and `W9Type` to the registry.

- [ ] **Step 6: Run tests**

Run: `lune run test/test_main`
Expected: All 5 protobuf binary tests PASS (+ all previous tests; verify total count)

- [ ] **Step 7: Commit**

```bash
git add lib/pb/encoder.luau lib/pb/decoder.luau lib/pb/schema_registry.luau test/test_protobuf_binary.luau
git commit -m "feat: add source/target table protobuf codec, schema registry, and JSON-binary interop test"
```

---

### Task 6: Final Verification and Cleanup

**Files:**
- Verify: all `lib/pb/*.luau` files
- Verify: `test/test_main.luau`

**Depends on:** Task 5

- [ ] **Step 1: Run full test suite**

Run: `lune run test/test_main`
Expected: All tests pass. Verify the count matches expectations (9 existing + 15 wire + 5 binary = 29 total).

- [ ] **Step 2: Verify strict mode**

Run: `grep -L "strict" lib/pb/*.luau`
Expected: No output (all files have `--!strict`)

- [ ] **Step 3: Final commit if any cleanup needed**

Only commit if changes were made during cleanup. Otherwise skip.
