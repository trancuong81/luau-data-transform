# Luau Linter Reference

## Usage

```lua
--!nolint              -- disable ALL lint warnings for this file
--!nolint UnusedLocal  -- disable specific warning
--!nolint UnusedLocal ForRange  -- disable multiple
```

Linter is separate from type checker. Lint warnings are opinionated and suppressible.

## All 28 Warning Types

### Variable Issues
1. **UnknownGlobal** — undefined global variable or typo
2. **DeprecatedGlobal** — discouraged global name
3. **GlobalUsedAsLocal** — global only used in one function → make local
4. **LocalShadow** — local shadows another local or global
7. **LocalUnused** — unused local declaration
8. **FunctionUnused** — unused function definition
9. **ImportUnused** — unused `require` result
17. **DuplicateLocal** — duplicate names in params or locals
20. **UninitializedLocal** — use before initialization
21. **DuplicateFunction** — same-name functions in same scope

### Code Structure
5. **SameLineStatement** — multiple statements on one line
6. **MultiLineStatement** — poorly formatted multi-line
12. **UnreachableCode** — dead code after return/break/continue
16. **ImplicitReturn** — inconsistent return (some paths return value, some don't)

### Type & Logic
13. **UnknownType** — invalid type name in `type()` guard string
14. **ForRange** — problematic numeric for-loop bounds
24. **DuplicateCondition** — redundant conditions in if/elseif
25. **MisleadingAndOr** — unsafe `x and y or z` where y could be falsy
28. **ComparisonPrecedence** — comparison operator precedence confusion

### Data & Operations
15. **UnbalancedAssignment** — mismatched assignment count `local a, b = 1`
18. **FormatString** — invalid format string in `string.format`/`os.date`
19. **TableLiteral** — duplicate keys in table literal
23. **TableOperations** — incorrect table library usage

### Other
10. **BuiltinGlobalWrite** — reassigning builtins like `print`, `table`
11. **PlaceholderRead** — reading `_` placeholder variable
22. **DeprecatedApi** — deprecated method/field access
26. **CommentDirective** — misspelled lint/type directive
27. **IntegerParsing** — truncated or imprecise number literal
