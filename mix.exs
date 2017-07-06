defmodule StreamHash.Mixfile do
  use Mix.Project

  def project do
    [
      app: :stream_hash,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: "Stream into md4, md5, ripemd160, sha, sha224, sha256, sha384, sha512 hash.",
      package: package(),
      aliases: aliases(),
      deps: deps(),
      # Docs
      name: "StreamHash",
      source_url: "https://github.com/ne-sachirou/stream_hash",
      homepage_url: "https://github.com/ne-sachirou/stream_hash",
      docs: [
        main: "StreamHash",
        extras: ["README.md"],
      ],
    ]
  end

  def application do
    [extra_applications: []]
  end

  defp deps do
    [
      {:credo, "~> 0.7", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:inch_ex, "~> 0.5", only: [:dev, :test], runtime: false},
    ]
  end

  defp aliases do
    [
      "lint": ["credo --strict", "inch", "dialyzer --halt-exit-status"],
    ]
  end

  defp package do
    [
      licenses: ["GPL-3.0"],
      name: :stream_hash,
      maintainers: ["ne_Sachirou <utakata.c4se@gmail.com>"],
      links: %{
        "GitHub": "https://github.com/ne-sachirou/stream_hash",
      },
      files: ["LICENSE", "README.md", "mix.exs", "lib"]
    ]
  end
end
