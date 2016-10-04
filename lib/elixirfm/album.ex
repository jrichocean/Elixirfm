defmodule Elixirfm.Album do
  @moduledoc """
  Wrapper for Last.fm Album endpoints.

  _Currently only supports endpoints that do not require authentication._

  To-do:
    1. album.getTags
    2. album.removeTag
  """
  use HTTPoison.Base

  @endpoint_base "http://ws.audioscrobbler.com/"


  @doc """
  Search for an album by name. Returns album matches sorted by relevance.
  """
  def search(query, args \\ [api_version: "2.0",limit: 5, page: 1]) do
    get!(args[:api_version] <> "?method=album.search&album=#{query}")
  end

  @doc """
  Get Album info.
  """
  def get_info(artist, album, args \\ [api_version: "2.0", username: "", lang: "eng"]) do
    get!(args[:api_version] <> "/?method=album.getinfo&artist=#{artist}&album=#{album}&username=" <> args[:username] <> "&lang=" <> args[:lang])
  end

  @doc """
  *requires auth
  Gets an Albums tags applied by an individual. If not authenticated, must pass username
  """
  # def get_tags(artist, album, args \\ [api_version: "2.0"]) do
  #   get!(args[:api_version] <> "/?method=album.gettags&artist=#{artist}&album=#{album}")
  # end

  @doc """
  Get the top tags for an album on Last.fm, ordered by popularity.
  """
  def get_top_tags(artist, album, args \\ [api_version: "2.0"]) do
    get!(args[:api_version] <> "/?method=album.gettoptags&artist=#{artist}&album=#{album}")
  end

  def process_url(url), do: @endpoint_base <> url <> "&api_key=" <> Elixirfm.lastfm_key <> "&format=json"
  def process_response_body(body), do: body |> Poison.decode!
end
