defmodule StreamHash do
  @moduledoc """
  Stream into SHA1, SHA2, SHA3, BLAKE2, RIPEMD-160 hash. (Hash algorithms which Erlang is supporting.)
  """

  @type hash_algorithms ::
          :blake2b
          | :blake2s
          | :ripemd160
          | :sha
          | :sha224
          | :sha256
          | :sha384
          | :sha3_224
          | :sha3_256
          | :sha3_384
          | :sha3_512
          | :sha512

  @doc """
  Stream into hash.

      iex> :crypto.hash :sha256, "xyzxyz"
      <<39, 48, 232, 165, 240, 181, 53, 170, 235, 10, 6, 92, 81, 0, 80, 44, 98, 156, 191, 32, 80, 240, 113, 154, 64, 73, 230, 192, 127, 22, 146, 205>>

      iex> ["xyz"] |> Stream.cycle |> Stream.take(2) |> StreamHash.hash(:sha256) |> Enum.into("")
      <<39, 48, 232, 165, 240, 181, 53, 170, 235, 10, 6, 92, 81, 0, 80, 44, 98, 156, 191, 32, 80, 240, 113, 154, 64, 73, 230, 192, 127, 22, 146, 205>>
  """
  @spec hash(Enumerable.t(), hash_algorithms) :: Enumerable.t()
  def hash(enum, algorithm) do
    transform_with_final(
      enum,
      :crypto.hash_init(algorithm),
      &{[], :crypto.hash_update(&2, &1)},
      &{[:crypto.hash_final(&1)], &1}
    )
  end

  @spec transform_with_final(Enumerable.t(), acc, fun, final_fun) :: Enumerable.t()
        when fun: (Stream.element(), acc -> {Enumerable.t(), acc} | {:halt, acc}),
             final_fun: (acc -> {Enumerable.t(), acc} | {:halt, acc}),
             acc: any
  defp transform_with_final(enum, acc, reducer, final_fun) do
    ref = make_ref()

    enum
    |> Stream.concat([ref])
    |> Stream.transform(acc, fn
      ^ref, acc -> final_fun.(acc)
      element, acc -> reducer.(element, acc)
    end)
  end
end
