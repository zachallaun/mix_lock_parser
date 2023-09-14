# MixLockParser

MixLockParser is able to read an Elixir `mix.lock` file and return the list of
dependencies used and their versions.

In the future it may be expanded to also include information about your direct
dependencies dependencies but I don't have a use-case that requires it for now
so that is currently out of scope.

```iex
iex> contents = """
...> %{
...>   "contex": {:hex, :contex, "0.5.0", "5d8a6defbeb41f54adfcb0f85c4756d4f2b84aa5b0d809d45a5d2e90d91d0392", [:mix], [{:nimble_strftime, "~> 0.1.0", [hex: :nimble_strftime, repo: "hexpm", optional: false]}], "hexpm", "b7497a1790324d84247859df44ba4bcf2489d9bba1812a5375b2f2046b9e6fd7"},
...>   "dotenv_parser": {:hex, :dotenv_parser, "2.0.0", "0f999196857e4ee18cbba1413018d5e4980ab16b397e3a2f8d0cf541fe683181", [:mix], [], "hexpm", "e769bde2dbff5b0cd0d9d877a9ccfd2c6dd84772dfb405d5a43cceb4f93616c5"}
...> }
...> """
iex> MixLockParser.read_mix_lock_contents!(contents)
[{:contex, :hex, "0.5.0"}, {:dotenv_parser, :hex, "2.0.0"}]

# Or you can read directly from a file
iex> MixLockParser.read_mix_lock!("priv/sample_lockfiles/short_mix.lock")
[{:nimble_parsec, :hex, "1.3.1"}]
```

- [x] Write user-facing readme
- [ ] Support path dependencies
- [x] Add tests for older versions of lock files

## Installation

This package is not currently on hex but can be installed by adding
`mix_lock_parser` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mix_lock_parser, github: "axelson/mix_lock_parser"},
  ]
end
```
