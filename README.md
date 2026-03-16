# luau-data-transform

Data transformation pipeline in Luau, running on the Lune runtime. Port of the OCaml reference implementation.

## Prerequisites

- [Lune](https://github.com/lune-org/lune) v0.10+ — standalone Luau runtime

Install via:
```bash
# macOS
brew install lune-org/tap/lune
# or cargo
cargo install lune-cli
# or aftman
aftman add lune-org/lune
```

## Project Structure

```
lib/            Core library modules
test/           Test suites
test/fixtures/  JSON test data
proto/          Protobuf schemas and constants (from OCaml repo)
bin/            CLI entry points
```

## Run Tests

```bash
lune run test/test_main
```

## Run CLI

```bash
lune run bin/main test/fixtures/values.json
```

## Module Conventions

- All imports use `@` aliases: `require("@lib/module_name")`
- All files use `--!strict` mode
- Aliases configured in `.luaurc`
