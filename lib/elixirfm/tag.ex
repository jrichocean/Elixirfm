defmodule Elixirfm.Tag do
  @moduledoc """
  Wrapper for Last.fm Tags endpoints
  """
  @method "tag"

  @type tag_opts :: [page: non_neg_integer(), limit: non_neg_integer()]


  defp uri(url), do: Elixirfm.get_request(@method <> url)

  @doc """
  Get the metadata for a tag
  """
  @spec get_info(String.t(), [lang: String.t()]) :: Elixirfm.response
  def get_info(query, args \\ [lang: "eng"]),
    do: uri(".getinfo&tag=#{query}&lang=#{args[:lang]}")

  @doc """
  Search for similar tags. Returns tags ranked by similarity, based on listening data.
  """
  @spec get_similar(String.t()) :: Elixirfm.response
  def get_similar(query), do: uri(".getsimilar&tag=#{query}")

  @doc """
  Get the top albums tagged by this tag, ordered by tag count.
  """
  @spec get_top_albums(String.t(), tag_opts) :: Elixirfm.response
  def get_top_albums(query, args \\ [page: 1, limit: 15]),
    do: uri(".gettopalbums&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Get the top artists tagged by this tag, ordered by tag count.
  """
  @spec get_top_artists(String.t(), tag_opts) :: Elixirfm.response
  def get_top_artists(query, args \\ [page: 1, limit: 15]),
    do: uri(".gettopartists&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Fetches the top global tags on Last.fm, sorted by popularity (number of times used)
  """
  def top_tags(), do: uri(".getTopTags")

  @doc """
  Get the top tracks tagged by this tag, ordered by tag count.
  """
  @spec get_top_tracks(String.t(), tag_opts) :: Elixirfm.response
  def get_top_tracks(query, args \\ [page: 1, limit: 50]),
    do: uri(".gettoptracks&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")

  @doc """
  Get a list of available charts for this tag, expressed as date ranges which can be sent to the chart services.
  """
  @spec get_weekly_chart(String.t()) :: Elixirfm.response
  def get_weekly_chart(query), do: uri(".getweeklychartlist&tag=#{query}")

end
