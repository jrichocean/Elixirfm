defmodule Elixirfm.Tag do
  @moduledoc "Functions for Last.fm Tags endpoints"
 
  @method "tag"

  @type tag_opts :: [page: non_neg_integer(), limit: non_neg_integer()]

  defp req(uri), do: Elixirfm.get_request(@method <> uri)
  defp req(uri, args), do: Elixirfm.get_request(@method <> uri, args)

  @doc """
  Get the metadata for a tag
  """
  @spec info(String.t(), [lang: String.t()]) :: Elixirfm.response
  def info(query, args \\ [lang: "eng"]),
    do: req(".getinfo&tag=#{query}", args)

  @doc """
  Search for similar tags. Returns tags ranked by similarity, based on listening data.
  """
  @spec similar(String.t()) :: Elixirfm.response
  def similar(query), do: req(".getsimilar&tag=#{query}")

  @doc """
  Get the top albums tagged by this tag, ordered by tag count.
  """
  @spec top_albums(String.t(), tag_opts) :: Elixirfm.response
  def top_albums(query, args \\ [page: 1, limit: 15]),
    do: req(".gettopalbums&tag=#{query}", args)

  @doc """
  Get the top artists tagged by this tag, ordered by tag count.
  """
  @spec top_artists(String.t(), tag_opts) :: Elixirfm.response
  def top_artists(query, args \\ [page: 1, limit: 15]),
    do: req(".gettopartists&tag=#{query}", args)

  @doc """
  Fetches the top global tags on Last.fm, sorted by popularity (number of times used)
  """
  def top_tags(), do: req(".getTopTags")

  @doc """
  Get the top tracks tagged by this tag, ordered by tag count.
  """
  @spec top_tracks(String.t(), tag_opts) :: Elixirfm.response
  def top_tracks(query, args \\ [page: 1, limit: 50]),
    do: req(".gettoptracks&tag=#{query}", args)

  @doc """
  Get a list of available charts for this tag, expressed as date ranges which can be sent to the chart services.
  """
  @spec weekly_chart(String.t()) :: Elixirfm.response
  def weekly_chart(query), do: req(".getweeklychartlist&tag=#{query}")

end
