defmodule Elixirfm.Mixfile do
  use Mix.Project


  def project do
    [
      app: :elixirfm,
      version: "0.0.5",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]],
      description: description
    ]
  end

  def description do
    "Lastfm API client for Elixir"
  end

  def package do
    [
      name: :elixirfm,
      maintainers: ["Joshua Richardson"],
      licenses: ["Apache 2.0"],
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
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"},

      # Documentation
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
