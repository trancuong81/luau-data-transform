# Luau Standard Library Reference

## Global Functions

| Function | Description |
|---|---|
| `assert(value, message?)` | Error if value is falsy; returns value otherwise |
| `error(obj, level?)` | Raise error. level=0: no stack info, 1: current func (default), 2: caller |
| `type(obj)` | Returns type string: "nil", "boolean", "number", "string", "table", "function", "thread", "userdata" |
| `typeof(obj)` | Like type() but returns more specific types for userdata |
| `pcall(f, args...)` | Protected call. Returns `true, results...` or `false, errorMessage` |
| `xpcall(f, handler, args...)` | Like pcall but calls handler on error |
| `ipairs(t)` | Iterator: numeric keys 1..N until nil |
| `pairs(t)` | Iterator: all key-value pairs |
| `next(t, key?)` | Returns next key-value pair after key (or first if nil) |
| `tonumber(s, base?)` | Convert to number (base 2-36) |
| `tostring(obj)` | Convert to string (calls __tostring metamethod) |
| `select(i, ...)` | i="n": arg count; i=number: return args from position i |
| `rawget(t, k)` | Index table bypassing __index |
| `rawset(t, k, v)` | Assign bypassing __newindex |
| `rawequal(a, b)` | Compare bypassing __eq |
| `rawlen(t)` | Length bypassing __len |
| `setmetatable(t, mt)` | Set metatable; returns t |
| `getmetatable(t)` | Get metatable (returns __metatable field if set) |
| `unpack(t, i?, j?)` | Return t[i]..t[j] as multiple values. Default i=1, j=#t |

## math Library

**Constants:** `math.pi`, `math.huge` (infinity), `math.maxinteger`, `math.mininteger`

**Rounding:** `floor`, `ceil`, `round`
**Trig:** `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`
**Hyperbolic:** `sinh`, `cosh`, `tanh`
**Power/Log:** `sqrt`, `exp`, `log` (natural), `log10`, `pow`
**Comparison:** `min`, `max`, `abs`, `sign`
**Special:** `clamp(n, min, max)`, `lerp(a, b, t)`, `noise(x, y?, z?)` (Perlin), `fmod`, `modf`
**Random:** `random()` [0,1), `random(n)` [1,n], `random(m,n)` [m,n], `randomseed(seed)`

## table Library

| Function | Description |
|---|---|
| `table.insert(t, value)` | Append to end |
| `table.insert(t, pos, value)` | Insert at position, shift right |
| `table.remove(t, pos?)` | Remove at position (default: last), shift left |
| `table.sort(t, comp?)` | In-place sort. comp(a,b) returns true if a < b |
| `table.concat(t, sep?, i?, j?)` | Join elements as string |
| `table.move(a, f, e, t, dest?)` | Copy a[f..e] to dest[t..], returns dest |
| `table.create(n, value?)` | Create preallocated array of n elements |
| `table.find(t, value, init?)` | Linear search, returns index or nil |
| `table.pack(...)` | Pack varargs into table with `.n` field |
| `table.unpack(t, i?, j?)` | Unpack table to multiple values |
| `table.freeze(t)` | Make table immutable (shallow) |
| `table.isfrozen(t)` | Check if frozen |
| `table.clone(t)` | Shallow copy |
| `table.clear(t)` | Remove all entries |

## string Library

| Function | Description |
|---|---|
| `string.find(s, pattern, init?, plain?)` | Find pattern; returns start, end, captures |
| `string.match(s, pattern, init?)` | Return captures or full match |
| `string.gmatch(s, pattern)` | Iterator over all matches |
| `string.gsub(s, pattern, repl, n?)` | Replace matches. repl: string/table/function |
| `string.format(fmt, ...)` | Printf-style formatting |
| `string.sub(s, i, j?)` | Substring (1-based, negative from end) |
| `string.split(s, sep?)` | Split into array on separator |
| `string.byte(s, i?, j?)` | Character codes |
| `string.char(...)` | Codes to string |
| `string.len(s)` | Length in bytes |
| `string.rep(s, n, sep?)` | Repeat string |
| `string.reverse(s)` | Reverse |
| `string.upper(s)` / `string.lower(s)` | Case conversion |
| `string.pack(fmt, ...)` | Pack values to binary string |
| `string.unpack(fmt, s, pos?)` | Unpack binary string |
| `string.packsize(fmt)` | Size of packed format |

## Pattern Matching (NOT regex)

```
.   any character          %a  letter           %d  digit
%l  lowercase              %u  uppercase        %w  alphanumeric
%s  whitespace             %p  punctuation      %c  control
%x  hex digit              %%  literal %
[set]  character class     [^set] complement
*   0+ (greedy)            +   1+ (greedy)      -   0+ (lazy)
?   0 or 1                 ^   start            $   end
()  capture                (%d) back-reference
```

## coroutine Library

| Function | Description |
|---|---|
| `coroutine.create(f)` | Create coroutine thread |
| `coroutine.resume(co, args...)` | Resume; returns true+results or false+error |
| `coroutine.yield(args...)` | Suspend; values returned by resume |
| `coroutine.wrap(f)` | Create callable wrapper |
| `coroutine.status(co)` | "running"/"suspended"/"normal"/"dead" |
| `coroutine.running()` | Current thread |
| `coroutine.isyieldable()` | Can yield from current context |
| `coroutine.close(co)` | Close suspended coroutine |

## bit32 Library (32-bit unsigned integers)

`band`, `bor`, `bxor`, `bnot`, `lshift`, `rshift`, `arshift`, `lrotate`, `rrotate`, `extract(n, field, width?)`, `replace(n, v, field, width?)`, `countlz`, `countrz`, `byteswap`

## utf8 Library

`utf8.char(...)`, `utf8.codepoint(s, i?, j?)`, `utf8.len(s, i?, j?)`, `utf8.offset(s, n, i?)`, `utf8.codes(s)` (iterator), `utf8.charpattern`

## os Library (limited)

`os.clock()` (CPU seconds), `os.date(fmt?, time?)`, `os.time(table?)`, `os.difftime(t2, t1)`

## buffer Library

`buffer.create(size)`, `buffer.fromstring(s)`, `buffer.tostring(b)`, `buffer.len(b)`,
Read: `readi8/readu8/readi16/readu16/readi32/readu32/readf32/readf64(b, offset)`,
Write: `writei8/writeu8/.../writef64(b, offset, value)`,
`readstring/writestring(b, offset, count/value)`, `copy(dst, doff, src, soff?, count?)`, `fill(b, offset, value, count?)`

## vector Library

`vector.create(x, y, z, w?)`, `vector.magnitude(v)`, `vector.normalize(v)`,
`vector.dot(a, b)`, `vector.cross(a, b)`, `vector.angle(a, b, axis?)`,
`vector.floor/ceil/abs/sign/clamp(v, ...)`, `vector.min/max(a, b)`,
`vector.zero`, `vector.one`
