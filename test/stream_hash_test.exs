defmodule StreamHashTest do
  use ExUnit.Case, async: true

  doctest StreamHash

  describe "hash/2" do
    for algorithm <- [:md4, :md5, :ripemd160, :sha, :sha224, :sha256, :sha384, :sha512] do
      @tag algorithm: algorithm
      test "#{algorithm}", %{algorithm: algorithm} do
        hash = :crypto.hash algorithm, "xyzxyz\n"
        assert [hash] == "test/fixture/xyzxyz.txt" |> File.stream! |> StreamHash.hash(algorithm) |> Enum.to_list
      end
    end
  end
end
