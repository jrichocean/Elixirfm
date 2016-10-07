defmodule Elixirfm.Tags do
  @moduledoc """
  
  """


  @doc """
  Get the metadata for a tag
  """
  def get_info(query, args \\ [lang: "eng"]) do
    Elixirfm.get_request("/?method=tag.getinfo&tag=#{query}&lang=#{args[:lang]}")
  end

  @doc """
  Search for similar tags. Returns tags ranked by similarity, based on listening data.
  """
  def get_similar(query, args \\ []) do
    Elixirfm.get_request("/?method=tag.getsimilar&tag=#{query}")
  end

  @doc """
  Get the top albums tagged by this tag, ordered by tag count.
  """
  def get_top_albums(query, args \\ [page: 1, limit: 15]) do
    Elixirfm.get_request("/?method=tag.gettopalbums&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top artists tagged by this tag, ordered by tag count.
  """
  def get_top_artists(query, args \\ [page: 1, limit: 15]) do
    Elixirfm.get_request("/?method=tag.gettopartists&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end  

  @doc """
  Fetches the top global tags on Last.fm, sorted by popularity (number of times used)
  """
  def top_tags(args \\ []) do
    Elixirfm.get_request("/?method=tag.getTopTags")
  end

  @doc """
  Get the top tracks tagged by this tag, ordered by tag count.
  """
  def get_top_tracks(query, args \\ [limit: 50, page: 1]) do
    Elixirfm.get_request("/?method=tag.gettoptracks&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get a list of available charts for this tag, expressed as date ranges which can be sent to the chart services.
  """
  def get_weekly_chart(query, args \\ []) do
    Elixirfm.get_request("/?method=tag.getweeklychartlist&tag=#{query}")
  end

end