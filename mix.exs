defmodule StreamHash.Mixfile do
  use Mix.Project

  @github "https://github.com/ne-sachirou/stream_hash"

  def project do
    [
      app: :stream_hash,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      description:
        "Stream into SHA1, SHA2, SHA3, BLAKE2, RIPEMD-160 hash. (Hash algorithms which Erlang is supporting.)",
      dialyzer: [
        flags: [:no_undefined_callbacks],
        remove_defaults: [:unknown]
      ],
      elixir: "~> 1.7",
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.github": :test,
        "coveralls.html": :test
      ],
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.3.1",

      # Docs
      docs: [
        main: "StreamHash",
        extras: ["README.md"]
      ],
      homepage_url: @github,
      name: "StreamHash",
      source_url: @github
    ]
  end

  def application, do: [extra_applications: []]

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:inner_cotton, github: "ne-sachirou/inner_cotton", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["LICENSE", "README.md", "mix.exs", "lib"],
      licenses: ["GPL-3.0-or-later"],
      links: %{GitHub: @github},
      maintainers: ["ne_Sachirou <utakata.c4se@gmail.com>"],
      name: :stream_hash
    ]
  end
end
