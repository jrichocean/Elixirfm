# Elixirfm

**LastFm API**

## Installation

Last.fm API wrapper for Elixir. [(Documentation)](https://hexdocs.pm/elixirfm/0.0.4)

_Currently only supports non-authenticated endpoints._

The package can be installed by:

1. Add `elixirfm` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:elixirfm, "~> 0.0.4"}]
  end
  ```

2. Ensure `elixirfm` is started in your application:

  ```elixir
  def application do
    [applications: [:elixirfm]]
  end
  ```

3. Configure API key for LastFm's API

  ```elixir
  config :elixirfm,

     api_key: "<your API key>"

     secret_key: "<your SECRET key>"
  ```
