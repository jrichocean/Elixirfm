defmodule Elixirfm.Artist do
  @moduledoc """
  Functions for Last.fm Artist endpoints.

  todo:
    artist.addTags
    artist.removeTags
  """
  
  @method "artist"

  defp uri(url), do: Elixirfm.get_request(@method <> url)
  defp uri(url, args), do: Elixirfm.get_request(@method <> url, args)

  @doc """
  Search an artist
  """
  @spec search(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def search(query, args \\ [page: 1, limit: 30]),
    do: uri(".search&artist=#{query}", args)

  @doc "Get artist info"
  @spec info(String.t(), [lang: String.t(), username: String.t()]) :: Elixirfm.response
  def info(query, args \\ [lang: "eng", username: ""]),
    do: uri(".getinfo&artist=#{query}", args)

  @doc "Retrive list of Similar Artists"
  @spec similar(String.t(), [limit: integer()]) :: Elixirfm.response
  def similar(query, args \\ [limit: 10]),
    do: uri(".getsimilar&artist=#{query}", args)

  @doc "Get Lastfm tags associated with the artist"
  def tags(query, args \\ []), do: uri(".getTags&artist=#{query}", args)

  @doc """
  Get Top albums for an artist, ordered by popularity
  """
  @spec top_album(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def top_album(query, args \\ [page: 1, limit: 30]),
    do: uri(".gettopalbums&artist=#{query}", args)

  @doc """
  Gets top tags for an artist on Lastfm, ordered by popularity
  """
  @spec top_tags(String.t()) :: Elixirfm.response
  def top_tags(query), do: uri(".gettoptags&artist=#{query}")

  @doc """
  Gets top tracks for an artist, ordered by popularity. (defaults to first 15)
  """
  @spec top_tracks(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def top_tracks(query, args \\ [page: 1, limit: 15]) do
    uri(".gettoptracks&artist=#{query}", args)
  end

  @doc """
  Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
  """
  @spec correction(String.t()) :: Elixirfm.response
  def correction(query), do: uri(".getcorrection&artist=#{query}")

end
