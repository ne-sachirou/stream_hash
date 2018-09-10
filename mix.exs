defmodule StreamHash.Mixfile do
  use Mix.Project

  @github "https://github.com/ne-sachirou/stream_hash"

  def project do
    [
      app: :stream_hash,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      description: "Stream into md5, ripemd160, sha, sha224, sha256, sha384, sha512 hash.",
      dialyzer: [
        flags: [:no_undefined_callbacks],
        remove_defaults: [:unknown]
      ],
      elixir: "~> 1.6",
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: "0.2.1",

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
