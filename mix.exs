defmodule LastfmElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :lastfm_elixir,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [
        :logger
      ]
    ]
  end


  # Dependencies
  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"}
    ]
  end
end
