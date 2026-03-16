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

function WriteBufMethods.ensure(self: any, bytes: number)
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

function WriteBufMethods.tostring(self: any): string
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
	local impl: any = wb
	impl:ensure(5) -- max 5 bytes for 32-bit varint
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
	local impl: any = wb
	local len = #str
	Wire.encodeVarint(wb, len)
	impl:ensure(len)
	buffer.writestring(impl.buf, impl.pos, str)
	impl.pos += len
end

function Wire.encodeDouble(wb: WriteBuf, value: number)
	local impl: any = wb
	impl:ensure(8)
	buffer.writef64(impl.buf, impl.pos, value)
	impl.pos += 8
end

function Wire.encodeFixed32(wb: WriteBuf, value: number)
	local impl: any = wb
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

function Wire.encodeBytes(wb: WriteBuf, bytes: string)
	Wire.encodeString(wb, bytes)
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
