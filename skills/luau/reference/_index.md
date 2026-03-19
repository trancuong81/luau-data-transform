# Luau Reference Index

Quick lookup for Claude — find the right file by topic.

| File | Topics Covered |
|---|---|
| `syntax.md` | String/number literals, continue, compound assignments, if-then-else expressions, generalized iteration, string interpolation, floor division, type annotation syntax |
| `types-overview.md` | Type inference modes (nocheck/nonstrict/strict), structural typing, type casts, module considerations, cyclic deps |
| `types-basic.md` | Primitives (nil/string/number/boolean/table/function/thread/userdata/vector/buffer), unknown, never, any, function types, variadic types, type packs, singleton/literal types |
| `types-tables.md` | Unsealed vs sealed vs generic tables, table indexers, array shorthand `{T}`, width subtyping |
| `types-unions-intersections.md` | Union types `\|`, intersection types `&`, tagged unions / discriminated unions, Result pattern, overloaded functions |
| `types-generics.md` | Generic functions, type parameters `<T>`, inference, limitations (no defaults) |
| `types-refinements.md` | Type narrowing via truthy tests, `type()` guards, equality checks, composability with and/or/not, assert() |
| `types-oop.md` | OOP patterns with metatables, self annotation, Account class pattern, full metamethod list |
| `types-functions.md` | Type functions (analysis-time), types library API (singleton, generic, copy, unionof, intersectionof, optional, negationof, newtable, newfunction) |
| `library.md` | Standard library: globals, math, table, string, coroutine, bit32, utf8, os, debug, buffer, vector |
| `performance.md` | Interpreter architecture, table optimization, import resolution, fastcall builtins, GC tuning, native code gen, O2 optimizations |
| `compatibility.md` | Luau vs Lua 5.1: removed features, added features from 5.2+, implementation limits, behavioral differences |
| `lint.md` | 28 lint warnings: variable issues, code structure, type/logic, data operations, suppression syntax |
| `sandbox.md` | Security model: removed libraries, environment isolation, no __gc, CPU/memory control, interrupt mechanism |
| `grammar.md` | Formal EBNF grammar specification |
