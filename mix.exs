defmodule Nostrum.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nostrum,
      version: "0.3.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "An elixir Discord library",
      package: package(),
      name: "Elixir",
      source_url: "https://github.com/kraigie/nostrum",
      homepage_url: "https://github.com/kraigie/nostrum",
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :inets],
      mod: {Nostrum.Application, []}
    ]
  end

  # How to shamelessly copied from NERVES project.
  # https://github.com/nerves-project/nerves/tree/master/docs
  def docs do
    [
      main: "intro",
      extras: extras(),
      groups_for_modules: groups_for_modules()
    ]
  end

  def extras do
    [
      "docs/static/Intro.md",
      "docs/static/API.md",
      "docs/static/State.md",
      "docs/static/Events.md",
      "docs/static/Consumers.md"
    ]
  end

  def groups_for_modules do
    [
      Api: [
        ~r/Nostrum.Api/
      ],
      Cache: [
        ~r/Nostrum.Cache/
      ],
      Structs: [
        ~r/Nostrum.Struct/
      ]
    ]
  end

  def package do
    [
      name: :nostrum,
      licenses: ["MIT"],
      maintainers: ["Craig Dazey"],
      links: %{
        "GitHub" => "https://github.com/Kraigie/nostrum/",
        "Docs" => "https://kraigie.github.io/nostrum/"
      }
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.0"},
      {:ex_doc, "~> 0.14", only: :dev},
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:websockex, git: "https://github.com/Azolo/websockex"},
      {:gen_stage, "~> 0.11"},
      {:recon, "~> 2.3", only: :dev},
      {:junit_formatter, ">= 0.0.0", only: :test}
    ]
  end
end
