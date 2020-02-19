defmodule StreamHashTest do
  use ExUnit.Case, async: true

  doctest StreamHash

  describe "hash/2" do
    for algorithm <-
          try(
            do: :crypto.supports(:hashs),
            rescue: (_ in UndefinedFunctionError -> :crypto.supports()[:hashs])
          ) do
      @tag algorithm: algorithm
      test "#{algorithm}", %{algorithm: algorithm} do
        hash = :crypto.hash(algorithm, "xyzxyz\n")

        assert hash ==
                 "test/fixture/xyzxyz.txt"
                 |> File.stream!()
                 |> StreamHash.hash(algorithm)
                 |> Enum.into("")
      end
    end
  end
end
