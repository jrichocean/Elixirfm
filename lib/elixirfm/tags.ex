defmodule Elixirfm.Tags do
  @moduledoc """
  Wrapper for Last.fm Tags endpoints
  """

  @type tag_opts :: [page: non_neg_integer(), limit: non_neg_integer()]

  @doc false
  def endpoint(), do: "tag"

  @doc """
  Get the metadata for a tag
  """
  @spec get_info(String.t(), [lang: String.t()]) :: Elixirfm.response
  def get_info(query, args \\ [lang: "eng"]) do
    Elixirfm.get_request("#{endpoint()}.getinfo&tag=#{query}&lang=#{args[:lang]}")
  end

  @doc """
  Search for similar tags. Returns tags ranked by similarity, based on listening data.
  """
  @spec get_similar(String.t()) :: Elixirfm.response
  def get_similar(query) do
    Elixirfm.get_request("#{endpoint()}.getsimilar&tag=#{query}")
  end

  @doc """
  Get the top albums tagged by this tag, ordered by tag count.
  """
  @spec get_top_albums(String.t(), tag_opts) :: Elixirfm.response
  def get_top_albums(query, args \\ [page: 1, limit: 15]) do
    Elixirfm.get_request("#{endpoint()}.gettopalbums&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top artists tagged by this tag, ordered by tag count.
  """
  @spec get_top_artists(String.t(), tag_opts) :: Elixirfm.response
  def get_top_artists(query, args \\ [page: 1, limit: 15]) do
    Elixirfm.get_request("#{endpoint()}.gettopartists&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Fetches the top global tags on Last.fm, sorted by popularity (number of times used)
  """
  def top_tags() do
    Elixirfm.get_request("#{endpoint()}.getTopTags")
  end

  @doc """
  Get the top tracks tagged by this tag, ordered by tag count.
  """
  @spec get_top_tracks(String.t(), tag_opts) :: Elixirfm.response
  def get_top_tracks(query, args \\ [page: 1, limit: 50]) do
    Elixirfm.get_request("#{endpoint()}.gettoptracks&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get a list of available charts for this tag, expressed as date ranges which can be sent to the chart services.
  """
  @spec get_weekly_chart(String.t()) :: Elixirfm.response
  def get_weekly_chart(query) do
    Elixirfm.get_request("#{endpoint()}.getweeklychartlist&tag=#{query}")
  end

end
