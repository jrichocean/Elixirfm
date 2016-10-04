defmodule Elixirfm.Tags do
  @moduledoc """
  
  """
  use HTTPoison.Base

  @endpoint_base "http://ws.audioscrobbler.com/"


  @doc """
  Get the metadata for a tag
  """
  def get_info(query, args \\ [api_version: "2.0", lang: "eng"]) do
    get!(args[:api_version] <> "/?method=tag.getinfo&tag=#{query}&lang=#{args[:lang]}")
  end

  @doc """
  Search for similar tags. Returns tags ranked by similarity, based on listening data.
  """
  def get_similar(query, args \\ [api_version: "2.0"]) do
    get!(args[:api_version] <> "/?method=tag.getsimilar&tag=#{query}")
  end

  @doc """
  Get the top albums tagged by this tag, ordered by tag count.
  """
  def get_top_albums(query, args \\ [api_version: "2.0", page: 1, limit: 15]) do
    get!(args[:api_version] <> "/?method=tag.gettopalbums&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top artists tagged by this tag, ordered by tag count.
  """
  def get_top_artists(query, args \\ [api_version: "2.0", page: 1, limit: 15]) do
    get!(args[:api_version] <> "/?method=tag.gettopartists&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end  

  @doc """
  Fetches the top global tags on Last.fm, sorted by popularity (number of times used)
  """
  def top_tags(args \\ [api_version: "2.0"]) do
    get!(args[:api_version] <> "/?method=tag.getTopTags")
  end

  @doc """
  Get the top tracks tagged by this tag, ordered by tag count.
  """
  def get_top_tracks(query, args \\ [api_version: "2.0", limit: 50, page: 1]) do
    get!(args[:api_version] <> "/?method=tag.gettoptracks&tag=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  @doc """
  Get a list of available charts for this tag, expressed as date ranges which can be sent to the chart services.
  """
  def get_weekly_chart(query, args \\ [api_version: "2.0"]) do
    get!(args[:api_version] <> "/?method=tag.getweeklychartlist&tag=#{query}")
  end


  def process_url(url), do: @endpoint_base <> url <> "&api_key=" <> Elixirfm.lastfm_key <> "&format=json"
  def process_response_body(body), do: body |> Poison.decode!

end
