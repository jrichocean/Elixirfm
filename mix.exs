defmodule Elixirfm.Mixfile do
  use Mix.Project


  def project do
    [
      app: :elixirfm,
      version: "0.1.1",
      elixir: "~> 1.5.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]],
      dialyzer: [plt_add_deps: :transitive],
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
      {:exvcr, "~> 0.8", only: :test},
      {:httpoison, "~> 0.13.0"},
      {:poison, "~> 3.1"},

      # Documentation
      {:ex_doc, "~> 0.18.0", only: :dev},
      {:inch_ex, "~> 0.5", only: [:dev, :test]}
    ]
  end
end
