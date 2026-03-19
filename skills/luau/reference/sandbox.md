# Luau Sandbox Security Model

## Design Philosophy

Safety through: removing unsafe stdlib features, adding VM-level isolation, memory safety via fuzzing.

## Removed/Restricted Libraries

**Completely removed:** `io`, `package`, `debug` (full), `dofile`, `loadfile`, `module`

**Restricted:**
- `os`: only `clock`, `date`, `difftime`, `time` remain
- `collectgarbage`: only "count" argument
- `newproxy`: only true/false/nil arguments
- `loadstring`: no bytecode loading (source strings only)

## Environment Isolation

- All builtin library tables are readonly (VM-level protection)
- String metatable is readonly
- Global table is readonly
- Per-script global tables use `__index` to reference builtins

## No `__gc` Metamethod

Deliberately excluded because:
- Runs in arbitrary thread context (breaks isolation)
- Creates use-after-free risks
- Requires defensive coding on all exposed methods
- Luau uses tag-based destructors instead (host-only)

## CPU/Memory Control

**Interrupt mechanism:** VM provides global interrupt handler. Host can terminate scripts.
- Guaranteed to trigger at function calls or loop iterations
- Cannot be bypassed by Luau code

## Bytecode Security

VM assumes bytecode came from Luau compiler. No bytecode serialization exposed to scripts.
