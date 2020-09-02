defmodule Elixirfm.Album do
  @moduledoc "Functions for Last.fm Album endpoints."

  @method "album"

  defp req(url, args), do: Elixirfm.get_request(@method <> url, args)

  @doc """
  Search for an album by name. Returns album matches sorted by relevance.
  """
  @spec search(String.t(), keyword()) :: Elixirfm.response
  def search(query, args \\ [limit: 5, page: 1]) do
    req(".search&album=#{query}", args)
  end

  @doc """
  Get Album info.
  """
  @spec info(String.t(), String.t(), keyword()) :: Elixirfm.response
  def info(artist, album, args \\ [username: "", lang: "eng"]) do
    req(".getinfo&artist=#{artist}&album=#{album}", args)
  end

  @doc """
  *requires auth
  Gets an Albums tags applied by an individual. If not authenticated, must pass username
  """
  def tags(artist, album, args \\ []) do
    req(".gettags&artist=#{artist}&album=#{album}", args)
  end

  @doc """
  Get the top tags for an album on Last.fm, ordered by popularity.
  """
  @spec top_tags(String.t(), String.t(), keyword()) :: Elixirfm.response
  def top_tags(artist, album, args \\ [autocorrect: 0]) do
    req(".gettoptags&artist=#{artist}&album=#{album}", args)
  end
end
