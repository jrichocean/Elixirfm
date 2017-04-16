defmodule Elixirfm.Mixfile do
  use Mix.Project


  def project do
    [
      app: :elixirfm,
      version: "0.0.8",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]],
      description: description()
    ]
  end

  def description do
    "Lastfm API client for Elixir"
  end

  def package do
    [
      name: :elixirfm,
      maintainers: ["Joshua Richardson"],
      licenses: ["MIT"],
      docs: [extras: ["README.md"]],
      links: %{"GitHub" => "https://github.com/jrichocean/Elixirfm"}
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [
        :logger,
        :httpoison
      ]
    ]
  end

  # Dependencies
  defp deps do
    [
      {:credo, "~> 0.6", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.0"},

      # Documentation
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.14.5", only: :dev},
      {:inch_ex, "~> 0.5", only: [:dev, :test]}
    ]
  end
end
