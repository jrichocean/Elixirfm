# Elixirfm

Last.fm API wrapper for Elixir. [(Documentation)](https://hexdocs.pm/elixirfm/)

_Currently supports all non-authenticated endpoints._

### Installation

The package can be installed by:

1. Add `elixirfm` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:elixirfm, "~> 0.0.11"}]
  end
  ```

2. Ensure `elixirfm` is started in your application:

  ```elixir
  def application do
    [
      applications: [
        :elixirfm
      ]
    ]
  end
  ```

3. Configure API key for LastFm's API by setting Application var in your config

  ```elixir
  config :elixirfm,
     api_key: "<your API key>"
     secret_key: "<your SECRET key>"
  ```

  or by setting system env var with

  ```bash
  $ export LASTFM_SECRET_KEY="<your SECRET key>" LASTFM_API_KEY="<your API key>"
  ```
