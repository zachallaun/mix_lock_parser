# MixLockParser

MixLockParser is able to read an Elixir `mix.lock` file and return the list of dependencies used and their versions.

In the future it may be expanded to also include information about your direct
dependencies dependencies but I don't have a use-case that requires it for now
so that is currently out of scope.

- [ ] Write user-facing readme
- [ ] Support path dependencies
- [ ] Add tests for older versions of lock files

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mix_lock_parser` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mix_lock_parser, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/mix_lock_parser>.

