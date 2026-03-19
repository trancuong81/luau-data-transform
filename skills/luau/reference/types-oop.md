# Luau OOP Patterns

## Challenge

Luau doesn't have classes. OOP uses metatables, but the type of `self` is NOT shared across methods automatically.

## Recommended Pattern

```lua
-- Step 1: Define data type
type AccountData = {
    balance: number,
    owner: string,
}

-- Step 2: Define class type using typeof + setmetatable
type Account = typeof(setmetatable({} :: AccountData, {} :: AccountMeta))

-- Step 3: Define metatable with methods
type AccountMeta = {
    __index: AccountMeta,
    new: (owner: string, balance: number) -> Account,
    deposit: (self: Account, amount: number) -> (),
    withdraw: (self: Account, amount: number) -> boolean,
    getBalance: (self: Account) -> number,
}

local Account = {} :: AccountMeta
Account.__index = Account

function Account.new(owner: string, balance: number): Account
    local self = setmetatable({
        balance = balance,
        owner = owner,
    }, Account)
    return self
end

function Account.deposit(self: Account, amount: number)
    self.balance += amount
end

function Account.withdraw(self: Account, amount: number): boolean
    if self.balance >= amount then
        self.balance -= amount
        return true
    end
    return false
end

function Account.getBalance(self: Account): number
    return self.balance
end

-- Usage:
local acc = Account.new("Alice", 100)
acc:deposit(50)                          -- method call syntax
print(acc:getBalance())                  -- 150
```

Key points:
- Must explicitly annotate `self` parameter type in each method
- Use `typeof(setmetatable(...))` to create the class type
- Methods defined with `.` (dot), called with `:` (colon)
- Future Luau versions may add shared self types automatically

## Metamethods Reference

All available metamethods in Luau:

| Metamethod | Triggered by | Signature |
|---|---|---|
| `__index` | `t.key` / `t[key]` when key missing | `(self, key) -> value` or table |
| `__newindex` | `t.key = v` / `t[key] = v` when key missing | `(self, key, value) -> ()` |
| `__call` | `t(args)` | `(self, ...) -> ...` |
| `__tostring` | `tostring(t)` | `(self) -> string` |
| `__len` | `#t` | `(self) -> number` |
| `__eq` | `a == b` (invoked even when raw-equal!) | `(self, other) -> boolean` |
| `__lt` | `a < b` | `(self, other) -> boolean` |
| `__le` | `a <= b` | `(self, other) -> boolean` |
| `__add` | `a + b` | `(self, other) -> any` |
| `__sub` | `a - b` | `(self, other) -> any` |
| `__mul` | `a * b` | `(self, other) -> any` |
| `__div` | `a / b` | `(self, other) -> any` |
| `__idiv` | `a // b` | `(self, other) -> any` |
| `__mod` | `a % b` | `(self, other) -> any` |
| `__pow` | `a ^ b` | `(self, other) -> any` |
| `__unm` | `-a` | `(self) -> any` |
| `__concat` | `a .. b` | `(self, other) -> any` |
| `__iter` | `for k,v in t do` (generalized iteration) | `(self) -> next_fn, state` |
| `__metatable` | `getmetatable(t)` returns this instead of real mt | any value |

**Not supported:** `__gc` (deliberately excluded for safety — see sandbox.md)
