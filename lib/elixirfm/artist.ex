defmodule Elixirfm.Artist do
  @moduledoc """
  Wrapper for Last.fm Artist endpoints.

  _Currently only supports endpoints that do not require authentication._

  todo:
    artist.addTags
    artist.getTags
    artist.removeTags
  """
  @method "artist"

  defp uri(url), do: Elixirfm.get_request(@method <> url)

  @doc """
  Search an artist
  """
  @spec search(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def search(query, args \\ [page: 1, limit: 30]),
    do: uri(".search&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Get artist info
  """
  @spec get_info(String.t(), [lang: String.t(), username: String.t()]) :: Elixirfm.response
  def get_info(query, args \\ [lang: "eng", username: ""]),
    do: uri(".getinfo&artist=#{query}&lang=#{args[:lang]}&username=#{args[:username]}")

  @doc """
  Retrive list of Similar Artists
  """
  @spec get_similar(String.t(), [limit: integer()]) :: Elixirfm.response
  def get_similar(query, args \\ [limit: 10]),
    do: uri(".getsimilar&artist=#{query}&limit=#{args[:limit]}")

  # @doc """
  # *requires auth
  # Get Lastfm tags associated with the artist
  # """
  # def get_tags(query, args \\ []) do
  #   uri(".getTags&artist=#{query}")
  # end

  @doc """
  Get Top albums for an artist, ordered by popularity
  """
  @spec get_top_album(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def get_top_album(query, args \\ [page: 1, limit: 30]),
    do: uri(".gettopalbums&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Gets top tags for an artist on Lastfm, ordered by popularity
  """
  @spec get_top_tags(String.t()) :: Elixirfm.response
  def get_top_tags(query), do: uri(".gettoptags&artist=#{query}")

  @doc """
  Gets top tracks for an artist, ordered by popularity. (defaults to first 15)
  """
  @spec get_top_tracks(String.t(), [page: integer(), limit: integer()]) :: Elixirfm.response
  def get_top_tracks(query, args \\ [page: 1, limit: 15]) do
    uri(".gettoptracks&artist=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
  """
  @spec get_correction(String.t()) :: Elixirfm.response
  def get_correction(query), do: uri(".getcorrection&artist=#{query}")

end
