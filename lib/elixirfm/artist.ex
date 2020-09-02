defmodule Elixirfm.Artist do
  @moduledoc """
  Functions for Last.fm Artist endpoints.

  todo:
    artist.addTags
    artist.removeTags
  """

  @method "artist"

  defp req(uri), do: Elixirfm.get_request(@method <> uri)
  defp req(uri, args), do: Elixirfm.get_request(@method <> uri, args)

  @doc """
  Search an artist
  """
  @spec search(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def search(query, args \\ [page: 1, limit: 30]),
    do: req(".search&artist=#{query}", args)

  @doc "Get artist info"
  @spec info(String.t(), [lang: String.t(), username: String.t()]) :: Elixirfm.response
  def info(query, args \\ [lang: "eng", username: ""]),
    do: req(".getinfo&artist=#{query}", args)

  @doc "Retrive list of Similar Artists"
  @spec similar(String.t(), [limit: integer()]) :: Elixirfm.response
  def similar(query, args \\ [limit: 10]),
    do: req(".getsimilar&artist=#{query}", args)

  @doc "Get Lastfm tags associated with the artist"
  def tags(query, args \\ []), do: req(".getTags&artist=#{query}", args)

  @doc """
  Get Top albums for an artist, ordered by popularity
  """
  @spec top_album(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def top_album(query, args \\ [page: 1, limit: 30]),
    do: req(".gettopalbums&artist=#{query}", args)

  @doc """
  Gets top tags for an artist on Lastfm, ordered by popularity
  """
  @spec top_tags(String.t()) :: Elixirfm.response
  def top_tags(query), do: req(".gettoptags&artist=#{query}")

  @doc """
  Gets top tracks for an artist, ordered by popularity. (defaults to first 15)
  """
  @spec top_tracks(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def top_tracks(query, args \\ [page: 1, limit: 15]) do
    req(".gettoptracks&artist=#{query}", args)
  end

  @doc """
  Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
  """
  @spec correction(String.t()) :: Elixirfm.response
  def correction(query), do: req(".getcorrection&artist=#{query}")

end
