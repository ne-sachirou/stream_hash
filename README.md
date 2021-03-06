[![Actions Status](https://github.com/ne-sachirou/stream_hash/workflows/test/badge.svg)](https://github.com/ne-sachirou/stream_hash/actions)
[![Coverage Status](https://coveralls.io/repos/github/ne-sachirou/stream_hash/badge.svg)](https://coveralls.io/github/ne-sachirou/stream_hash)
[![Hex.pm](https://img.shields.io/hexpm/v/stream_hash.svg)](https://hex.pm/packages/stream_hash)

# StreamHash

Stream into SHA1, SHA2, SHA3, BLAKE2, RIPEMD-160 hash. (Hash algorithms which Erlang is supporting.)

```elixir
"test/fixture/xyzxyz.txt"
|> File.stream!
|> StreamHash.hash(:sha512)
|> Enum.into("")

# <<215, 133, 241, 243, 115, 159, 59, 127, 111, 242, 140, 106, 171, 211, 130, 48,
#   174, 198, 241, 236, 195, 112, 105, 150, 106, 133, 78, 249, 2, 178, 132, 254,
#   50, 181, 85, 46, 183, 97, 187, 7, 38, 17, 26, 188, 232, 143, 152, 210, 71, 54,
#   245, 48, 107, 70, 180, 43, 96, 26, 69, 90, 17, 156, 111, 65>>
```

[Docs](https://hexdocs.pm/stream_hash/).

## Installation

Add `stream_hash` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:stream_hash, "~> 0.3"}]
end
```
